class ScreensDetailsModel {

  ScreensDetailsModel({
    this.name,
    this.status,
    this.onlineSince,
    this.contentPlaylist,
    this.preview,
  });
  
  final String? name;
  final String? status;
  final String? onlineSince;
  final String? contentPlaylist;
  final String? preview;

  @override
  String toString() {
    return "ScreensDetailsModel name $name, status $status, onlineSince $onlineSince, contentPlaylist $contentPlaylist, preview $preview" ?? super.toString();
  }
}