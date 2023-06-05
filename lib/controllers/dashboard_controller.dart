import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:signage/controllers/base_controller.dart';
import 'package:signage/models/marker_model.dart';
import 'package:signage/models/content_model.dart';
import 'package:signage/models/screens_details_model.dart';
import 'package:signage/routes/app_pages.dart';
import 'package:signage/utils/constants.dart';
//import 'package:signage/utils/server.dart';
//import 'package:socket_io/socket_io.dart';

class DashboardController extends BaseController {
  
  DashboardController(/*Server this._server*/) {
    debugPrint("DashboardController Constructor");
  }

  //final Server _server;
  RxBool isLoading = false.obs;
  //final screensScrollController = ScrollController();
  final RxList<MarkerModel> _markerModelList = new List<MarkerModel>.empty().obs;
  final RxList<ScreensDetailsModel> _screenDetailslList = new List<ScreensDetailsModel>.empty().obs;
  final RxList<ContentsModel> _contentsDetailslList = new List<ContentsModel>.empty().obs;
  final TextEditingController? dateFromController = TextEditingController();
  final TextEditingController? dateToController = TextEditingController();

  @override
  Future<void> onInit() async {
    super.onInit();
    _initializeList();
    /*
    var nsp = _server.of('/some');
    nsp.on('connection', (client) {
      debugPrint('DashboardController connection /some');
      client.on('msg', (data) {
        debugPrint('DashboardController data from /some => $data');
        client.emit('fromServer', "ok 2");
      });
    });
    _server.on('connection', (client) {
      debugPrint('DashboardController connection default namespace');
      client.on('msg', (data) {
        debugPrint('DashboardController data from default => $data');
        client.emit('fromServer', "ok");
      });
    });
    _server.listen(3000);
    */
    //_server.initialize();
  }

  void _initializeList() { //TODO: List are Test Data need to implement soon
    _markerModelList.add (
      MarkerModel (
        name: "Screen 1", latitude: 12.8797, longitude: 121.7740, status: Constants.ONLINE, isSelected: false
      )
    );
    _markerModelList.add (
      MarkerModel (
        name: "Screen 2", latitude: 13.00, longitude: 120.7740, status: Constants.OUT_OF_SYNC, isSelected: false
      )
    );
    _markerModelList.add (
      MarkerModel (
        name: "Screen 3", latitude: 51.509364, longitude: -0.1289280, status: Constants.OFFLINE, isSelected: false
      )
    );
    _markerModelList.add (
      MarkerModel (
        name: "Screen 4", latitude: 14.00, longitude: 130.00, status: Constants.DISABLED, isSelected: false  
      )
    );

    _screenDetailslList.add (
      ScreensDetailsModel (
        name: "Screen 1", status: Constants.ONLINE, onlineSince: "04/25/23", preview: "nil", isShowed: true
      )
    );
    _screenDetailslList.add (
      ScreensDetailsModel (
        name: "Screen 2", status: Constants.OUT_OF_SYNC, onlineSince: "04/25/23", preview: "nil", isShowed: true
      )
    );
    _screenDetailslList.add (
      ScreensDetailsModel (
        name: "Screen 3", status: Constants.OFFLINE, onlineSince: "04/25/23", preview: "nil", isShowed: true
      )
    );
    _screenDetailslList.add (
      ScreensDetailsModel (
        name: "Screen 4", status: Constants.DISABLED, onlineSince: "04/25/23", preview: "nil", isShowed: true
      )
    );

    _contentsDetailslList.add (
      ContentsModel (
        mediaUploaded: "Photo.jpg", screenToDisplay: "04/25/23", dateToPublish: "04/25/2023 to 05/25/2023", duration: "30"
      )
    );

    _contentsDetailslList.add (
      ContentsModel (
        mediaUploaded: "Video.mp4", screenToDisplay: "04/25/23", dateToPublish: "04/25/2023 to 05/25/2023", duration: "60"
      )
    );
    
    _getCoordinates();
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
  /*
  void launchSettings() {
    debugPrint("DashboardController launchSettings");
    Get.toNamed(Routes.SETTINGS);
  }
  */
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
    return _markerModelList.value.where(
      (model) => model.name != null
    ).toList();
  }

  RxString getMarkersQuantity(String? status) {
    if(status == Constants.ONLINE) {
      return _markerModelList.value.where(
        (model) => model.status == Constants.ONLINE
      ).length.toString().obs;
    } else if(status == Constants.OUT_OF_SYNC) {
      return _markerModelList.value.where(
        (model) => model.status == Constants.OUT_OF_SYNC
      ).length.toString().obs;
    } else if(status == Constants.OFFLINE) {
      return _markerModelList.value.where(
        (model) => model.status == Constants.OFFLINE
      ).length.toString().obs;
    } else if(status == Constants.DISABLED) {
      return _markerModelList.value.where(
        (model) => model.status == Constants.DISABLED
      ).length.toString().obs;
    } else {
      return 0.toString().obs;
    }
  }

