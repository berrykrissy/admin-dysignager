import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:signage/bindings/base_binding.dart';
import 'package:signage/controllers/dashboard_controller.dart';
import 'package:signage/utils/server.dart';
//import 'package:socket_io/socket_io.dart';

class DashboardBinding extends BaseBinding {

  @override
  void dependencies() {
    debugPrint("DashboardBinding dependencies");
    Get.lazyPut<DashboardController> ( 
      () => DashboardController (
        new Server()
      )
    );
  }
}