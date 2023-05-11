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
        flex: 20,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border(right: BorderSide(color: Colors.black54))
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 40, horizontal: 10,),
                    height: 60,
                    width: 60,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(100),
                        image: DecorationImage(
                            image: NetworkImage(
                                'https://p7.hiclipart.com/preview/92/319/609/computer-icons-person-clip-art-name.jpg')),
                      ),
                    ),
                  ),
                  Text('Admin', style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),)
                ],
              ),
              NavigationCellTextWidget(
                text: "Find Screen",
                onTap: () {
                  controller.launchFindScreen();
                },
              ),
              NavigationCellTextWidget(
                text: "Screens",
                onTap: () {
                  controller.launchScreens();
                },
              ),
              NavigationCellTextWidget(
                text: "Contents",
                onTap: () {
                  controller.launchContents();
                },
              ),
              Spacer(),
              NavigationCellTextWidget(
                text: "Settings",
                onTap: () {
                  controller.launchSettings();
                },
              ),
              NavigationCellTextWidget(
                text: "Logout",
                onTap: () {
                  controller.launchLogout();
                },
              ),
            ],
          ),
        ));
  }
}