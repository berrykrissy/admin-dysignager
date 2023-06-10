class ScreensDetailsModel {

  ScreensDetailsModel( {
    this.id,
    this.name,
    this.status,
    this.onlineSince,
    this. location,
    this.isShowed,
  } );
  
  final String? id;
  final String? name;
  String? status;
  final String? onlineSince;
  String? location;
  bool? isShowed;

  @override
  String toString() {
    return "ScreensDetailsModel id $id, name $name, status $status, onlineSince $onlineSince, location $location, isShowed $isShowed" ?? super.toString();
  }
}