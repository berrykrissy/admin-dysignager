import 'package:cloud_firestore/cloud_firestore.dart';

class LocationsModel {
  String? name;
  String? address;
  GeoPoint? gps;
  String? onlineSince;
  String? status;

  LocationsModel( {
    this.name, 
    this.address,
    this.gps, 
    this.onlineSince,
    this.status,
  } );

  Map<String, dynamic> toMap() => {
    "name": name, 
    "address": address,
    "gps": gps,
    "online_since": onlineSince,
    "status": status,
  };

  LocationsModel.fromSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String,dynamic>;
    name = data['name'];
    address = data['address'];
    gps = data['gps'];
    onlineSince = data['online_since'];
    status = data ['status'];
  }
}