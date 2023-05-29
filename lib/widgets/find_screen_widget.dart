import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/plugin_api.dart';
import 'package:latlong2/latlong.dart';
import 'package:signage/widgets/base_widgets.dart';

class FindScreenWidget extends BaseWidget {
  
  const FindScreenWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Flexible (
      flex: 70,
      child: Container (
        padding: const EdgeInsets.all(30),
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
            const SizedBox(height: 13,),
            Card (
              color: Colors.white,
              shape: RoundedRectangleBorder(
                side: const BorderSide(
                  color: Colors.grey,
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Container(
                padding: const EdgeInsets.fromLTRB(0, 30, 0, 30),
                child: const Row (
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Icon (
                        CupertinoIcons.map_pin_ellipse,
                        color: Colors.green,
                      ),
                      Text("Online", style: TextStyle ( fontSize: 13, fontWeight: FontWeight.w500,),),
                    ],
                  ),
                  Text("0", style: TextStyle ( fontSize: 25, fontWeight: FontWeight.w500,),),
                  Column(
                    children: [
                      Icon (
                        CupertinoIcons.map_pin_ellipse,
                        color: Colors.red,
                      ),
                      Text("Out of Sync", style: TextStyle ( fontSize: 13, fontWeight: FontWeight.w500,),),
                    ],
                  ),
                  Text("0", style: TextStyle ( fontSize: 25, fontWeight: FontWeight.w500,),),
                  Column(
                    children: [
                      Icon (
                        CupertinoIcons.map_pin_ellipse,
                        color: Colors.orange,
                      ),
                      Text("Offline", style: TextStyle ( fontSize: 13, fontWeight: FontWeight.w500,),),
                    ],
                  ),
                  Text("0", style: TextStyle ( fontSize: 25, fontWeight: FontWeight.w500,),),
                  Column(
                    children: [
                      Icon (
                        CupertinoIcons.map_pin_ellipse,
                        color: Colors.blue,
                      ),
                      Text("Disabled", style: TextStyle ( fontSize: 13, fontWeight: FontWeight.w500,),),
                    ],
                  ),
                  Text("0", style: TextStyle ( fontSize: 25, fontWeight: FontWeight.w500,),),
                ],
              ),
              )
            ),
            const SizedBox(height: 13,),
            Card (
              child: SizedBox (
                width: double.infinity,
                height: 400,
                child: FlutterMap (
                  options: MapOptions(
                    //center: LatLng(51.509364, -0.128928),
                    center: LatLng(12.8797, 121.7740),
                    zoom: 5.0,
                  ),
                  children: [
                    TileLayer (
                      urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                      userAgentPackageName: 'com.example.app',
                    ),
                  ],
                ),
              )
            ),
          ]
        ),
      )
    );
  }
}