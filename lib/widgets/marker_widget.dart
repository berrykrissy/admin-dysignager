import 'package:flutter/cupertino.dart';
import 'package:flutter_map/plugin_api.dart';
import 'package:latlong2/latlong.dart';
import 'package:signage/models/marker_model.dart';

class MarkerWidget extends Marker {
  
  MarkerWidget( {
    super.key,
    required this.model,
    required this.colour,
  } ): super (
    point: LatLng(model.latitude, model.longitude),
    builder: (context) {
      return Icon (
        CupertinoIcons.map_pin_ellipse,
        color: colour,
      );
    },
  );

  final MarkerModel model;
  final Color colour;
}