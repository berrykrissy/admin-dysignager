class ContentsModel {

  ContentsModel ( {
    this.client,
    this.startDate,
    this.endDate,
    this.location,
    this.duration,
    this.fileName,
    this.fileUrl,
    this.fileType,
  } );
  
  final String? client;
  final String? startDate;
  final String? endDate;
  final String? location;
  final String? duration;

  final String? fileName;
  final String? fileUrl;
  final String? fileType;

  @override
  String toString() {
    return "ContentsModel client $client startDate $startDate, endDate $endDate location $location duration $duration fileName $fileName fileUrl $fileUrl fileType $fileType" ?? super.toString();
  }
}