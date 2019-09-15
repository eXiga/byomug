class Client {
  final String name;
  final String token;
  final String id;
  final String username;
  final String password;

  Client(
      {this.name,
      this.token,
      this.id,
      this.username,
      this.password});

  Client.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        id = json['_id'],
        token = json['token'],
        username = json['username'],
        password = "";

  Map<String, dynamic> toJson() => {'username': username, 'password': password};
}
