import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:signage/bindings/base_binding.dart';
import 'package:signage/controllers/SplashController.dart';

class SplashBinding extends BaseBinding {

  @override
  void dependencies() {
    debugPrint("SplashBinding dependencies");
    Get.lazyPut<SplashController> ( () => SplashController());
  }
}