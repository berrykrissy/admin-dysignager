import 'package:flutter/material.dart';
import 'package:signage/widgets/base_widgets.dart';

class DashboardHeaderWidget extends BaseWidget {
  
  const DashboardHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container (
      margin: const EdgeInsets.only(left: 30, right: 30, top: 20, bottom: 10),
      child: Row (
        children: [
          const Text("Welcome to DYSIGNAGER Dashboard!", style: TextStyle ( fontSize: 25, fontWeight: FontWeight.w500,),),
          const Spacer(),
          Image.asset(
            "assets/DYSIGNAGER.webp",
            width: 200,
            height: 70,
          ),
        ],
      ),
    );
  }
}