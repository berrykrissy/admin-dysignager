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
      if (controller.isSreensLoading.value) {
        return const Center(child: CircularProgressIndicator());
      } else {
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
                  child: InkWell (
                    onTap: () {
                      controller.onSelectCardScreen(index);
                    },
                    child: Card (
                      color: controller.getScreensViewColour(index),
                      elevation: 1,
                      semanticContainer: true,
                      shape: RoundedRectangleBorder (
                        side: BorderSide (
                          color: controller.getScreensViewColourBorderSide(index).value,
                          width: 3.0,
                        ),
                        borderRadius: BorderRadius.circular(13.0),
                      ),
                      child: AddIconWidget(isVisible: controller.isIconVisible(index),),
                    ),
                  ),
                ),
                Text(controller.getScreensViewName(index))
              ],
            );
          },
        );
      }
    }, );
  }
}