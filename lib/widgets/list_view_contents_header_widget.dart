import 'package:flutter/material.dart';
import 'package:signage/widgets/base_widgets.dart';

class ListViewContentsHeaderWidget extends BaseWidget {
  
  const ListViewContentsHeaderWidget( { super.key } );

  @override
  Widget build(BuildContext context) {
    return const Row (
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text("Contract Number", style: TextStyle ( color: Colors.grey, fontSize: 13, fontWeight: FontWeight.w500,),),
        Text("Client", style: TextStyle ( color: Colors.grey, fontSize: 13, fontWeight: FontWeight.w500,),),
        Text("Start Date", style: TextStyle ( color: Colors.grey, fontSize: 13, fontWeight: FontWeight.w500,),),
        Text("End Date", style: TextStyle ( color: Colors.grey, fontSize: 13, fontWeight: FontWeight.w500,),),
        Text("Duration", style: TextStyle ( color: Colors.grey, fontSize: 13, fontWeight: FontWeight.w500,),),
        Text("File Name", style: TextStyle ( color: Colors.grey, fontSize: 13, fontWeight: FontWeight.w500,),),
      ],
    );
  }
}