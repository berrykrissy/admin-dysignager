class ScreensDetailsModel {

  ScreensDetailsModel({
    this.name,
    this.status,
    this.onlineSince,
    this.contentPlaylist,
    this.preview,
    this.isShowed,
  });
  
  final String? name;
  final String? status;
  final String? onlineSince;
  final String? contentPlaylist;
  final String? preview;
  bool? isShowed;

  @override
  String toString() {
    return "ScreensDetailsModel name $name, status $status, onlineSince $onlineSince, contentPlaylist $contentPlaylist, preview $preview, isShowed $isShowed" ?? super.toString();
  }
}