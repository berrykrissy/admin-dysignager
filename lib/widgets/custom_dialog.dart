import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:signage/widgets/button_widget.dart';

class CustomDialog {

  static addScreen(TextEditingController? nameController, TextEditingController? locationController, VoidCallback? onConfirm) {
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

  static newContract(GestureTapCallback onPressed) {
    Get.dialog(
      AlertDialog (
        actions: [
          ButtonWidget(text: "Upload", textColor: Colors.purple, fillColor: Colors.white, fontSize: 20, fontWeight: FontWeight.w500, onPressed: onPressed)
        ],
        content: Column (
        children: [
          TextField (
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
          TextField (
            decoration: const InputDecoration (
              hintText: 'Enter Start Date',
              labelText: 'Start Date',
            ),
            enabled: true,
            //maxLength: 10,
            maxLines: 1,
            obscureText: false,
            keyboardType: TextInputType.text,
          ),
          TextField (
            decoration: const InputDecoration (
              hintText: 'Enter End Date',
              labelText: 'End Date',
            ),
            enabled: true,
            //maxLength: 10,
            maxLines: 1,
            obscureText: false,
            keyboardType: TextInputType.text,
          ),
          TextField (
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
          ButtonWidget(text: "+ Add Media", textColor: Colors.purple, fillColor: Colors.white, fontSize: 20, fontWeight: FontWeight.w500, onPressed: onPressed),
        ],
      ),
        title: const Text("New Contract"),
      ),
      barrierDismissible: true,
    );
  }
}