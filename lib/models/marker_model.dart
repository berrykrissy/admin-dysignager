class MarkerModel {

  MarkerModel( {
    this.name,
    required this.latitude,
    required this.longitude,
    this.status,
    this.isSelected,
  } );
  
  final String? name;
  final double latitude;
  final double longitude;
  String? status;
  bool? isSelected;

  @override
  String toString() {
    return "MarkerModel name $name, latitude $latitude, longitude $longitude, status $status isSelected $isSelected"?? super.toString();
  }
}