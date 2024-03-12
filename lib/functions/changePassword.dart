import 'package:bitebybyte_mobile/functions/displayError.dart';
import 'package:bitebybyte_mobile/functions/regValidations.dart';
import 'package:bitebybyte_mobile/pages/DashPage.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<dynamic> sendResetRequest(
    String email, String password, String confirm, context) async {
  var data;
  String error = "";
  if (!passwordVal(password)) {
    error =
        "Password must contain: \n8 characters \n1 number \n1 special character \n1 capital letter";
  } else if (!passwordConfirm(password, confirm)) {
    error = "Password has to match";
  }
  if (error != "") {
    displayError(error, context);
    return;
  }
  print(email);

  final apiUrl = Uri.parse(
      'http://bitebybyte-9e423411050b.herokuapp.com/api/changePassword');
  var response = await http.post(apiUrl,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "email": email,
        "newPassword": password,
      }));

  if (response.statusCode == 200) {
    data = jsonDecode(response.body);
    print("Success: $password, error: $data");
  } else if (response.statusCode == 409) {
    print("Nothing found");
    data = jsonDecode(response.body);
  } else {
    displayError("Failed to reset", context);
  }
  return data;
}
