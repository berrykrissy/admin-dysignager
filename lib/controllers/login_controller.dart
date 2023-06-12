import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:signage/controllers/base_controller.dart';
import 'package:signage/models/locations_model.dart';
import 'package:signage/routes/app_pages.dart';
import 'package:signage/services/firebase/firestore_service.dart';
import 'package:signage/utils/constants.dart';

class LoginController extends BaseController {

  LoginController(FirestoreService this._service,) {
    debugPrint("LoginController Constructor");
  }

final FirestoreService _service;
LocationsModel? _locations = null;
  RxBool isLoading = false.obs;
  final TextEditingController? usernameController = new TextEditingController();
  final TextEditingController? passwordController = new TextEditingController();

  @override
  Future<void> onInit() async {
    super.onInit();
    debugPrint("LoginController _launchLogin");
    _handleLocationPermission();
    getLocation();
  }

  Future<bool> _handleLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;
    
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      Get.snackbar("GPS","Location services are disabled. Please enable the services");
      return false;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {   
        Get.snackbar("GPS","Location permissions are denied");
        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      Get.snackbar("GPS","Location permissions are permanently denied, we cannot request permissions.");
      return false;
    }
    return true;
  }

  Future<void> getLocation() async {
    debugPrint("SplashController getLocation");
    final snapshot = await _service.getLocationsByIdByCity(Constants.CITY);
    _locations = snapshot.firstOrNull;
  }

  Future<void> checkCredentials() async {
    debugPrint("LoginController checkCredentials ${usernameController?.text} ${passwordController?.text}");
    isLoading(true);
    if (await _handleLocationPermission()) {
      Position position = await Geolocator.getCurrentPosition ( desiredAccuracy: LocationAccuracy.best);
      _service.updateLocation (
        _locations?.id, 
        LocationsModel (
          name: _locations?.name,
          address: _locations?.address,
          gps: GeoPoint(position.latitude ,position.longitude),
          onlineSince: _locations?.onlineSince,
          status: _locations?.status,
          isEnabled: _locations?.isEnabled,
        ).toMap()
      );
    }
    if(usernameController?.text == "Admin" && passwordController?.text == "123") {
      Get.snackbar("Credentials", "Login Succeed");
      _launchDashboard();
    } else {
      Get.snackbar("Credentials", "Login Failed");
    }
    isLoading(false);
  }

  void _launchDashboard() {
    debugPrint("LoginController _launchDashboard");
    Get.toNamed(Routes.DASHBOARD);
  }
  
  @override
  void onClose() {
    debugPrint("LoginController onClose");
    super.onClose();
  }
}