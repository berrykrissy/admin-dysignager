import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:signage/controllers/dashboard_controller.dart';
import 'package:signage/utils/constants.dart';
import 'package:signage/widgets/base_widgets.dart';

class StatusWidget extends BaseWidget<DashboardController> {

  const StatusWidget ( {
   super.key
  } );

  @override
  Widget build(BuildContext context) {
    return Obx( () {
      if (controller.isLoading.value) {
        return const Center(child: CircularProgressIndicator());
      } else {
        return Card (
          color: Colors.white,
          shape: RoundedRectangleBorder(
            side: const BorderSide (
              color: Colors.grey,
            ),
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Container(
            padding: const EdgeInsets.fromLTRB(0, 30, 0, 30),
            child: Row (
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Image.asset(
                    "assets/OnlineTag.webp",
                    height: 50, width: 50,
                  ),
                  const Text(Constants.ONLINE, style: TextStyle ( fontSize: 13, fontWeight: FontWeight.w500,),),
                ],
              ),
              Text(controller.getMarkersQuantity(Constants.ONLINE).value, style: const TextStyle ( fontSize: 25, fontWeight: FontWeight.w500,),),
              Column(
                children: [
                   Image.asset(
                      "assets/OutofSyncTag.webp",
                      height: 50, width: 50,
                    ),
                  const Text(Constants.OUT_OF_SYNC, style: TextStyle ( fontSize: 13, fontWeight: FontWeight.w500,),),
                ],
              ),
              Text(controller.getMarkersQuantity(Constants.OUT_OF_SYNC).value, style: const TextStyle ( fontSize: 25, fontWeight: FontWeight.w500,),),
              Column(
                children: [
                  Image.asset(
                    "assets/OfflineTag.webp",
                    height: 50, width: 50,
                  ),
                  const Text(Constants.OFFLINE, style: TextStyle ( fontSize: 13, fontWeight: FontWeight.w500,),),
                ],
              ),
              Text(controller.getMarkersQuantity(Constants.OFFLINE).value, style: const TextStyle ( fontSize: 25, fontWeight: FontWeight.w500,),),
              Column(
                children: [
                  Image.asset(
                    "assets/DisabledTag.webp",
                    height: 50, width: 50,
                  ),
                  const Text(Constants.DISABLED, style: TextStyle ( fontSize: 13, fontWeight: FontWeight.w500,),),
                ],
              ),
              Text(controller.getMarkersQuantity(Constants.DISABLED).value, style: const TextStyle ( fontSize: 25, fontWeight: FontWeight.w500,),),
            ],
          ),
          )
        );
      }
    });
  }
}