import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:signage/bindings/base_binding.dart';
import 'package:signage/controllers/login_controller.dart';
import 'package:signage/services/firebase/firestore_service.dart';

class LoginBinding extends BaseBinding {

  @override
  void dependencies() {
    debugPrint("LoginBinding dependencies");
    Get.lazyPut<LoginController> ( 
      () => LoginController (
        Get.find<FirestoreService>(),
      )
    );
  }
}