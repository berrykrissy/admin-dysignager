class MarkerModel {

  MarkerModel({
    this.name,
    required this.latitude,
    required this.longitude,
  });
  
  final String? name;
  final double latitude;
  final double longitude;

  @override
  String toString() {
    return "MarkerModel name $name, latitude $latitude, longitude $longitude" ?? super.toString();
  }
}