import 'location.dart';

class Host {
  final String id;
  final String name;
  final Location location;

  Host({this.id, this.name, this.location});

  factory Host.fromJson(Map<String, dynamic> json) {
    Location location = Location.fromJson(json['location']);
    return Host(
        id: json['_id'] as String,
        name: json['name'] as String,
        location: location);
  }
}
