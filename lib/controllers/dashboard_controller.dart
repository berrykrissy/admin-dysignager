import 'dart:async';
import 'dart:html' as html;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:signage/controllers/base_controller.dart';
import 'package:signage/models/advertisement_model.dart';
import 'package:signage/models/locations_model.dart';
import 'package:signage/models/marker_model.dart';
import 'package:signage/models/content_model.dart';
import 'package:signage/models/schedule.model.dart';
import 'package:signage/models/screens_details_model.dart';
import 'package:signage/routes/app_pages.dart';
import 'package:signage/services/firebase/firebase_storage_service.dart';
import 'package:signage/services/firebase/firestore_service.dart';
import 'package:signage/utils/constants.dart';
//import 'package:video_thumbnail/video_thumbnail.dart';

class DashboardController extends BaseController {

  DashboardController(FirestoreService this._service, FirebaseStorageService this._storage) {
    debugPrint("DashboardController Constructor");
  }
  //#region Firabase Instances
  final FirestoreService _service;
  final FirebaseStorageService _storage;
  //#endregion
  RxBool isLoading = false.obs;
  //#region Rx List
  final _locations = <LocationsModel>[].obs;
  final _advertisement = <AdvertisementModel>[].obs;
  final _schedule = <ScheduleModel>[].obs;
  
