import 'package:cloud_firestore/cloud_firestore.dart';

class LocationsModel {
  String? id;
  String? name;
  String? address;
  GeoPoint? gps;
  String? onlineSince;
  String? status;

  LocationsModel( {
    this.id,
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
    id = snapshot.id;
    name = data['name'];
    address = data['address'];
    gps = data['gps'];
    onlineSince = data['online_since'];
    status = data ['status'];
  }

  @override
  String toString() {
    return "LocationsModel id $id, name $name, address $address, gps $gps, onlineSince $onlineSince, status $status" ?? super.toString();
  }
}