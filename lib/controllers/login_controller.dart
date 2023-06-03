import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:signage/controllers/base_controller.dart';
import 'package:signage/routes/app_pages.dart';

class LoginController extends BaseController {

  LoginController() {
    debugPrint("LoginController Constructor");
  }

  final TextEditingController? usernameController = new TextEditingController();
  final TextEditingController? passwordController = new TextEditingController();


  @override
  void onInit() {
    super.onInit();
    debugPrint("LoginController _launchLogin");
    _handleLocationPermission();
  }

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

  void checkCredentials() {
    debugPrint("LoginController checkCredentials ${usernameController?.text} ${passwordController?.text}");
    if(usernameController?.text == "Admin" && passwordController?.text == "123") {
      Get.snackbar("Credentials", "Login Succeed");
      _launchDashboard();
    } else {
      Get.snackbar("Credentials", "Login Failed");
    }
  }

  void _launchDashboard() {
    debugPrint("LoginController _launchDashboard");
    Get.toNamed(Routes.DASHBOARD);
  }
  
  @override
  void onClose() {
    debugPrint("LoginController onClose");
    super.onClose();
  }
}