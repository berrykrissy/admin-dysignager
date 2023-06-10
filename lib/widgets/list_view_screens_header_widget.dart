import 'package:flutter/material.dart';
import 'package:signage/widgets/base_widgets.dart';

class ListViewScreensHeaderWidget extends BaseWidget {
  
  const ListViewScreensHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row (
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text("Screen Name", style: TextStyle ( color: Colors.grey, fontSize: 13, fontWeight: FontWeight.w500,),),
        Text("Status", style: TextStyle ( color: Colors.grey, fontSize: 13, fontWeight: FontWeight.w500,),),
        Text("Online Since", style: TextStyle ( color: Colors.grey, fontSize: 13, fontWeight: FontWeight.w500,),),
        Text("Location", style: TextStyle ( color: Colors.grey, fontSize: 13, fontWeight: FontWeight.w500,),),
        SizedBox()
      ],
    );
  }
}