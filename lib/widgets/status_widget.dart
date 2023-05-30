import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:signage/controllers/dashboard_controller.dart';
import 'package:signage/utils/constants.dart';
import 'package:signage/widgets/base_widgets.dart';

class StatusWidget extends BaseWidget<DashboardController> {

  StatusWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx( () {
      return Card (
        color: Colors.white,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: Colors.grey,
          ),
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Container(
          padding: EdgeInsets.fromLTRB(0, 30, 0, 30),
          child: Row (
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                Icon (
                  CupertinoIcons.map_pin_ellipse,
                  color: Colors.green,
                ),
                Text(Constants.ONLINE, style: TextStyle ( fontSize: 13, fontWeight: FontWeight.w500,),),
              ],
            ),
            Text(controller.getMarkersQuantity(Constants.ONLINE).value, style: TextStyle ( fontSize: 25, fontWeight: FontWeight.w500,),),
            Column(
              children: [
                Icon (
                  CupertinoIcons.map_pin_ellipse,
                  color: Colors.red,
                ),
                Text(Constants.OUT_OF_SYNC, style: TextStyle ( fontSize: 13, fontWeight: FontWeight.w500,),),
              ],
            ),
            Text(controller.getMarkersQuantity(Constants.OUT_OF_SYNC).value, style: TextStyle ( fontSize: 25, fontWeight: FontWeight.w500,),),
            Column(
              children: [
                Icon (
                  CupertinoIcons.map_pin_ellipse,
                  color: Colors.orange,
                ),
                Text(Constants.OFFLINE, style: TextStyle ( fontSize: 13, fontWeight: FontWeight.w500,),),
              ],
            ),
            Text(controller.getMarkersQuantity(Constants.OFFLINE).value, style: TextStyle ( fontSize: 25, fontWeight: FontWeight.w500,),),
            Column(
              children: [
                Icon (
                  CupertinoIcons.map_pin_ellipse,
                  color: Colors.blue,
                ),
                Text(Constants.DISABLED, style: TextStyle ( fontSize: 13, fontWeight: FontWeight.w500,),),
              ],
            ),
            Text(controller.getMarkersQuantity(Constants.DISABLED).value, style: TextStyle ( fontSize: 25, fontWeight: FontWeight.w500,),),
          ],
        ),
        )
      );
    });
  }
}