import 'package:flutter/material.dart';
import 'package:flutter_map/plugin_api.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
import 'package:signage/controllers/dashboard_controller.dart';
import 'package:signage/widgets/base_widgets.dart';
import 'package:signage/widgets/marker_widget.dart';

class FlutterMapWidget extends BaseWidget<DashboardController> {
  
  const FlutterMapWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx( () {
      if (controller.isLoading.value) {
        return const Center(child: CircularProgressIndicator());
      } else {
        return Card (
          child: SizedBox (
            width: double.infinity,
            height: 400,
            child: FlutterMap (
              options: MapOptions(
                center: LatLng(12.8797, 121.7740),
                zoom: 5.0,
              ),
              children: [
                TileLayer (
                  urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                  userAgentPackageName: 'com.digi.digi_signage',
                ),
                MarkerLayer(
                  markers: controller.getMarkers().map((model) =>
                    MarkerWidget (
                      model: model, 
                      path: controller.getPin(model.status)
                    )
                  ).toList(),
                )
              ],
            ),
          )
        );
      }
    }, );
  }
}