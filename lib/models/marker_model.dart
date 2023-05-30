class MarkerModel {

  MarkerModel({
    this.name,
    required this.latitude,
    required this.longitude,
    this.status,
  });
  
  final String? name;
  final double latitude;
  final double longitude;
  String? status;

  @override
  String toString() {
    return "MarkerModel name $name, latitude $latitude, longitude $longitude status $status" ?? super.toString();
  }
}