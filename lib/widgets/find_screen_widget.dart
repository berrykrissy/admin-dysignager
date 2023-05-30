import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:signage/widgets/base_widgets.dart';
import 'package:signage/widgets/flutter_map_widget.dart';
import 'package:signage/widgets/status_widget.dart';

class FindScreenWidget extends BaseWidget {
  
  const FindScreenWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Flexible (
      flex: 70,
      child: Container (
        padding: const EdgeInsets.all(30),
        alignment: Alignment.center,
        child: const Column (
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Welcome to DYSIGNER Dashboard!", style: TextStyle ( fontSize: 25, fontWeight: FontWeight.w500,),),
                Text("Dysignager", style: TextStyle ( fontSize: 25, fontWeight: FontWeight.w500,),),
              ],
            ),
            SizedBox(height: 13,),
            StatusWidget(),
            SizedBox(height: 13,),
            FlutterMapWidget(),
          ]
        ),
      )
    );
  }
}