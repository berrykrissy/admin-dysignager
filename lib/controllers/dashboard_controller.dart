import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:signage/controllers/base_controller.dart';
import 'package:signage/models/marker_model.dart';
import 'package:signage/models/screens_details_model.dart';
import 'package:signage/models/screens_view_model.dart';
import 'package:signage/routes/app_pages.dart';
import 'package:signage/utils/constants.dart';

class DashboardController extends BaseController {

  MainController() {
    debugPrint("DashboardController Constructor");
  }

  final screensScrollController = ScrollController();
  final RxList<MarkerModel> _markerModelList = new List<MarkerModel>.empty().obs;
  final RxList<ScreensViewModel> _screenViewList = new List<ScreensViewModel>.empty().obs;
  final RxList<ScreensDetailsModel> _screenDetailsList = new List<ScreensDetailsModel>.empty().obs;

  @override
  void onInit() {
    super.onInit();
    _initializeList();
  }

  void _initializeList() { //TODO: List are Test Data need to implement soon
    _markerModelList.add(MarkerModel(latitude: 12.8797, longitude: 121.7740, status: Constants.ONLINE));
    //_markerModelList.add(MarkerModel(latitude: 12.8797, longitude: 121.7740, status: Constants.ONLINE));
    _markerModelList.add(MarkerModel(latitude: 13.00, longitude: 120.7740, status: Constants.OUT_OF_SYNC));
    _markerModelList.add(MarkerModel(latitude: 51.509364, longitude: -0.1289280, status: Constants.OFFLINE));
    //_markerModelList.add(MarkerModel(latitude: 51.509364, longitude: -0.1289280, status: Constants.OFFLINE));
    //_markerModelList.add(MarkerModel(latitude: 51.509364, longitude: -0.1289280, status: Constants.OFFLINE));
    _markerModelList.add(MarkerModel(latitude: 14.00, longitude: 130.00, status: Constants.DISABLED));
    _GetCoordinates();

    _screenViewList.add(ScreensViewModel(name: "Screen 1", quantity: "0", color: Colors.red));
    _screenViewList.add(ScreensViewModel(name: "Screen 2", quantity: "2", color: Colors.orange));
    _screenViewList.add(ScreensViewModel(name: "Screen 3", quantity: "3", color: Colors.yellow));
    _screenViewList.add(ScreensViewModel(name: "Screen 4", quantity: "4", color: Colors.green));
    _screenViewList.add(ScreensViewModel(name: "Screen 5", quantity: "5", color: Colors.blue));
    _screenViewList.add(ScreensViewModel(name: "Screen 6", quantity: "6", color: Colors.purple));

    _screenDetailsList.add(ScreensDetailsModel(name: "Screen 1", status: "Online", onlineSince: "04/25/23", contentPlaylist: "Sample Playlist 1", preview: ""));
    _screenDetailsList.add(ScreensDetailsModel(name: "Screen 2", status: "Offline", onlineSince: "04/25/23", contentPlaylist: "Sample Playlist 2", preview: ""));
    _screenDetailsList.add(ScreensDetailsModel(name: "Screen 3", status: "Online", onlineSince: "04/25/23", contentPlaylist: "Sample Playlist 3", preview: ""));
    _screenDetailsList.add(ScreensDetailsModel(name: "Screen 4", status: "Offline", onlineSince: "04/25/23", contentPlaylist: "Sample Playlist 4", preview: ""));
    _screenDetailsList.add(ScreensDetailsModel(name: "Screen 5", status: "Online", onlineSince: "04/25/23", contentPlaylist: "Sample Playlist 5", preview: ""));
  }
  //region Page Launchers
  void launchFindScreen() {
      debugPrint("DashboardController Timer StopslaunchFindScreen");
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

  void launchSettings() {
      debugPrint("DashboardController launchSettings");
      Get.toNamed(Routes.SETTINGS);
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
  //endregion
  //region zxczxc
  RxList<MarkerModel> getObservableMarkers() {
    return _markerModelList;
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

  MaterialColor getColour(String? status) {
    if(status == Constants.ONLINE) {
      return Colors.green;
    } else if(status == Constants.OUT_OF_SYNC) {
      return Colors.red;
    } else if(status == Constants.OFFLINE) {
      return Colors.orange;
    } else if(status == Constants.DISABLED) {
      return Colors.blue;
    } else {
      return Colors.brown;
    }
  }
  //endregion
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

  Future<void> _GetCoordinates() async {
    if(await _handleLocationPermission()) {
      Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
      _markerModelList.add(MarkerModel(latitude: position.latitude, longitude: position.longitude, status: null));
    }
  }
  //region Screen Views Methods
  int getScreensViewLength() {
    return _screenViewList.length;
  }

  ScreensViewModel getScreensView(int index) {
    return _screenViewList.value[index];
  }

  List<ScreensViewModel> getScreensViewList() {
    return _screenViewList.value;
  }
  //endregion
  //region Screen Details Methods
  int getScreensDetailsLength() {
    return _screenDetailsList.length;
  }

  ScreensDetailsModel getScreensDetails(int index) {
    return _screenDetailsList.value[index];
  }

  List<ScreensDetailsModel> getScreensDetailsList() {
    return _screenDetailsList.value;
  }
  //endregion
  @override
  void onClose() {
    debugPrint("DashboardController onClose");
    super.onClose();
  }
}