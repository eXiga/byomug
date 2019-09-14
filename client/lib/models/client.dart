class Client {
  final String name;
  final String token;
  final String id;
  final bool isHost;
  final String password;

  Client({this.name, this.token, this.id, this.isHost, this.password});

  Client.fromJson(Map<String, dynamic> json)
    : name = json['name'],
      id = json['_id'],
      isHost = json['isHost'],
      token = json['token'],
      password = "";

  Map<String, dynamic> toJson() => 
    {
      'name': name,
      'password': password
    };
}