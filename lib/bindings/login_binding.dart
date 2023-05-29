import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:signage/bindings/base_binding.dart';
import 'package:signage/controllers/login_controller.dart';

class LoginBinding extends BaseBinding {

  @override
  void dependencies() {
    debugPrint("LoginBinding dependencies");
    Get.lazyPut<LoginController> ( 
      () => LoginController (

      )
    );
  }
}