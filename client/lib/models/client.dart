class Client {
  final String username;
  final String token;
  final String id;
  final String password;

  Client({this.username, this.token, this.id, this.password});

  Client.fromJson(Map<String, dynamic> json)
    : username = json['name'],
      id = json['_id'],
      token = json['token'],
      password = "";

  Map<String, dynamic> toJson() => 
    {
      'name': username,
      'password': password
    };
}