import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:signage/controllers/dashboard_controller.dart';
import 'package:signage/widgets/add_icon_widget.dart';
import 'package:signage/widgets/base_widgets.dart';

class GridViewScreensViewWidget extends BaseWidget<DashboardController> {
  
  const GridViewScreensViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx( () {
      return GridView.builder (
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount (crossAxisCount: 3, mainAxisSpacing: 1, crossAxisSpacing: 1, mainAxisExtent: 130,),
        scrollDirection: Axis.vertical,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: controller.getScreensViewLength(),
        itemBuilder: (context, index) {
          return Column (
            children: [
              SizedBox (
                height: 100,
                width: 100,
                child: Card (
                  color: controller.getScreensViewColour(index),
                  elevation: 1,
                  semanticContainer: true,
                  shape: RoundedRectangleBorder (
                    side: const BorderSide (
                      color: Colors.grey,
                    ),
                    borderRadius: BorderRadius.circular(13.0),
                  ),
                  child: AddIconWidget(index: index,),
                ),
              ),
              Text(controller.getScreensViewName(index))
            ],
          );
          /*
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
          */
        },
      );
    }, );
  }
}