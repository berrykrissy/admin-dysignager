import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:signage/bindings/login_binding.dart';
import 'package:signage/services/firebase/firebase_options.dart';
import 'package:signage/services/firebase/firebase_storage_service.dart';
import 'package:signage/services/firebase/firestore_service.dart';
import 'routes/app_pages.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  Get.put(FirestoreService());
  Get.put(FirebaseStorageService());
  
  debugPaintSizeEnabled = false;
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    initialBinding: LoginBinding(),
    initialRoute: Routes.LOGIN,
    theme: ThemeData(
      visualDensity: VisualDensity.adaptivePlatformDensity,
    ),
    defaultTransition: Transition.fade,
    getPages: AppPages.pages,
  ));
}
