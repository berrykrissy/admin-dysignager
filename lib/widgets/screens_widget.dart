import 'package:flutter/material.dart';
import 'package:signage/controllers/dashboard_controller.dart';
import 'package:signage/widgets/base_widgets.dart';
import 'package:signage/widgets/list_view_screens_details_widget.dart';
import 'package:signage/widgets/scroll_view_widget.dart';

class ScreensWidget extends BaseWidget<DashboardController> {
  
  const ScreensWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Flexible (
      flex: 70,
      child: ScrollViewWidget (
          isScrollable: true,
          //scrollContoller: controller.screensScrollController,
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Welcome to DYSIGNER Dashboard!", style: TextStyle ( fontSize: 25, fontWeight: FontWeight.w500,),),
                Text("Dysignager", style: TextStyle ( fontSize: 25, fontWeight: FontWeight.w500,),),
              ],
            ),
            const SizedBox(height: 13,),
            Card (
              color: Colors.white,
              shape: RoundedRectangleBorder(
                side: const BorderSide(
                  color: Colors.grey,
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Container(
                padding: const EdgeInsets.fromLTRB(13, 30, 10, 30),
                child: Column (
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("SCREENS", style: TextStyle ( color: Colors.grey, fontSize: 13, fontWeight: FontWeight.w500,),),
                      Text("Audiance Views as of May 1, 2023 Monday", style: TextStyle ( color: Colors.grey, fontSize: 13, fontWeight: FontWeight.w500,),),
                    ],
                  ),
                  const SizedBox(height: 13,),
                  /*
                  GridView(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount (crossAxisCount: 3),
                    children: [
                      Card (
                        color: Colors.green,
                        shape: RoundedRectangleBorder (
                          side: const BorderSide (
                            color: Colors.grey,
                          ),
                          borderRadius: BorderRadius.circular(13.0),
                        ),
                        child: const Text("0"),
                      ),
                      Card (
                        color: Colors.red,
                        shape: RoundedRectangleBorder (
                          side: const BorderSide (
                            color: Colors.grey,
                          ),
                          borderRadius: BorderRadius.circular(13.0),
                        ),
                        child: const Text("0"),
                      ),
                    ],
                  ),
                  */
                ],
              ),
              )
            ),
            const SizedBox(height: 15,),
            const Row (
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("Name", style: TextStyle ( color: Colors.grey, fontSize: 13, fontWeight: FontWeight.w500,),),
                Text("Status", style: TextStyle ( color: Colors.grey, fontSize: 13, fontWeight: FontWeight.w500,),),
                Text("Online Since", style: TextStyle ( color: Colors.grey, fontSize: 13, fontWeight: FontWeight.w500,),),
                Text("Content Playlist", style: TextStyle ( color: Colors.grey, fontSize: 13, fontWeight: FontWeight.w500,),),
                Text("Preview", style: TextStyle ( color: Colors.grey, fontSize: 13, fontWeight: FontWeight.w500,),),
                Text("Action", style: TextStyle ( color: Colors.grey, fontSize: 13, fontWeight: FontWeight.w500,),),
              ],
            ),
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