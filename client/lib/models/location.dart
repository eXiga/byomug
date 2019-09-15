class Location {
  final double latitude;
  final double longitude;

  Location({this.latitude, this.longitude});

  factory Location.fromJson(Map<String, dynamic> json) {
    List coordinates = json['coordinates'];
    return Location(latitude: coordinates[0], longitude: coordinates[1]);
  }
}
