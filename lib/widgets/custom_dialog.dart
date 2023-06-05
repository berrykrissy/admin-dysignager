import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:signage/widgets/button_widget.dart';

class CustomDialog {

  static addScreen(TextEditingController? nameController, TextEditingController? locationController, VoidCallback? onConfirm) {
    Get.defaultDialog (
      barrierDismissible: true,
      content: Column(
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
      title: "Add Name",
    );
  }

  static editDialog(TextEditingController? controller, GestureTapCallback onPressed) {
    Get.dialog(
      AlertDialog (
        actions: [
          ButtonWidget(text: "Update", onPressed: onPressed)
        ],
        content: TextField (
          controller: controller,
          decoration: const InputDecoration (
            hintText: 'Update Name',
            labelText: 'Name',
          ),
          enabled: true,
          //maxLength: 10,
          maxLines: 1,
          obscureText: false,
          keyboardType: TextInputType.text,
        ),
        title: const Text("Update"),
      ),
      barrierDismissible: true,
    );
  }
}