import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:signage/bindings/login_binding.dart';
import 'routes/app_pages.dart';

Future<void> main() async {
  runApp( GetMaterialApp (
    debugShowCheckedModeBanner: true,
    initialBinding: LoginBinding(),
    initialRoute: Routes.LOGIN,
    theme: ThemeData(
      visualDensity: VisualDensity.adaptivePlatformDensity,
    ),
    defaultTransition: Transition.fade,
    getPages: AppPages.pages,
  ) );
}