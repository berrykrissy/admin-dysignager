import 'package:cloud_firestore/cloud_firestore.dart';

class AdvertisementModel {
  String? id; //documentID
  String? client;
  String? mediaName;
  String? mediaUrl;
  String? mediaType;
  DateTime? startDate;
  DateTime? endDate;
  int? duration;
  String? location;

  AdvertisementModel( {
    this.id,
    this.client,
    this.mediaName,
    this.mediaUrl,
    this.mediaType,
    this.startDate,
    this.endDate,
    this.duration,
    this.location
  } );

  Map<String, dynamic> toMap() => {
    "client": client,
    "mediaName": mediaName,
    "mediaUrl": mediaUrl,
    "mediaType": mediaType,
    "startDate": startDate,
    "endDate": endDate,
    "duration": duration,
    "location": location
  };

  //use this is the dataype of the data is document, which will directly come from cloud_firesto
  AdvertisementModel.fromSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>;
    id = snapshot.id;
    client = data['client'];
    mediaUrl = data['mediaName'];
    mediaUrl = data['mediaUrl'];
    mediaType = data['mediaType'];
    startDate = (data['startDate'] as Timestamp).toDate();
    endDate = (data['endDate'] as Timestamp).toDate();
    duration = data['duration'];
    location = data['location'];
  }

  //use this if the datatype of the data is in Map<String,dynamic> or Json
  AdvertisementModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    client = json['client'];
    mediaType = json['mediaName'];
    mediaType = json['mediaType'];
    mediaUrl = json['mediaUrl'];
    startDate = (json['startDate'] as Timestamp).toDate();
    endDate = (json['endDate'] as Timestamp).toDate();
    duration = json['duration'];
    location = json['location'];
  }
}