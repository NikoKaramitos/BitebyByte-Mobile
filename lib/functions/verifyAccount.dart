import 'package:http/http.dart' as http;
import 'dart:convert';

Future<dynamic> sendEmailVerifyRequest(String emailTo, int code) async {
  var data;

  final apiUrl =
      Uri.parse('http://bitebybyte-9e423411050b.herokuapp.com/api/email');
  var response = await http.post(apiUrl,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "emailTo": emailTo,
        "message": "Enter the digits below to verify your account:\n $code",
        "subject": "Verify Account",
      }));

  if (response.statusCode == 200) {
    data = jsonDecode(response.body);
    // } else if (response.statusCode == 409) {
    //   data = jsonDecode(response.body);
  } else {
    print("Error sending email");
  }
  return data;
}

Future<dynamic> verify(int code) async {
  var data;

  final apiUrl =
      Uri.parse('http://bitebybyte-9e423411050b.herokuapp.com/api/verify');
  var response = await http.post(apiUrl,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({"code": code}));

  if (response.statusCode == 200) {
    data = jsonDecode(response.body);
    print("VERIFIED");
    // } else if (response.statusCode == 409) {
    //   data = jsonDecode(response.body);
  } else {
    print("Error verifying");
  }
  return data;
}