  final RxList<MarkerModel> _markerModelList = new List<MarkerModel>.empty().obs;
  final RxList<ScreensDetailsModel> _screenDetailslList = new List<ScreensDetailsModel>.empty().obs;
  final RxList<ContentsModel> _contentsDetailslList = new List<ContentsModel>.empty().obs;
  //#endregion
  //#region Text Editing Controllers
  final TextEditingController? nameController = TextEditingController();
  final TextEditingController? locationController = TextEditingController();
  //final RxString spinnerValue = "".obs;
  final TextEditingController? clientController = TextEditingController();
  final Rx<TextEditingController?> dateFromController = TextEditingController().obs;
  final Rx<TextEditingController?> dateToController = TextEditingController().obs;
  final TextEditingController? durationController = TextEditingController();
  final TextEditingController? mediaUrlController = TextEditingController();
  //#endregion
  PlatformFile? file = null;
  final RxString liveFileName = "".obs, liveFileSize = "".obs, liveFileExtension = "".obs;
  Rx<Uint8List> liveFileBytes = Uint8List.fromList([0]).obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    processLocationsOnScreens();
    //processLocationsByID();
    processAdvertisement();
    //processSchedule();
    //processScheduleByDate();
    //_getCoordinates();
  }

  void processSchedule() async {
    final snapshot = await _service.getSchedule();
    for (final item in snapshot) {
      _schedule.add(item);
    }
    debugPrint("schedule running start-----------");
    _schedule.forEach((element) =>
      debugPrint("mediaUrl: ${element.advertisement?.mediaUrl} | locationId: ${element.locationId}")
    );
    debugPrint("schedule running end-------------");
  }

  void processAdvertisement() async {
    final snapshot = await _service.getAdvertisement();
    for (final item in snapshot) {
      _advertisement.add(item);
    }
    debugPrint("advertisement running start--------------");
    _advertisement.forEach((element) {
      debugPrint("document-id: ${element.id} ${element.mediaName} ${element.mediaUrl} ${element.mediaType} ${element.duration} ${element.startDate} ${element.endDate} }");
      _contentsDetailslList.add( ContentsModel (
        id: element.id,
        client: element.client,
        fileName: "${element.mediaName}.${element.mediaType}",
        startDate: element.startDate.toString(),
        endDate: element.endDate.toString(),
        duration: element.duration.toString()
      ) );
    });    
    debugPrint("advertisement running end----------------");
  }

  void processCreateAdvertisement() async {
    final data = AdvertisementModel (
        mediaType: "jpg",
        mediaUrl: "https://th.bing.com/th/id/R.c13bfb9af48998d980d2720d10e6e877?rik=TW%2f5uKcY5qawKg&riu=http%3a%2f%2f2.bp.blogspot.com%2f-1UcODLZ_QQc%2fT5D95yt1txI%2fAAAAAAAAAdg%2f25vGOqNqIE8%2fs1600%2fHectic.jpg&ehk=rvNF4nwjJgbL9bCAC%2f9gX5d7WcRCIaRNDY2uBXcdrgs%3d&risl=&pid=ImgRaw&r=0",
        duration: 30,
        startDate: DateTime.now(),
        endDate: DateTime.now().add(const Duration(days: 1)));

    await _service.createAdvertisement(data.toMap());
  }

  void processUpdateAdvertisement() async {
    final data = AdvertisementModel(
        id: "uAvB8YNmJEZiQYPLoWD3",
        mediaType: "mov",
        mediaUrl: "https://th.bing.com/th/id/R.c13bfb9af48998d980d2720d10e6e877?rik=TW%2f5uKcY5qawKg&riu=http%3a%2f%2f2.bp.blogspot.com%2f-1UcODLZ_QQc%2fT5D95yt1txI%2fAAAAAAAAAdg%2f25vGOqNqIE8%2fs1600%2fHectic.jpg&ehk=rvNF4nwjJgbL9bCAC%2f9gX5d7WcRCIaRNDY2uBXcdrgs%3d&risl=&pid=ImgRaw&r=0",
        duration: 30,
        startDate: DateTime.now(),
        endDate: DateTime.now().add(const Duration(days: 1)));

    await _service.updateAdvertisement(data.id, data.toMap());
  }

  void processLocationsOnScreens() async {
    final snapshot = await _service.getLocations();
    for (final item in snapshot) {
      debugPrint("DashboardController snapshot ${item.id}");
      _locations.add(item);
    }
   debugPrint("service running start------------");
    _locations.forEach( (newValue) {
      _markerModelList.add (
          MarkerModel (
            id: newValue.id,
            name: newValue.name,
            latitude: newValue.gps?.latitude ?? 0,
            longitude: newValue.gps?.longitude ?? 0,
            status: newValue.isEnabled == true ? newValue.status : Constants.DISABLED,
            isSelected: false
          )
        );
      
      _screenDetailslList.add (
          ScreensDetailsModel (
            id: newValue.id,
            name: newValue.name,
            status: newValue.isEnabled == true ? newValue.status : Constants.DISABLED,
            onlineSince: newValue.onlineSince.toString(),
            location: newValue.address,
            isShowed: true
          )
        );
    });
    _markerModelList.add (MarkerModel(latitude: 0.00, longitude: 0.00));
   debugPrint("service running end--------------");
  }

  void processLocationsByID() async {
    final snapshot = await _service.getLocationById("QwKiM6iJQTEtWFa3yqJQ");
   debugPrint("locationByID running--------");
   debugPrint("LocationByID: ${snapshot.name} | ${snapshot.address} ");
  }

  void processScheduleByDate() async {
    final snapshot = await _service.getScheduleByDate(
        DateTime.parse("2023-06-06"), DateTime.parse("2023-06-06"));
    for (final item in snapshot) {
      _locations.add(item);
    }
   debugPrint("locationByDate running--------");
    _locations.forEach((element)  {
      debugPrint("location ${element.name} ${element.gps?.latitude} ${element.gps?.longitude} ${element.status} ${element.onlineSince}");
    });
  }

  void onRefresh() {
    Timer(
      const Duration(milliseconds: 3000), ( () => html.window.location.reload() )
    );
  }

  void onShowAlert(String title, String message) {
    Timer (
      const Duration(milliseconds: 2000), ( () => Get.snackbar(title, message) )
    );
  }

  Future<void> onUpdateStatus() async {
    final snapshot = await _service.getLocations();
    bool isRefresh = false;
    for (var newItem in snapshot) {
      final oldList = _locations.where( (oldItem) => oldItem.id == newItem.id); //final _oldList = _screenDetailslList.where( (oldItem) => oldItem.id == newItem.id);
      final bool isNotEmpty = oldList.isNotEmpty;
      final bool isStatusOnline = oldList.firstOrNull?.status == Constants.ONLINE;
      //final bool isOnlineSinceNotSame = oldList.firstOrNull?.onlineSince != newItem.onlineSince;
      final int onlineDifference = DateTime.now().difference(newItem.onlineSince ?? DateTime.now().subtract(const Duration(days: 1))).inMinutes;
      debugPrint("DashboardController isNotEmpty $isNotEmpty");
      debugPrint("DashboardController isStatusOnline $isStatusOnline");
      //debugPrint("DashboardController $isOnlineSinceNotSame");
      debugPrint("DashboardController onlineDifference $onlineDifference");
      debugPrint("DashboardController onlineDifference > 2 ${onlineDifference > 2}");
      debugPrint("DashboardController DateTime.now() ${DateTime.now()}");
      debugPrint("DashboardController newItem location  ${newItem.id} ${newItem.name} ${newItem.onlineSince}");
      debugPrint("DashboardController oldList location  ${oldList?.firstOrNull?.id} ${oldList?.firstOrNull?.name} ${oldList?.firstOrNull?.onlineSince}");
      if (isNotEmpty && isStatusOnline && onlineDifference > 2) {
        _service.updateLocation (
          newItem?.id, 
          LocationsModel (
            name: newItem?.name,
            address: newItem?.address,
            gps: newItem.gps,
            onlineSince: newItem.onlineSince,
            status: Constants.OFFLINE,
            isEnabled: newItem?.isEnabled,
          ).toMap()
        );
        //isRefresh = true;
      }
    }
    if (isRefresh) {
      //onRefresh();
    }
  }

  @override
  void onReady() {
    super.onReady();
    debugPrint("DashboardController onReady");
    onUpdateStatus();
    Timer.periodic ( const Duration(minutes: 1), (timer) async {
        onUpdateStatus();
      }
    );
  }
  //#region Page Launchers
  void launchFindScreen() {
    debugPrint("DashboardController launchFindScreen");
    Get.toNamed(Routes.FIND_SCREEN);
  }

  void launchScreens() {
    debugPrint("DashboardController launchScreens");
    Get.toNamed(Routes.SCREENS);
  }

  void launchContents() {
    debugPrint("DashboardController launchContents");
    Get.toNamed(Routes.CONTENTS);
  }

  void launchLogout() {
    debugPrint("DashboardController launchLogout");
    Get.defaultDialog(
      title: "Logging Out",
      middleText: "Are you sure you want to logout",
      onConfirm: () {
        Get.offAndToNamed(Routes.LOGIN);
      },
    );
  }
  //#endregion
  //#region Maker Methods
  List<MarkerModel> getMarkers() {
    return _markerModelList.value.where( (model) => model.name != null ).toList();
  }

  RxString getMarkersQuantity(String? status) {
    if (status == Constants.ONLINE) {
      return _markerModelList.value
          .where((model) => model.status == Constants.ONLINE)
          .length
          .toString()
          .obs;
    } else if (status == Constants.OUT_OF_SYNC) {
      return _markerModelList.value
          .where((model) => model.status == Constants.OUT_OF_SYNC)
          .length
          .toString()
          .obs;
    } else if (status == Constants.OFFLINE) {
      return _markerModelList.value
          .where((model) => model.status == Constants.OFFLINE)
          .length
          .toString()
          .obs;
    } else if (status == Constants.DISABLED) {
      return _markerModelList.value
          .where((model) => model.status == Constants.DISABLED)
          .length
          .toString()
          .obs;
    } else {
      return 0.toString().obs;
    }
  }

  Color? getColour(String? status) {
    if (status == Constants.ONLINE) {
      return Constants.GREEN_ONLINE;
    } else if (status == Constants.OUT_OF_SYNC) {
      return Constants.RED_OUT_OF_SYNC;
    } else if (status == Constants.OFFLINE) {
      return Constants.GRAY_OFFLINE;
    } else if (status == Constants.DISABLED) {
      return Constants.BLUE_DISABLED;
    } else {
      return null;
    }
  }

  String getPin(String? status) {
    if (status == Constants.ONLINE) {
      return "assets/OnlinePin.webp";
    } else if (status == Constants.OUT_OF_SYNC) {
      return "assets/OutofSyncPin.webp";
    } else if (status == Constants.OFFLINE) {
      return "assets/OfflinePin.webp";
    } else if (status == Constants.DISABLED) {
      return "assets/DisabledPin.webp";
    } else {
      throw UnimplementedError();
    }
  }
  //#endregion
  //#region GPS Location Methods
  Future<bool> _handleLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      onShowAlert("GPS", "Location services are disabled. Please enable the services");
      return false;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        onShowAlert("GPS", "Location permissions are denied");
        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      onShowAlert("GPS","Location permissions are permanently denied, we cannot request permissions.");
      return false;
    }
    return true;
  }

  Future<void> _updateStaus(MarkerModel markerModel, ScreensDetailsModel screensDetailsModel, LocationsModel locationsModel, bool isEnabled) async {
    _service.updateStatus (
      markerModel.id, 
      LocationsModel (
        name: screensDetailsModel.name,
        address: screensDetailsModel.location,
        gps: GeoPoint(markerModel.latitude, markerModel.longitude),
        onlineSince: DateTime.parse(screensDetailsModel.onlineSince!),
        status: locationsModel.status,
        isEnabled: isEnabled,
      ).toMap()
    );  
  }

  Future<void> _addMarkerWithCoordinates() async {
    if(await _handleLocationPermission()) {
      Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
      _markerModelList.add (MarkerModel(latitude: position.latitude, longitude: position.longitude, status: null));
    }
  }

   Future<void> _insertMarker(int index, String? name, String? status) async {
    if(await _handleLocationPermission()) {
      Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
      _markerModelList.insert (index, MarkerModel(name: name, latitude: position.latitude, longitude: position.longitude, status: status));
    }
  }
  //#endregion
  //#region Screen Views Methods
  Future<void> onSelectCardScreen(int index) async {
    debugPrint("DashboardController onSelectCardScreen $index");
    isLoading(true);
    if (_markerModelList.value[index].name != null) {
      _markerModelList.value.forEach((model) {
        if (model.isSelected == true) {
          model.isSelected = false;
        }
      });
      _markerModelList.value[index].isSelected = true;
      _onFilterScreenDetails(_markerModelList.value[index].name);
    }
    isLoading(false);
  }

  Future<void> onAddScreen() async {
    debugPrint("DashboardController onAddScreen ${nameController?.text} ${locationController?.text}");
    try {
      isLoading(true);
      if(nameController?.text.isBlank == false/*&& locationController?.text.isBlank == false*/) {
        /*
        _insertMarker(_screenDetailslList.length, nameController?.text, Constants.OUT_OF_SYNC);
        _screenDetailslList.add ( 
          ScreensDetailsModel (
            name: nameController?.text, status: Constants.OUT_OF_SYNC, onlineSince: null, location: locationController?.text, isShowed: true
          )
        );
        */
        _service.createLocation (
          LocationsModel (
            name: nameController!.text,
            address: null,
            gps: null,
            onlineSince: null,
            status: Constants.OFFLINE,
            isEnabled: false,
          ).toMap()
        );
        onResetScreenSelection();
        onRefresh();
      } else {
        onShowAlert("Error", "Inputs Invalid");
      }
    } catch (e) {
      onShowAlert("Error", "on Add Screen Failed");
    } finally {
      isLoading(false);
      Get.back();
    }       
  }

  int getScreensViewLength() {
    return _markerModelList.value.length;
  }

  MarkerModel getScreensView(int index) {
    return _markerModelList.value[index];
  }

  Rx<Color> getScreensViewColourBorderSide(int index) {
    if (_markerModelList.value[index].isSelected == true) {
      return Constants.PURPLE.obs;
    } else {
      return Constants.GRAY_OFFLINE.obs;
    }
  }

  Color getNavigationColorLink(String text, String? selectedLink) {
    if (text == selectedLink) {
      return Constants.PURPLE;
    } else {
      return Constants.GRAY_OFFLINE;
    }
  }

  Color? getScreensViewColour(int index) {
    return getColour(_markerModelList.value[index].status);
  }

  bool isIconVisible(int index) {
    if (_markerModelList.value[index].name == null) {
      return true;
    } else {
      return false;
    }
  }

  String getScreensViewName(int index) {
    debugPrint("DashboardController getScreensViewName $index ${_markerModelList.value[index].name}");
    return _markerModelList.value[index].name ?? "";
  }
  //#endregion
  //#region Screen Details Methods
  Future<void> _onFilterScreenDetails(String? name) async {
    isLoading(true);
    if (name != null) {
      _screenDetailslList.value.forEach((model) {
        if (model.name == name) {
          model.isShowed = true;
        } else {
          model.isShowed = false;
        }
      });
    }
    isLoading(false);
  }

  Future<void> onResetScreenSelection() async {
    isLoading(true);
    _markerModelList.value.forEach( (model) {
      if (model.isSelected == true) {
        model.isSelected = false;
      }
    } );
    _screenDetailslList.value.forEach( (model) {
      model.isShowed = true;
    });
    isLoading(false);
  }

  List<ScreensDetailsModel> getScreensDetails() {
    return _screenDetailslList.where((model) => model.isShowed == true).toList();
  }

  int getScreensDetailsLength() {
    return _screenDetailslList.where((model) => model.isShowed == true).length;
  }

  getScreenDetailsId(int index) {
    return _screenDetailslList
      .where((model) => model.isShowed == true)
      .toList()[index]
      .id ?? "Nil";
  }

  getScreenDetailsName(int index) {
    return _screenDetailslList
      .where((model) => model.isShowed == true)
      .toList()[index]
      .name ?? "Nil";
  }

  getScreenDetailsStatus(int index) {
    return _screenDetailslList
      .where((model) => model.isShowed == true)
      .toList()[index]
      .status ?? "Nil";
  }

  String getScreenDetailsOnlineSince(int index) {
    return _screenDetailslList
      .where((model) => model.isShowed == true)
      .toList()[index]
      .onlineSince ?? "Nil";
  }

  String getScreenDetailsLocation(int index) {
    return _screenDetailslList.where( (model) => model.isShowed == true ).toList()[index].location ?? "Nil";
  }

  Future<void> onToggleScreenDetailsStatus(String? id) async {
    try {
      isLoading(true);
      _updateStaus (
        _markerModelList.where((model) => model.id == id).first, 
        _screenDetailslList.where((model) => model.id == id).first,
        _locations.where((model) => model.id == id).first,
        _locations.where((model) => model.id == id).first.isEnabled != true
      );    
      onRefresh();
    } catch (e) {
      onShowAlert("Error", "Cannot Update Status");
    } finally {
      isLoading(false);
    }
  }

  Future<void> onDeleteScreenDetails(String? id) async {
    try {
      isLoading(true);
      _screenDetailslList.removeWhere((model) => model.id == id);
      _markerModelList.removeWhere((model) => model.id == id);
      _service.deleteLocation(id);
    } catch (e) {
      onShowAlert("Error", "Cannot Delete Screen");
    } finally {
      isLoading(false);
      onRefresh();
    }
  }
  
  IconData getStatusEnabledIcon(String? id) {
    if (_locations.where((model) => model.id == id).first.isEnabled == true) {
      return CupertinoIcons.eye;
    } else {
      return CupertinoIcons.eye_slash;
    }
  }
  //#endregion
  //#region Contents Methods
  List<String?> getScreenList() {
    //spinnerValue(_markerModelList.where((model) => model.name != null).map((model) => model.name).toList()[0]);
    return _markerModelList.where((model) => model.name != null).map((model) => model.name).toList();
  }

  List<ContentsModel> getContentsDetails() {
    return _contentsDetailslList.value;
  }

  int getContentsDetailsLength() {
    return _contentsDetailslList.length;
  }

  String getContentDetailsClient(int index) {
    return _contentsDetailslList[index].client ?? "Nil";
  }

  String getContentDetailsStartDate(int index) {
    return _contentsDetailslList[index].startDate ?? "Nil";
  }

  String getContentDetailsEndDate(int index) {
    return _contentsDetailslList[index].endDate ?? "Nil";
  }

  String getContentDetailsDuration(int index) {
    return _contentsDetailslList[index].duration ?? "Nil";
  }

  String getContentDetailsFileName(int index) {
    return _contentsDetailslList[index].fileName ?? "Nil";
  }

  Future<void> onDeleteContentDetails(String? id) async {
    try {
      isLoading(true);
      _contentsDetailslList.removeWhere((model) => model.id == id);
      _service.deleteAdvertisement(id);
    } catch (e) {
      onShowAlert("Error", "Cannot Delete Content");
    } finally {
      isLoading(false);
      onRefresh();
    }
  }

  DateTime _toDateTime(String? date) {
    return DateFormat("MM/dd/yyyy").parse(date!);
  }

  Future<void> onUpload() async {
    debugPrint("DashboardController onUpload");
    try {
      isLoading(true);
      TaskSnapshot? taskSnapshot = await _storage.uploadPlatformFiles(file);
      if (taskSnapshot != null && taskSnapshot!.state == TaskState.success) {
        debugPrint("onUpload taskSnapshot ${await taskSnapshot.ref.getDownloadURL()}");
        final data = AdvertisementModel (
          client: clientController?.text,
          mediaName: liveFileName.value,
          mediaType: liveFileExtension.value,
          mediaUrl: await taskSnapshot.ref.getDownloadURL(),
          duration: int.tryParse(durationController?.text ?? "30"),
          startDate: _toDateTime(dateFromController.value?.text),
          endDate: _toDateTime(dateToController.value?.text),
        );
        await _service.createAdvertisement(data.toMap());
        onRefresh();
      } else {
        //Get.back();
        onShowAlert("Error", "on Upload Media Content Failed");
        debugPrint("Error on Upload Media Content Failed");
      }
    } catch (e) {
      //Get.back();
      onShowAlert("Error", "on Upload Media Content Failed");
      debugPrint("Error on Upload Media Content Failed");
    } finally {
      liveFileName(""); 
      liveFileExtension("");
      liveFileBytes(Uint8List.fromList([0]));
      isLoading(false);
      Get.back();
    }
  }

  Future<void> onPickFiles() async {
    const type = FileType.custom; //FileType.media
    final extensions = ['mp4', 'jpg', 'png', 'webp'];
    final result = await pickFiles(type, extensions);
    openFile(result?.files?.single/*result?.files.first*/);
  }
  
  Future<FilePickerResult?> pickFiles(FileType type, List<String>? extensions) async {
    return await FilePicker.platform.pickFiles(type: type, allowedExtensions: extensions);
  }
  
  Future<void> openFile(PlatformFile? file) async {
    debugPrint("MainController openFile(PlatformFile name ${file?.name})");
    debugPrint("MainController openFile(PlatformFile size ${file?.size})");
    debugPrint("MainController openFile(PlatformFile extension ${file?.extension})");
    debugPrint("MainController openFile(PlatformFile bytes ${file?.bytes})");
    isLoading(true);
    this.file = file;
    final kb = file!.size / 1024;
    final mb = kb / 1024;
    final fileSize = mb >= 1 ? '${mb.toStringAsFixed(2)} MB' : '${kb.toStringAsFixed(2)} KB';
    liveFileName(file?.name?.split('.').first);
    liveFileSize(fileSize);
    liveFileExtension(file?.extension);
    if (file?.extension?.toLowerCase()?.contains("jpg") == true || file?.extension?.toLowerCase()?.contains("png") == true || file?.extension?.toLowerCase()?.contains("webp") == true) {
      liveFileBytes(file?.bytes);
    } else {
      /*
      final uint8list = await VideoThumbnail.thumbnailData(
      video: file.path ?? "",
      imageFormat: ImageFormat.JPEG,
      maxWidth: 128,
      // specify the width of the thumbnail, let the height auto-scaled to keep the source aspect ratio
      quality: 25,
      );
      liveFileBytes(uint8list);
      */
      //Todo: Still finding out how to implement Video Thumbnail
      liveFileBytes(file?.bytes);
    }
    isLoading(false);
  }
  //#endregion
  @override
  void onClose() {
    debugPrint("DashboardController onClose");
    super.onClose();
  }
}