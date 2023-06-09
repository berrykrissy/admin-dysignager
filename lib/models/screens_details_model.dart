class ScreensDetailsModel {

  ScreensDetailsModel( {
    this.name,
    this.status,
    this.onlineSince,
    this. location,
    this.preview,
    this.isShowed,
  } );
  
  final String? name;
  final String? status;
  final String? onlineSince;
  String? location;
  final String? preview;
  bool? isShowed;

  @override
  String toString() {
    return "ScreensDetailsModel name $name, status $status, onlineSince $onlineSince, location $location, preview $preview, isShowed $isShowed" ?? super.toString();
  }
}