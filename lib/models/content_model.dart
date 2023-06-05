class ContentsModel {

  ContentsModel ( {
    this.mediaUploaded,
    this.screenToDisplay,
    this.dateToPublishTo,
    this.dateToPublishFrom,
    this.duration,
  } );
  
  final String? mediaUploaded;
  final String? screenToDisplay;
  final String? dateToPublishTo;
  final String? dateToPublishFrom;
  final String? duration;

  @override
  String toString() {
    return "ContentsModel mediaUploaded $mediaUploaded, screenToDisplay $screenToDisplay dateToPublishTo $dateToPublishTo, dateToPublishFrom $dateToPublishFrom duration $duration" ?? super.toString();
  }
}