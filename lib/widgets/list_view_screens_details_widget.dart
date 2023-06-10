import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:signage/controllers/dashboard_controller.dart';
import 'package:signage/widgets/base_widgets.dart';

class ListViewScreensDetailsWidget extends BaseWidget<DashboardController> {
  
  const ListViewScreensDetailsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx( () {
      if (controller.isLoading.value) {
        return const Center(child: CircularProgressIndicator());
      } else {
        return ListView.builder (
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: controller.getScreensDetailsLength(),
          itemBuilder: (BuildContext context, int index) {
            return Column (
              children: [
                Row (
                  crossAxisAlignment:CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(controller.getScreenDetailsName(index), style: const TextStyle ( color: Colors.grey, fontSize: 13, fontWeight: FontWeight.w500,),),
                  Text(controller.getScreenDetailsStatus(index), style: const TextStyle ( color: Colors.grey, fontSize: 13, fontWeight: FontWeight.w500,),),
                  Text(controller.getScreenDetailsOnlineSince(index), style: const TextStyle ( color: Colors.grey, fontSize: 13, fontWeight: FontWeight.w500,),),
                  Text(controller.getScreenDetailsLocation(index), style: const TextStyle ( color: Colors.grey, fontSize: 13, fontWeight: FontWeight.w500,),),
                  /*
                  IconButton( 
                    onPressed: () {
                      controller.onDeleteScreenDetails(controller.getScreenDetailsName(index));
                    }, icon: const Icon( CupertinoIcons.delete), 
                  )
                  */
                  IconButton (
                    onPressed: () {
                      controller.onDisabledScreenDetails(controller.getScreenDetailsId(index));
                    }, icon: const Icon( Icons.disabled_visible_rounded ), 
                  )
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