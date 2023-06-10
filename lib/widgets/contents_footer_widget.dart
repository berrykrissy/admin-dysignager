import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:signage/controllers/dashboard_controller.dart';
import 'package:signage/widgets/base_widgets.dart';
import 'package:signage/widgets/button_widget.dart';
import 'package:signage/widgets/custom_dialog.dart';

class ContentsFooterWidget extends BaseWidget<DashboardController> {
  
  const ContentsFooterWidget({
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Padding (
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row (
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ButtonWidget(text: "+ New Contract", textColor: Colors.purple, fillColor: Colors.white, fontSize: 20, fontWeight: FontWeight.w500, onPressed: () {            
            controller.durationController?.text = "30";
            CustomDialog.newContract (
              /*null,*/controller.clientController,
              controller.dateFromController, controller.dateToController, 
              controller.durationController, controller.mediaUrlController,
              controller.isLoading, 
              controller.liveFileName, controller.liveFileExtension, controller.liveFileSize, controller.liveFileBytes, () {
                controller.onPickFiles();
              }, () {
                controller.onUpload();
              }
            );
          } ),
          ButtonWidget(text: "View all", textColor: Colors.purple, fillColor: Colors.white, fontSize: 20, fontWeight: FontWeight.w500, onPressed: () {
            Get.snackbar("Test", "View all");
          } )
        ],
      ),
    );
  }
}