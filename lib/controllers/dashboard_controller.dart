import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:signage/controllers/base_controller.dart';
import 'package:signage/models/screens_details_model.dart';
import 'package:signage/routes/app_pages.dart';

class DashboardController extends BaseController {

  MainController() {
    debugPrint("DashboardController Constructor");
  }

  final RxList<ScreensDetailsModel> _screenDetailsList = new List<ScreensDetailsModel>.empty().obs;

  @override
  void onInit() {
    super.onInit();
  }

  void initializeList() {
    _screenDetailsList.add(ScreensDetailsModel(name: "Screen 1", status: "Online", onlineSince: "04/25/23", contentPlaylist: "Sample Playlist 1", preview: ""));
    _screenDetailsList.add(ScreensDetailsModel(name: "Screen 2", status: "Offline", onlineSince: "04/25/23", contentPlaylist: "Sample Playlist 2", preview: ""));
    _screenDetailsList.add(ScreensDetailsModel(name: "Screen 3", status: "Online", onlineSince: "04/25/23", contentPlaylist: "Sample Playlist 3", preview: ""));
    _screenDetailsList.add(ScreensDetailsModel(name: "Screen 4", status: "Offline", onlineSince: "04/25/23", contentPlaylist: "Sample Playlist 4", preview: ""));
    _screenDetailsList.add(ScreensDetailsModel(name: "Screen 5", status: "Online", onlineSince: "04/25/23", contentPlaylist: "Sample Playlist 5", preview: ""));
  }

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
      );
      //TODO: Implement Logout Code Method
  }

  int getScreensDetailsLength() {
    return _screenDetailsList.length;
  }

  ScreensDetailsModel getScreensDetailsList(int index) {
    return _screenDetailsList.value[index];
  }

  @override
  void onClose() {
    debugPrint("DashboardController onClose");
    super.onClose();
  }
}