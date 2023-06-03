import 'package:flutter/material.dart';
import 'package:signage/widgets/base_widgets.dart';

class ListViewContentsHeaderWidget extends BaseWidget {
  
  const ListViewContentsHeaderWidget( { super.key } );

  @override
  Widget build(BuildContext context) {
    return const Row (
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text("Content Playlist", style: TextStyle ( color: Colors.grey, fontSize: 13, fontWeight: FontWeight.w500,),),
        Text("Date Created", style: TextStyle ( color: Colors.grey, fontSize: 13, fontWeight: FontWeight.w500,),),
        Text("Action", style: TextStyle ( color: Colors.grey, fontSize: 13, fontWeight: FontWeight.w500,),),
        Text("Displayed Screen", style: TextStyle ( color: Colors.grey, fontSize: 13, fontWeight: FontWeight.w500,),),
      ],
    );
  }

}