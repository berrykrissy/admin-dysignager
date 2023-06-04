import 'package:flutter/material.dart';
import 'package:signage/controllers/dashboard_controller.dart';
import 'package:signage/utils/constants.dart';
import 'package:signage/widgets/base_widgets.dart';
import 'package:signage/widgets/navigation_cell_text_widget.dart';

class NavigationWidget extends BaseWidget<DashboardController> {
  
  const NavigationWidget( {
    super.key,
    this.selectedLink,
  } );

  final String? selectedLink;

  @override
  Widget build(BuildContext context) {
    return Flexible (
      flex: 20,
      child: Container (
        decoration: const BoxDecoration (
          color: Colors.white,
          border: Border(right: BorderSide(color: Colors.black54))
        ),
        child: Column (
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row (
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox (
                  height: 35,
                  width: 35,
                  child: Image.asset("assets/Admin.webp"),
                ),
                const Text('Admin', style: TextStyle (
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),)
              ],
            ),
            NavigationCellTextWidget (
              text: Constants.FIND_SCREEN,
              textColour: controller.getNavigationColorLink(Constants.FIND_SCREEN, selectedLink),
              onTap: () {
                controller.launchFindScreen();
              },
            ),
            NavigationCellTextWidget(
              text: Constants.SCREENS,
              textColour: controller.getNavigationColorLink(Constants.SCREENS, selectedLink),
              onTap: () {
                controller.launchScreens();
              },
            ),
            NavigationCellTextWidget(
              text: Constants.CONTENTS,
              textColour: controller.getNavigationColorLink(Constants.CONTENTS, selectedLink),
              onTap: () {
                controller.launchContents();
              },
            ),
            const Spacer(),
            NavigationCellTextWidget(
              text: Constants.SETTINGS,
              textColour: controller.getNavigationColorLink(Constants.SETTINGS, selectedLink),
              onTap: () {
                controller.launchSettings();
              },
            ),
            NavigationCellTextWidget (
              text: Constants.LOGOUT,
              onTap: () {
                controller.launchLogout();
              },
            ),
          ],
        ),
      ));
  }
}