import 'package:flutter/material.dart';
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