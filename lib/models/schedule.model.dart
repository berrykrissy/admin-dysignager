import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:signage/models/advertisement_model.dart';


class ScheduleModel {
  String? locationId;
  AdvertisementModel? advertisement;

  ScheduleModel({this.locationId, this.advertisement});

  Map<String, dynamic> toMap() =>
      {"locationid": locationId, "advertisement": advertisement};

  ScheduleModel.fromSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>;
    locationId = data['locationid'];
    advertisement = AdvertisementModel.fromJson(data['advertisement']);
  }
}
