class PlaylistModel {

  PlaylistModel({
    this.name,
    this.date,
    this.status,
  });
  
  final String? name;
  final String? date;
  final String? status;

  @override
  String toString() {
    return "PlaylistModel name $name, date $date status $status" ?? super.toString();
  }
}