  Color? getColour(String? status) {
    if(status == Constants.ONLINE) {
      return Constants.GREEN_ONLINE;
    } else if(status == Constants.OUT_OF_SYNC) {
      return Constants.RED_OUT_OF_SYNC;
    } else if(status == Constants.OFFLINE) {
      return Constants.GRAY_OFFLINE;
    } else if(status == Constants.DISABLED) {
      return Constants.BLUE_DISABLED;
    } else {
      return null;
    }
  }

  String getPin(String? status) {
    if(status == Constants.ONLINE) {
      return "assets/OnlinePin.webp";
    } else if(status == Constants.OUT_OF_SYNC) {
      return "assets/OutofSyncPin.webp";
    } else if(status == Constants.OFFLINE) {
      return "assets/OfflinePin.webp";
    } else if(status == Constants.DISABLED) {
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
      Get.snackbar("GPS","Location services are disabled. Please enable the services");
      return false;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {   
        Get.snackbar("GPS","Location permissions are denied");
        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      Get.snackbar("GPS","Location permissions are permanently denied, we cannot request permissions.");
      return false;
    }
    return true;
  }

  Future<void> _getCoordinates() async {
    if(await _handleLocationPermission()) {
      Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
      _markerModelList.add (MarkerModel(latitude: position.latitude, longitude: position.longitude, status: null));
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
      _markerModelList.value.forEach( (model) {
        if (model.isSelected == true) {
          model.isSelected = false;
        }
      } );
      _markerModelList.value[index].isSelected = true;
      _onFilterScreenDetails(_markerModelList.value[index].name);
    }
    isLoading(false);
  }

  int getScreensViewLength() {
    return _markerModelList.value.length;
  }

  MarkerModel getScreensView(int index) {
    return _markerModelList.value[index]; //_screenViewList.value[index];
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
    return _markerModelList.value[index].name ?? "";
  }
  //#endregion
  //#region Screen Details Methods
  Future<void> _onFilterScreenDetails(String? name) async {
    isLoading(true);
    if (name != null) {
      _screenDetailslList.value.forEach( (model) {
        if (model.name == name) {
          model.isShowed = true;
        } else {
          model.isShowed = false;
        }
      } );
    }
    isLoading(false);
  }

  Future<void> onFilterResetScreenDetails() async {
    isLoading(true);
    _screenDetailslList.value.forEach( (model) {
      model.isShowed = true;
    } );
    isLoading(false);
  }

  int getScreensDetailsLength() {
    return _screenDetailslList.where( (model) => model.isShowed == true ).length;
  }

  String getScreenDetailsName(int index) {
    return _screenDetailslList.where( (model) => model.isShowed == true ).toList()[index].name ?? "Nil";
  }

  String getScreenDetailsStatus(int index) {
    return _screenDetailslList.where( (model) => model.isShowed == true ).toList()[index].status ?? "Nil";
  }
  
  String getScreenDetailsOnlineSince(int index) {
    return _screenDetailslList.where( (model) => model.isShowed == true ).toList()[index].onlineSince ?? "Nil";
  }
  
  String getScreenDetailsPreview(int index) {
    return _screenDetailslList.where( (model) => model.isShowed == true ).toList()[index].preview ?? "Nil";
  }

  Future<void> onDeleteScreenDetails(String name) async {
    debugPrint("DashboardController onDeleteScreenDetails $name");
    isLoading(true);
    _screenDetailslList.removeWhere((model) => model.name == name );
    _markerModelList.removeWhere((model) => model.name == name );
    isLoading(false);

  }
  //#endregion
  //region Contents Methods
  int getContentsDetailsLength() {
    return _contentsDetailslList.length;
  }

  String getContentDetailsMediaUploaded(int index) {
    return _contentsDetailslList[index].mediaUploaded ?? "Nil";
  }

  String getContentDetailsScreenToDisplay(int index) {
    return _contentsDetailslList[index].screenToDisplay ?? "Nil";
  }

  String getContentDetailsDateToPublish(int index) {
    return _contentsDetailslList[index].dateToPublish ?? "Nil";
  }

  String getContentDetailsDuration(int index) {
    return _contentsDetailslList[index].duration ?? "Nil";
  }

  Future<void> onDeleteContentDetails(int index) async {
    debugPrint("DashboardController onDeleteContentDetails $index");
    isLoading(true);
    _contentsDetailslList.removeAt(index);
    isLoading(false);
  }
  //#endregion
  @override
  void onClose() {
    debugPrint("DashboardController onClose");
    super.onClose();
  }
}