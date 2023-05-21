import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:signage/controllers/dashboard_controller.dart';
import 'package:signage/widgets/base_widgets.dart';

class ListViewScreensDetailsWidget extends BaseWidget<DashboardController> {
  
  const ListViewScreensDetailsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx( () {
      /*
      return Column(
        children: controller.getScreensDetailsList().map((item) => 
          Row (
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(item.name.toString(), style: TextStyle ( color: Colors.grey, fontSize: 13, fontWeight: FontWeight.w500,),),
              Text(item.status.toString(), style: TextStyle ( color: Colors.grey, fontSize: 13, fontWeight: FontWeight.w500,),),
              Text(item.onlineSince.toString(), style: TextStyle ( color: Colors.grey, fontSize: 13, fontWeight: FontWeight.w500,),),
              Text(item.contentPlaylist.toString(), style: TextStyle ( color: Colors.grey, fontSize: 13, fontWeight: FontWeight.w500,),),
              Text(item.preview.toString(), style: TextStyle ( color: Colors.grey, fontSize: 13, fontWeight: FontWeight.w500,),),
              Text("Edit      Delete", style: TextStyle ( color: Colors.grey, fontSize: 13, fontWeight: FontWeight.w500,),),
            ],
          ),
        ).toList(),
      );
      */
      return ListView.builder (
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: controller.getScreensDetailsLength(),
        itemBuilder: (BuildContext context, int index) {
          return Column (
            children: [
              Row (
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(controller.getScreensDetails(index).name.toString(), style: TextStyle ( color: Colors.grey, fontSize: 13, fontWeight: FontWeight.w500,),),
                Text(controller.getScreensDetails(index).status.toString(), style: TextStyle ( color: Colors.grey, fontSize: 13, fontWeight: FontWeight.w500,),),
                Text(controller.getScreensDetails(index).onlineSince.toString(), style: TextStyle ( color: Colors.grey, fontSize: 13, fontWeight: FontWeight.w500,),),
                Text(controller.getScreensDetails(index).contentPlaylist.toString(), style: TextStyle ( color: Colors.grey, fontSize: 13, fontWeight: FontWeight.w500,),),
                Text(controller.getScreensDetails(index).preview.toString(), style: TextStyle ( color: Colors.grey, fontSize: 13, fontWeight: FontWeight.w500,),),
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