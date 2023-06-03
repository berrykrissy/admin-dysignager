import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:signage/widgets/base_widgets.dart';
import 'package:signage/widgets/button_widget.dart';

class ContentsFooterWidget extends BaseWidget {
  
  const ContentsFooterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding (
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row (
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ButtonWidget(text: "+ Add Content Playlist", textColor: Colors.purple, fillColor: Colors.white, fontSize: 20, fontWeight: FontWeight.w500, onPressed: () {
            Get.snackbar("Test", "+ Add Content Playlist");
          } ),
          ButtonWidget(text: "View all", textColor: Colors.purple, fillColor: Colors.white, fontSize: 20, fontWeight: FontWeight.w500, onPressed: () {
            Get.snackbar("Test", "View all");
          } )
        ],
      ),
    );
  }

}