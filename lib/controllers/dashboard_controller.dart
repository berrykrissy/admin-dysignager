import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:signage/controllers/base_controller.dart';
import 'package:signage/models/advertisement_model.dart';
import 'package:signage/models/locations_model.dart';
import 'package:signage/models/marker_model.dart';
import 'package:signage/models/content_model.dart';
import 'package:signage/models/schedule.model.dart';
import 'package:signage/models/screens_details_model.dart';
import 'package:signage/routes/app_pages.dart';
import 'package:signage/services/cloudfirestore/firestore_service.dart';
import 'package:signage/utils/constants.dart';
//import 'package:video_thumbnail/video_thumbnail.dart';

class DashboardController extends BaseController {

  DashboardController(FirestoreService this._dbService) {
    debugPrint("DashboardController Constructor");
  }

  final locations = <LocationsModel>[].obs;
  final advertisement = <AdvertisementModel>[].obs;
  final schedule = <ScheduleModel>[].obs;

  final FirestoreService _dbService;
  RxBool isLoading = false.obs;
  final RxList<MarkerModel> _markerModelList = new List<MarkerModel>.empty().obs;
  final RxList<ScreensDetailsModel> _screenDetailslList = new List<ScreensDetailsModel>.empty().obs;
  final RxList<ContentsModel> _contentsDetailslList = new List<ContentsModel>.empty().obs;

  final TextEditingController? nameController = TextEditingController();
  final TextEditingController? locationController = TextEditingController();

  final RxString spinnerValue = "".obs;
  final Rx<TextEditingController?> dateFromController = TextEditingController().obs;
  final Rx<TextEditingController?> dateToController = TextEditingController().obs;
  final TextEditingController? durationController = TextEditingController();
  final TextEditingController? mediaUrlController = TextEditingController();
  
