import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:signage/bindings/base_binding.dart';
import 'package:signage/controllers/dashboard_controller.dart';

class DashboardBinding extends BaseBinding {

  @override
  void dependencies() {
    debugPrint("DashboardBinding dependencies");
    Get.lazyPut<DashboardController> ( 
      () => DashboardController (

      )
    );
  }
}