import 'package:flutter/material.dart';
import 'package:signage/controllers/dashboard_controller.dart';
import 'package:signage/views/base_view.dart';
import 'package:signage/widgets/navigation_widget.dart';

class DashboardPage extends BaseView<DashboardController> {

  const DashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold (
      body: Row (
        mainAxisSize: MainAxisSize.max,
        children: [
          const NavigationWidget(),
          Flexible (
            flex: 70,
            child: Container (
              alignment: Alignment.center,
              child: Image.asset("assets/DYSIGNAGER.webp"),
            )
          ),
        ],
      ),
    );
  }
}