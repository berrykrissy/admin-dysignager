class MarkerModel {

  MarkerModel( {
    this.name,
    required this.latitude,
    required this.longitude,
    this.status,
    this.onlineSince,
    this.contentPlaylist,
    this.preview,
    this.isSelected,
  } );
  
  final String? name;
  final double latitude;
  final double longitude;
  String? status;
  final String? onlineSince;
  final String? contentPlaylist;
  final String? preview;
  bool? isSelected;

  @override
  String toString() {
    return "MarkerModel name $name, " +
    "latitude $latitude, longitude $longitude, " +
    "status $status onlineSince $onlineSince, " +
    "contentPlaylist $contentPlaylist, preview $preview, " +
    "isSelected $isSelected"?? super.toString();
  }
}