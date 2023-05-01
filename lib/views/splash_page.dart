import 'package:flutter/material.dart';
import 'package:signage/controllers/SplashController.dart';
import 'package:signage/widgets/splash_widget.dart';
import 'base_view.dart';

class SplashPage extends BaseView<SplashController> {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    debugPrint("SplashPage build");
    debugPrint("SplashPage initialized ${controller.initialized}");
    debugPrint("SplashPage isClosed ${controller.isClosed}");
    return const Scaffold( 
        body : SplashWidget(),
    );
  }
}