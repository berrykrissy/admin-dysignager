import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:signage/controllers/dashboard_controller.dart';
import 'package:signage/widgets/base_widgets.dart';

class GridViewScreensViewWidget extends BaseWidget<DashboardController> {
  
  const GridViewScreensViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx( () {
      return GridView.builder (
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount (crossAxisCount: 3, mainAxisSpacing: 1),
        scrollDirection: Axis.vertical,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: controller.getScreensViewLength(),
        itemBuilder: (context, index) {
          return Column (
            children: [
              SizedBox (
                height: 130,
                width: 130,
                child: Card (
                  color: controller.getScreensView(index).color,
                  elevation: 1,
                  semanticContainer: true,
                  shape: RoundedRectangleBorder (
                    side: const BorderSide (
                      color: Colors.grey,
                    ),
                    borderRadius: BorderRadius.circular(13.0),
                  ),
                  child: Center(child: Text(controller.getScreensView(index).quantity.toString()),)
                ),
              ),
              Text(controller.getScreensView(index).name.toString())
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