class User {
  final String username;
  final String token;
  final String id;
  final String password;

  User({this.username, this.token, this.id, this.password});

  User.fromJson(Map<String, dynamic> json)
    : username = json['username'],
      id = json['_id'],
      token = json['token'],
      password = "";

  Map<String, dynamic> toJson() => 
    {
      'username': username,
      'password': password
    };
}