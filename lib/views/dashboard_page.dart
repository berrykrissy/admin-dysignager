import 'package:flutter/material.dart';
import 'package:signage/controllers/dashboard_controller.dart';
import 'package:signage/views/base_view.dart';
import 'package:signage/widgets/find_screen_widget.dart';
import 'package:signage/widgets/navigation_widget.dart';

class DashboardPage extends BaseView<DashboardController> {

  const DashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    debugPrint("DashboardPage build");
    debugPrint("DashboardPage initialized ${controller.initialized}");
    debugPrint("DashboardPage isClosed ${controller.isClosed}");
    controller.setWidth(MediaQuery.of(context).size.width);
      return Scaffold (
        body: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            const NavigationWidget(),
            const FindScreenWidget(),
          ],
        ),
      );
  }
}