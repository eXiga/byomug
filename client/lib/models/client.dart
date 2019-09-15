class Client {
  final String name;
  final String token;
  final String id;
  final String username;
  final String password;
  final bool isHost;

  Client(
      {this.name,
      this.token,
      this.id,
      this.username,
      this.password,
      this.isHost});

  Client.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        id = json['_id'],
        token = json['token'],
        username = json['username'],
        isHost = json['isHost'],
        password = "";

  Map<String, dynamic> toJson() => {'username': username, 'password': password};
}
