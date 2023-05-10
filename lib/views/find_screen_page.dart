import 'package:flutter/material.dart';
import 'package:signage/controllers/dashboard_controller.dart';
import 'package:signage/views/base_view.dart';
import 'package:signage/widgets/find_screen_widget.dart';
import 'package:signage/widgets/navigation_widget.dart';

class FindScreenPage extends BaseView<DashboardController> {

  const FindScreenPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    debugPrint("FindScreenPage build");
    debugPrint("FindScreenPage initialized ${controller.initialized}");
    debugPrint("FindScreenPage isClosed ${controller.isClosed}");
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