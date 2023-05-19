import 'package:flutter/material.dart';
import 'package:signage/controllers/dashboard_controller.dart';
import 'package:signage/views/base_view.dart';
import 'package:signage/widgets/navigation_widget.dart';
import 'package:signage/widgets/screens_widget.dart';

class ScreensPage extends BaseView<DashboardController> {

  const ScreensPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    debugPrint("ScreenPage build");
    debugPrint("ScreenPage initialized ${controller.initialized}");
    debugPrint("ScreenPage isClosed ${controller.isClosed}");
    controller.setWidth(MediaQuery.of(context).size.width);
      return const Scaffold (
        body: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            NavigationWidget(),
            ScreensWidget(),
          ],
        ),
      );
  }
}