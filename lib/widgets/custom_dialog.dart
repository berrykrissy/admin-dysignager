import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:signage/utils/constants.dart';
import 'package:signage/widgets/button_widget.dart';
import 'package:signage/widgets/date_picker_widget.dart';

class CustomDialog {

  static addScreen(
    TextEditingController? nameController, TextEditingController? locationController, 
    VoidCallback? onConfirm
  ) {
    Get.defaultDialog (
      barrierDismissible: true,
      content: Column (
        children: [
          TextField (
            controller: nameController,
            decoration: const InputDecoration (
              hintText: 'Enter Name',
              labelText: 'Name',
            ),
            enabled: true,
            //maxLength: 10,
            maxLines: 1,
            obscureText: false,
            keyboardType: TextInputType.text,
          ),
          TextField (
            controller: locationController,
            decoration: const InputDecoration (
              hintText: 'Enter Location',
              labelText: 'Location',
            ),
            enabled: true,
            //maxLength: 10,
            maxLines: 1,
            obscureText: false,
            keyboardType: TextInputType.text,
          ),
        ],
      ),
      onConfirm: onConfirm,
      radius: 1,
      textConfirm: "Add",
      title: "Add Screen",
    );
  }

  static newContract (
    TextEditingController? contractNumberController, TextEditingController? clientController,
    Rx<TextEditingController?> dateFromController, Rx<TextEditingController?> dateToController,
    TextEditingController? durationController,
    RxBool liveLoading, RxString liveFileName, RxString liveFileExtension, Rx<Uint8List> liveFileBytes,
    GestureTapCallback onPressedMedia ,GestureTapCallback onPressedUpload
  ) {
    Get.dialog(
      AlertDialog (
        actions: [
          ButtonWidget(text: "Upload", textColor: Colors.purple, fillColor: Colors.white, fontSize: 20, fontWeight: FontWeight.w500, onPressed: onPressedUpload)
        ],
        content: Column (
        children: [
          TextField (
            controller: contractNumberController,
            readOnly: true,
            decoration: const InputDecoration (
              labelText: 'Contract Number',
            ),
            enabled: true,
            //maxLength: 10,
            maxLines: 1,
            obscureText: false,
            keyboardType: TextInputType.text,
          ),
          TextField (
            controller: clientController,
            decoration: const InputDecoration (
              hintText: 'Enter Client',
              labelText: 'Client',
            ),
            enabled: true,
            //maxLength: 10,
            maxLines: 1,
            obscureText: false,
            keyboardType: TextInputType.text,
          ),
          DatePickerWidget (
            labelText: 'Start Date',
            hintText: 'Enter Start Date',
            dateController: dateFromController,
          ),
          DatePickerWidget (
            labelText: 'End Date',
            hintText: 'Enter End Date',
            dateController: dateToController,
          ),
          TextField (
            controller: durationController,
            readOnly: true,
            decoration: const InputDecoration (
              labelText: 'Duration',
            ),
            enabled: true,
            //maxLength: 10,
            maxLines: 1,
            obscureText: false,
            keyboardType: TextInputType.text,
          ),
          Obx(() {
            if (liveLoading.value) {
              return const SizedBox( height: 20.0,);
            } else {
              return ButtonWidget(text: "+ Add Media", textColor: Colors.purple, fillColor: Colors.white, fontSize: 15, fontWeight: FontWeight.w500, onPressed: onPressedMedia);
            }
          }),          
          Obx(() {
            debugPrint("liveFileBytes ${liveFileBytes.value}");
            if (liveLoading.value) {
              return const Center(child: CircularProgressIndicator());
            } else if (liveFileExtension.value.toLowerCase().contains("jpg") || liveFileExtension.value.toLowerCase().contains("png") || liveFileExtension.value.toLowerCase().contains("webp")/*liveFileBytes.value == Uint8List.fromList([0])*/) {
              return Container (
                color: Constants.GRAY_OFFLINE,
                height: 200,
                width: 200,
                child: Column(
                  children: [
                    Image.memory (
                      liveFileBytes.value, fit: BoxFit.scaleDown,
                      height: 200,
                      width: 200,
                    ),
                  ],
                )
              );
            } else if (liveFileExtension.value.toLowerCase().contains("mp4")) {
              return Container (
                color: Constants.GRAY_OFFLINE,
                height: 200,
                width: 200,
                child: const Icon (
                  CupertinoIcons.video_camera_solid,
                  color: Colors.blue,
                ),
              );
            } else {
              return Container (
                color: Constants.GRAY_OFFLINE,
                height: 200,
                width: 200,
                child: const Icon (
                  CupertinoIcons.cloud_upload,
                  color: Colors.blue,
                ),
              );
            }
          },),
          Obx(() => Text (
            liveFileName.value ?? "",
            style:  const TextStyle(fontSize: 12, fontWeight: FontWeight.normal),
            overflow: TextOverflow.visible,
          ),)
        ],
      ),
        title: const Text("New Contract"),
      ),
      barrierDismissible: true,
    );
  }
}