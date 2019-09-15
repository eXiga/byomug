class Client {
  final String name;
  final String token;
  final String id;
  final bool isHost;
  final String username;
  final String password;

  Client(
      {this.name,
      this.token,
      this.id,
      this.isHost,
      this.username,
      this.password});

  Client.fromJson(Map<String, dynamic> json)
      : name = "",
        id = json['_id'],
        isHost = json['isHost'],
        token = json['token'],
        username = json['name'],
        password = "";

  Map<String, dynamic> toJson() => {'name': username, 'password': password};
}
