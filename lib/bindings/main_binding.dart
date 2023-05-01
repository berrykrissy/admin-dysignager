import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:signage/bindings/base_binding.dart';
import 'package:signage/controllers/main_controller.dart';

class MainBinding extends BaseBinding {

  @override
  void dependencies() {
    debugPrint("MainBinding dependencies");
    Get.lazyPut<MainController> ( 
      () => MainController (

      )
    );
  }
}