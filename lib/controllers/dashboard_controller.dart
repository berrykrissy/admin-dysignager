import 'dart:io' show Platform;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:signage/controllers/base_controller.dart';
import 'package:signage/routes/app_pages.dart';

class DashboardController extends BaseController {

  MainController() {
    debugPrint("DashboardController Constructor");
  }

  final RxDouble _width = Get.width.obs;
  final RxBool _isLoading = true.obs;

  @override
  void onInit() {
    //Platform.isIOS;
    super.onInit();
  }

  bool setWidth(double width) {
    debugPrint("DashboardController setWidth $width");
    _width(width);
    return false;
  }

  bool isDesktop() { debugPrint("DashboardController isDesktop");
    return _width.value >= 600.00;
  }

  bool isMobile() { debugPrint("DashboardController isMobile");
    return _width.value < 600.00;
  }

  double getAppBarHeight() {
    return Get.height * 0.10; //MediaQuery.of(context).size.height * 0.10;
  }

  bool isLoading() {
    return _isLoading.value;
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

  @override
  void onClose() {
    debugPrint("DashboardController onClose");
    super.onClose();
  }
}