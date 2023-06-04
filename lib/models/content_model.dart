class ContentsModel {

  ContentsModel ( {
    this.mediaUploaded,
    this.screenToDisplay,
    this.dateToPublish,
    this.duration,
  } );
  
  final String? mediaUploaded;
  final String? screenToDisplay;
  final String? dateToPublish;
  final String? duration;

  @override
  String toString() {
    return "ContentsModel mediaUploaded $mediaUploaded, screenToDisplay $screenToDisplay dateToPublish $dateToPublish duration $duration" ?? super.toString();
  }
}