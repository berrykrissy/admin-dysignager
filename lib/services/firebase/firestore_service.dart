import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:signage/models/advertisement_model.dart';
import 'package:signage/models/locations_model.dart';
import 'package:signage/models/schedule.model.dart';

class FirestoreService extends GetxService {
  final dbFirestore = FirebaseFirestore.instance;

  Future<void> createLocation(Map<String, dynamic> data) async {
    await dbFirestore.collection("location").add(data);
  }

  //GET: get all locations
  Future<List<LocationsModel>> getLocations() async {
    final response = await dbFirestore.collection("location").get();
    return response.docs
        .map((doc) => LocationsModel.fromSnapshot(doc))
        .toList();
  }

  //GET: get locations by name
  Future<List<LocationsModel>> getLocationsByIdByCity(String? locationName) async {
     final response = await dbFirestore
            .collection("location")
            .where("name", isEqualTo: locationName)
            .get();
     return response.docs.map((doc) => LocationsModel.fromSnapshot(doc))
        .toList();
  }

  //GET: get location by ID
  Future<LocationsModel> getLocationById(String? docid) async {
    final response = await dbFirestore.collection("location").doc(docid).get();
    return LocationsModel.fromSnapshot(response);
  }

  //PUT: update location
  Future<void> updateLocation(String? docid, Map<String,dynamic> data) async {
    await dbFirestore.collection("location").doc(docid).update(data);
  }

  Future<void> updateStatus(String? docid, Map<String,dynamic> data) async {
    await dbFirestore.collection("location").doc(docid).update(data);
  }

  //DELETE: update location
  Future<void> deleteLocation(String? docid) async {
    await dbFirestore.collection("location").doc(docid).delete();
  }

  //GET: Get All Schedule
  Future<List<ScheduleModel>> getSchedule() async {
    final response = await dbFirestore.collection("schedule").get();
    return response.docs.map((doc) => ScheduleModel.fromSnapshot(doc)).toList();
  }

  //GET: Get Schedule by date
  Future<List<LocationsModel>> getScheduleByDate(DateTime startDate, DateTime endDate) async {
    final response = await dbFirestore
        .collection("schedule")        
        .where("startDate", isGreaterThanOrEqualTo: startDate)
        .where("startDate", isLessThanOrEqualTo: endDate)
        .get();
    return response.docs
        .map((doc) => LocationsModel.fromSnapshot(doc))
        .toList();
  }

  //POST: create schedule
  Future<void> createSchedule(Map<String, dynamic> data) async {
    await dbFirestore.collection("schedule").add(data);
  }

  //PUT: update schedule
  Future<void> updateSchedule(String? docid, Map<String, dynamic> data) async {
    await dbFirestore.collection("schedule").doc(docid).update(data);
  }

  //DELETE: update schedule
  Future<void> deleteSchedule(String? docid) async {
    await dbFirestore.collection("schedule").doc(docid).delete();
  }

  //GET: Get All advertisements
  Future<List<AdvertisementModel>> getAdvertisement() async {
    final response = await dbFirestore.collection("advertisement").get();
    return response.docs
        .map((doc) => AdvertisementModel.fromSnapshot(doc))
        .toList();
  }

  //POST: create advertisements
  Future<void> createAdvertisement(Map<String, dynamic> data) async {
    await dbFirestore.collection("advertisement").add(data);
  }

  //PUT: update advertisements
  Future<void> updateAdvertisement(String? id, Map<String, dynamic> data) async {
    await dbFirestore.collection("advertisement").doc(id).update(data);
  }

  //DELETE: delete advertisement
  Future<void> deleteAdvertisement(String? docId) async {
    await dbFirestore.collection("advertisement").doc(docId).delete();
  }
}
