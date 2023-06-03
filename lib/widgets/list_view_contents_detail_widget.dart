import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:signage/controllers/dashboard_controller.dart';
import 'package:signage/widgets/base_widgets.dart';

class ListViewContentsDetailsWidget extends BaseWidget<DashboardController> {
  
  const ListViewContentsDetailsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx( () {
      if (controller.isLoading.value) {
        return const Center(child: CircularProgressIndicator());
      } else {
        return ListView.builder (
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: controller.getContentsDetailsLength(),
          itemBuilder: (BuildContext context, int index) {
            return Column (
              children: [
                Row (
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(controller.getContentDetailsName(index), style: TextStyle ( color: Colors.grey, fontSize: 13, fontWeight: FontWeight.w500,),),
                  Text(controller.getContentDetailsDateCreated(index), style: TextStyle ( color: Colors.grey, fontSize: 13, fontWeight: FontWeight.w500,),),
                  Text(controller.getContentDetailsStatus(index), style: TextStyle ( color: Colors.grey, fontSize: 13, fontWeight: FontWeight.w500,),),
                  const Text("View Screens", style: TextStyle ( color: Colors.grey, fontSize: 13, fontWeight: FontWeight.w500,),),
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
      }
    }, );
  }
}