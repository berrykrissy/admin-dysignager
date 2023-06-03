import 'package:flutter/material.dart';
import 'package:signage/controllers/dashboard_controller.dart';
import 'package:signage/widgets/base_widgets.dart';
import 'package:signage/widgets/dashboard_header_Widget.dart';
import 'package:signage/widgets/grid_view_screens_view_widget.dart';
import 'package:signage/widgets/list_view_screens_details_widget.dart';
import 'package:signage/widgets/list_view_screens_header_widget.dart';
import 'package:signage/widgets/scroll_view_widget.dart';

class ScreensWidget extends BaseWidget<DashboardController> {
  
  const ScreensWidget( { super.key } );

  @override
  Widget build(BuildContext context) {
    return Flexible (
      flex: 70,
      child: ScrollViewWidget (
          isScrollable: true,
          //scrollContoller: controller.screensScrollController,
          children: [
            const DashboardHeaderWidget(),
            const SizedBox(height: 13,),
            Card (
              margin: const EdgeInsets.symmetric(horizontal: 40),
              color: Colors.white,
              shape: RoundedRectangleBorder (
                side: const BorderSide(color: Colors.grey,),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Container (
                padding: const EdgeInsets.fromLTRB(13, 30, 10, 30),
                child: const Column (
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding (
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("SCREENS", style: TextStyle ( color: Colors.grey, fontSize: 20, fontWeight: FontWeight.w500,),),
                        //Text("Audience Views as of May 1, 2023 Monday", style: TextStyle ( color: Colors.grey, fontSize: 20, fontWeight: FontWeight.w500,),),
                      ],
                    ),
                  ),
                  SizedBox(height: 13,),
                  GridViewScreensViewWidget(),
                ],
              ),
              )
            ),
            const SizedBox(height: 15,),
            const ListViewScreensHeaderWidget(),
            const Divider (
              color: Colors.grey,
              height: 25,
              thickness: 1,
              indent: 5,
              endIndent: 5,
            ),
            const ListViewScreensDetailsWidget()
          ]
        ),
    );
  }
}