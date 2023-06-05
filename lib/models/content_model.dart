class ContentsModel {

  ContentsModel ( {
    this.contractNumber,
    this.client,
    this.startDate,
    this.endDate,
    this.duration,
    this.fileName,
    this.fileUrl,
    this.fileType,
  } );
  
  final String? contractNumber;
  final String? client;
  final String? startDate;
  final String? endDate;
  final String? duration;

  final String? fileName;
  final String? fileUrl;
  final String? fileType;

  @override
  String toString() {
    return "ContentsModel contractNumber $contractNumber, client $client startDate $startDate, endDate $endDate duration $duration fileName $fileName fileUrl $fileUrl fileType $fileType" ?? super.toString();
  }
}