  final RxString liveFileName = "".obs, liveFileExtension = "".obs;
  Rx<Uint8List> liveFileBytes = Uint8List.fromList([0]).obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    processLocationsOnScreens();
    processLocationsByID();    
    processAdvertisement();
    processSchedule();
    processScheduleByDate();
    //_getCoordinates();
  }

  processSchedule() async {
    final snapshot = await _dbService.getSchedule();
    for (final item in snapshot) {
      schedule.add(item);
    }
    debugPrint("schedule running start-----------");
    schedule.forEach((element) =>
      debugPrint("mediaUrl: ${element.advertisement?.mediaUrl} | locationId: ${element.locationId}")
    );
    debugPrint("schedule running end-------------");
  }

  processAdvertisement() async {
    final snapshot = await _dbService.getAdvertisement();
    for (final item in snapshot) {
      advertisement.add(item);
    }
    debugPrint("advertisement running start--------------");
    advertisement.forEach((element) {
      debugPrint("document-id: ${element.id} ${element.mediaUrl} ${element.mediaType} ${element.duration} ${element.startDate} ${element.endDate} }");
      _contentsDetailslList.add( ContentsModel (
         contractNumber: "contruct no",
         client: "client",
         fileName: "Sample.${element.mediaType}",
         startDate: element.startDate.toString(),
         endDate: element.endDate.toString(),
         //location: element.location.toString(),
         duration: element.duration.toString()
      ) );

    });    
    debugPrint("advertisement running end----------------");
  }

  processCreateAdvertisement() async {
    final data = AdvertisementModel(
        location: "1155 Purok 1, San Mateo, 1850 Rizal",
        mediaType: "jpg",
        mediaUrl:
            "https://th.bing.com/th/id/R.c13bfb9af48998d980d2720d10e6e877?rik=TW%2f5uKcY5qawKg&riu=http%3a%2f%2f2.bp.blogspot.com%2f-1UcODLZ_QQc%2fT5D95yt1txI%2fAAAAAAAAAdg%2f25vGOqNqIE8%2fs1600%2fHectic.jpg&ehk=rvNF4nwjJgbL9bCAC%2f9gX5d7WcRCIaRNDY2uBXcdrgs%3d&risl=&pid=ImgRaw&r=0",
        duration: 30,
        startDate: DateTime.now(),
        endDate: DateTime.now().add(const Duration(days: 1)));

    await _dbService.createAdvertisement(data.toMap());
  }

  processUpdateAdvertisement() async {
    final data = AdvertisementModel(
        id: "uAvB8YNmJEZiQYPLoWD3",
        location: "undefined location to be exact",
        mediaType: "mov",
        mediaUrl:
            "https://th.bing.com/th/id/R.c13bfb9af48998d980d2720d10e6e877?rik=TW%2f5uKcY5qawKg&riu=http%3a%2f%2f2.bp.blogspot.com%2f-1UcODLZ_QQc%2fT5D95yt1txI%2fAAAAAAAAAdg%2f25vGOqNqIE8%2fs1600%2fHectic.jpg&ehk=rvNF4nwjJgbL9bCAC%2f9gX5d7WcRCIaRNDY2uBXcdrgs%3d&risl=&pid=ImgRaw&r=0",
        duration: 30,
        startDate: DateTime.now(),
        endDate: DateTime.now().add(const Duration(days: 1)));

    await _dbService.updateAdvertisement(data.id, data.toMap());
  }

  processLocationsOnScreens() async {
    final snapshot = await _dbService.getLocations();
    for (final item in snapshot) {
      locations.add(item);
    }
   debugPrint("service running start------------");
    locations.forEach((element) {
      _markerModelList.add (
        MarkerModel (
          name: element.name,
          latitude: element.gps?.latitude ?? 0,
          longitude: element.gps?.longitude ?? 0,
          status: element.status,
          isSelected: false
        )
      );
      _screenDetailslList.add (
        ScreensDetailsModel (
        name: element.name,
        status: element.status,
        onlineSince: element.onlineSince,
        preview: "nil",
        isShowed: true
        )
      );
    });
    _markerModelList.add (MarkerModel(latitude: 0.00, longitude: 0.00));
   debugPrint("service running end--------------");
  }

  processLocationsByID() async {
    final snapshot = await _dbService.getLocationById("QwKiM6iJQTEtWFa3yqJQ");

   debugPrint("locationByID running--------");
   debugPrint("LocationByID: ${snapshot.name} | ${snapshot.address} ");
  }

  processScheduleByDate() async {
    final snapshot = await _dbService.getScheduleByDate(
        DateTime.parse("2023-06-06"), DateTime.parse("2023-06-06"));
    for (final item in snapshot) {
      locations.add(item);
    }
   debugPrint("locationByDate running--------");
    locations.forEach((element)  {
      debugPrint("location ${element.name} ${element.gps?.latitude} ${element.gps?.longitude} ${element.status} ${element.onlineSince}");
    });
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
      Get.snackbar(
          "GPS", "Location services are disabled. Please enable the services");
      return false;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        Get.snackbar("GPS", "Location permissions are denied");
        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      Get.snackbar("GPS",
          "Location permissions are permanently denied, we cannot request permissions.");
      return false;
    }
    return true;
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
    if (_markerModelList.value[index].name == null) {
      Get.snackbar("Test", "Add Icon");
    } else {
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
    if(nameController?.text.isBlank == false && locationController?.text.isBlank == false) {
      isLoading(true);
      _insertMarker(_screenDetailslList.length, nameController?.text, Constants.OUT_OF_SYNC);
      _screenDetailslList.add ( 
        ScreensDetailsModel (
          name: nameController?.text, status: Constants.OUT_OF_SYNC, onlineSince: null, location: locationController?.text, preview: null, isShowed: true
        )
      );
      onResetScreenSelection();
      isLoading(false);
      Get.back();
    } else {
      Get.snackbar("Error", "Inputs Invalid");
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

  int getScreensDetailsLength() {
    return _screenDetailslList.where((model) => model.isShowed == true).length;
  }

  getScreenDetailsName(int index) {
    return _screenDetailslList
            .where((model) => model.isShowed == true)
            .toList()[index]
            .name ??
        "Nil";
  }

  getScreenDetailsStatus(int index) {
    return _screenDetailslList
            .where((model) => model.isShowed == true)
            .toList()[index]
            .status ??
        "Nil";
  }

  String getScreenDetailsOnlineSince(int index) {
    return _screenDetailslList
            .where((model) => model.isShowed == true)
            .toList()[index]
            .onlineSince ??
        "Nil";
  }

  String getScreenDetailsLocation(int index) {
    return _screenDetailslList.where( (model) => model.isShowed == true ).toList()[index].location ?? "Nil";
  }
  
  String getScreenDetailsPreview(int index) {
    return _screenDetailslList
            .where((model) => model.isShowed == true)
            .toList()[index]
            .preview ??
        "Nil";
  }

  Future<void> onDeleteScreenDetails(String name) async {
    debugPrint("DashboardController onDeleteScreenDetails $name");
    isLoading(true);
    _screenDetailslList.removeWhere((model) => model.name == name);
    _markerModelList.removeWhere((model) => model.name == name);
    isLoading(false);
  }
  //#endregion
  //#region Contents Methods
  List<String?> getScreenList() {
    spinnerValue(_markerModelList.where((model) => model.name != null).map((model) => model.name).toList()[0]);
    return _markerModelList.where((model) => model.name != null).map((model) => model.name).toList();
  }

  int getContentsDetailsLength() {
    return _contentsDetailslList.length;
  }

  String getContentDetailsContractNumber(int index) {
    return _contentsDetailslList[index].contractNumber ?? "Nil";
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

  Future<void> onDeleteContentDetails(int index) async {
    debugPrint("DashboardController onDeleteContentDetails $index");
    isLoading(true);
    _contentsDetailslList.removeAt(index);
    isLoading(false);
  }

  Future<void> onUpload() async {
    isLoading(true);
    //Todo: On Going
    liveFileName(""); 
    liveFileExtension("");
    liveFileBytes(Uint8List.fromList([0]));
    isLoading(false);
    Get.back();
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
    final kb = file!.size / 1024;
    final mb = kb / 1024;
    final fileSize = mb >= 1 ? '${mb.toStringAsFixed(2)} MB' : '${kb.toStringAsFixed(2)} KB';
    liveFileName("${file?.name} ${fileSize}");
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