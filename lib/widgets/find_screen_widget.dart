import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:signage/widgets/base_widgets.dart';

class FindScreenWidget extends BaseWidget {
  
  const FindScreenWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 70,
      child: Container (
        padding: const EdgeInsets.all(30),
        color: Colors.yellow,
        alignment: Alignment.center,
        child: Column(
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Welcome to DYSIGNER Dashboard!", style: TextStyle ( fontSize: 25, fontWeight: FontWeight.w500,),),
                Text("Dysignager", style: TextStyle ( fontSize: 25, fontWeight: FontWeight.w500,),),
              ],
            ),
            Card (
              color: Colors.transparent,
              shape: RoundedRectangleBorder(
                side: const BorderSide(
                  color: Colors.grey,
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Icon (
                        CupertinoIcons.map_pin_slash,
                        color: Colors.green,
                      ),
                      Text("Online", style: TextStyle ( fontSize: 13, fontWeight: FontWeight.w500,),),
                    ],
                  ),
                  Text("0", style: TextStyle ( fontSize: 25, fontWeight: FontWeight.w500,),),
                  Column(
                    children: [
                      Icon (
                        CupertinoIcons.map_pin_slash,
                        color: Colors.red,
                      ),
                      Text("Out of Sync", style: TextStyle ( fontSize: 13, fontWeight: FontWeight.w500,),),
                    ],
                  ),
                  Text("0", style: TextStyle ( fontSize: 25, fontWeight: FontWeight.w500,),),
                  Column(
                    children: [
                      Icon (
                        CupertinoIcons.map_pin_slash,
                        color: Colors.orange,
                      ),
                      Text("Offline", style: TextStyle ( fontSize: 13, fontWeight: FontWeight.w500,),),
                    ],
                  ),
                  Text("0", style: TextStyle ( fontSize: 25, fontWeight: FontWeight.w500,),),
                  Column(
                    children: [
                      Icon (
                        CupertinoIcons.map_pin_slash,
                        color: Colors.blue,
                      ),
                      Text("Disabled", style: TextStyle ( fontSize: 13, fontWeight: FontWeight.w500,),),
                    ],
                  ),
                  Text("0", style: TextStyle ( fontSize: 25, fontWeight: FontWeight.w500,),),
                ],
              ),
            ),
          ]
        ),
      )
    );
  }
}