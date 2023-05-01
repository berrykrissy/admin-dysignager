import 'package:flutter/material.dart';
import 'package:signage/controllers/main_controller.dart';
import 'package:signage/views/base_view.dart';

class MainPage extends BaseView<MainController> {

  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    debugPrint("MainPage build");
    debugPrint("MainPage initialized ${controller.initialized}");
    debugPrint("MainPage isClosed ${controller.isClosed}");
    controller.setWidth(MediaQuery.of(context).size.width);
    /*
    if (controller.isDesktop()) {
      return const DesktopPage();
    } else if (controller.isMobile()) {
      return const MobilePage();
    } else {
    */
      return const Center(child: CircularProgressIndicator());
    /*
    }
    */
  }
}