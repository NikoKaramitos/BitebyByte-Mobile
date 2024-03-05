import 'package:http/http.dart' as http;
import 'dart:convert';

Future<dynamic> sendPostRequest(String login, String password) async {
  var data;
  final apiUrl =
      Uri.parse('http://bitebybyte-9e423411050b.herokuapp.com/api/login');
  var response = await http.post(apiUrl,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "login": login,
        "password": password,
      }));

  if (response.statusCode == 200) {
    print("POSTED LOGIN");
    data = jsonDecode(response.body);
  } else {
    print(response.statusCode);
  }
  return data;
}
