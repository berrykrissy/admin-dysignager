import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:signage/controllers/dashboard_controller.dart';
import 'package:signage/widgets/base_widgets.dart';

class ListViewScreensDetailsWidget extends BaseWidget<DashboardController> {
  
  const ListViewScreensDetailsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx( () {
      return ListView.builder (
        itemCount: controller.getScreensDetailsLength(),
        itemBuilder: (BuildContext context, int index) {
          return Column(
            children: [
              Row (
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(controller.getScreensDetailsList(index).name.toString(), style: TextStyle ( color: Colors.grey, fontSize: 13, fontWeight: FontWeight.w500,),),
                Text(controller.getScreensDetailsList(index).status.toString(), style: TextStyle ( color: Colors.grey, fontSize: 13, fontWeight: FontWeight.w500,),),
                Text(controller.getScreensDetailsList(index).onlineSince.toString(), style: TextStyle ( color: Colors.grey, fontSize: 13, fontWeight: FontWeight.w500,),),
                Text(controller.getScreensDetailsList(index).contentPlaylist.toString(), style: TextStyle ( color: Colors.grey, fontSize: 13, fontWeight: FontWeight.w500,),),
                Text(controller.getScreensDetailsList(index).preview.toString(), style: TextStyle ( color: Colors.grey, fontSize: 13, fontWeight: FontWeight.w500,),),
                Text("Edit      Delete", style: TextStyle ( color: Colors.grey, fontSize: 13, fontWeight: FontWeight.w500,),),
              ],
            ),
            const Divider(
              color: Colors.grey,
              height: 25,
              thickness: 1,
              indent: 5,
              endIndent: 5,
            ),
            ],
          );
        }
      );
    }, );
  }
}