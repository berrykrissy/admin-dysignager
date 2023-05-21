import 'package:flutter/material.dart';
import 'package:signage/controllers/dashboard_controller.dart';
import 'package:signage/views/base_view.dart';
import 'package:signage/widgets/find_screen_widget.dart';
import 'package:signage/widgets/navigation_widget.dart';

class FindScreenPage extends BaseView<DashboardController> {

  const FindScreenPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
      return const Scaffold (
        body: Row (
          mainAxisSize: MainAxisSize.max,
          children: [
            NavigationWidget(),
            FindScreenWidget(),
          ],
        ),
      );
  }
}