import 'package:flutter/material.dart';
import 'package:signage/widgets/base_widgets.dart';

class DashboardHeaderWidget extends BaseWidget {
  
  const DashboardHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container (
      margin: const EdgeInsets.only(left: 30, right: 30, top: 20, bottom: 10),
      child: const Row (
        children: [
          Text("Welcome to DYSIGNER Dashboard!", style: TextStyle ( fontSize: 25, fontWeight: FontWeight.w500,),),
          Spacer(),
          Text("Dysignager", style: TextStyle ( fontSize: 25, fontWeight: FontWeight.w500,),),
        ],
      ),
    );
  }
}