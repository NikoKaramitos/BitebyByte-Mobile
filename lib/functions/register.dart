import 'package:http/http.dart' as http;
import 'dart:convert';

Future<dynamic> sendRegistration(String firstName, String lastName, String username, String email, String password) async {

  var data;

  final apiUrl = Uri.parse('http://bitebybyte-9e423411050b.herokuapp.com/api/register');
  var response = await http.post(
    apiUrl,
    headers: {"Content-Type": "application/json"},
    body: jsonEncode({
      "firstName": firstName,
      "lastName": lastName,
      "username": username,
      "email": email,
      "password": password,
    }));

    if (response.statusCode == 200) {
      data = jsonDecode(response.body);
    } else {
      print("Failed to create post!");
    }
    return data;
}