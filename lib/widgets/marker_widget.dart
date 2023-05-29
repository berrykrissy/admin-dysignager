import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/plugin_api.dart';
import 'package:latlong2/latlong.dart';
import 'package:signage/models/marker_model.dart';

class MarkerWidget extends Marker {
  
  MarkerWidget( {
    super.key,
    required this.model
  } ): super (
    point: LatLng(model.latitude, model.longitude),
    builder: (context) {
      return const Icon (
        CupertinoIcons.map_pin_ellipse,
        color: Colors.yellow,
      );
    },
  );

  final MarkerModel model;
}