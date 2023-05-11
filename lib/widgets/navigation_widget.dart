import 'package:flutter/material.dart';
import 'package:signage/controllers/dashboard_controller.dart';
import 'package:signage/widgets/base_widgets.dart';
import 'package:signage/widgets/navigation_cell_text_widget.dart';

class NavigationWidget extends BaseWidget<DashboardController> {
  
  const NavigationWidget( {
    super.key
  } );

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 30,
      child: Container(
        color: Colors.red,
        alignment: Alignment.center,
        child: Column (
          children: [
            NavigationCellTextWidget (text: "Find Screen", onTap: () { controller.launchFindScreen(); }, ),
            NavigationCellTextWidget (text: "Screens", onTap: () { controller.launchScreens(); }, ),
            NavigationCellTextWidget (text: "Contents", onTap: () { controller.launchContents(); }, ),
            NavigationCellTextWidget (text: "Settings", onTap: () { controller.launchSettings(); }, ),
            NavigationCellTextWidget (text: "Logout", onTap: () { controller.launchLogout(); }, ),
          ],
        ),
      )
    );
  }
}