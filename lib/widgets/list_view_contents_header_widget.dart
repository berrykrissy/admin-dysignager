import 'package:flutter/material.dart';
import 'package:signage/widgets/base_widgets.dart';

class ListViewContentsHeaderWidget extends BaseWidget {
  
  const ListViewContentsHeaderWidget( { super.key } );

  @override
  Widget build(BuildContext context) {
    return const Row (
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text("Media Uploaded", style: TextStyle ( color: Colors.grey, fontSize: 13, fontWeight: FontWeight.w500,),),
        Text("Screen to Display", style: TextStyle ( color: Colors.grey, fontSize: 13, fontWeight: FontWeight.w500,),),
        Text("Date to Publish to", style: TextStyle ( color: Colors.grey, fontSize: 13, fontWeight: FontWeight.w500,),),
        Text("Date to Publish from", style: TextStyle ( color: Colors.grey, fontSize: 13, fontWeight: FontWeight.w500,),),
        Text("Duration (s)", style: TextStyle ( color: Colors.grey, fontSize: 13, fontWeight: FontWeight.w500,),),
        SizedBox( width: 13,),
      ],
    );
  }
}