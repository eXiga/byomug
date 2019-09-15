import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:byomug/models/client.dart';

class UserService {
  static Future<Client> authenticateUser(Map body) async {
    final response = await http.post(
      'https://byomug.herokuapp.com/users/authenticate',  body: body);

    if (response.statusCode != 200) {
      throw('request failed :(');
    } else {
      var user = Client.fromJson(json.decode(response.body));
      return user;
    }
  }

  static Future<Client> registerUser(Map body) async {
    final response = await http.post(
      'https://byomug.herokuapp.com/users/register',  body: body);

    if (response.statusCode != 200) {
      throw('request failed :(');
    } else {
      var user = Client.fromJson(json.decode(response.body));
      return user;
    }
  }
}