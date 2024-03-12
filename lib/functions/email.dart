import 'package:http/http.dart' as http;
import 'dart:convert';

Future<dynamic> sendPasswordRequest(String emailTo, int code) async {
  var data;

  final apiUrl =
      Uri.parse('http://bitebybyte-9e423411050b.herokuapp.com/api/email');
  var response = await http.post(apiUrl,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "emailTo": emailTo,
        "message": "Enter the digits below to reset your password:\n $code",
        "subject": "Reset Password",
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
