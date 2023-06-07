import 'package:cloud_firestore/cloud_firestore.dart';

class LocationsModel {
  String? name;
  String? address;

  LocationsModel({this.name, this.address});

  Map<String, dynamic> toMap() => {"name": name, "address": address};

  LocationsModel.fromSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String,dynamic>;
    name = data['name'];
    address = data['address'];
  }
}
