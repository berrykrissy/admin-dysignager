import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/plugin_api.dart';
import 'package:latlong2/latlong.dart';
import 'package:signage/models/marker_model.dart';

class MarkerWidget extends Marker {
  
  MarkerWidget( {
    super.key,
    required this.model,
    required this.path,
  } ): super (
    point: LatLng(model.latitude, model.longitude),
    builder: (context) {
      return Image.asset(
        path,
      );
    },
  );

  final MarkerModel model;
  final String path;
}