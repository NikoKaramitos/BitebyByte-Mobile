import 'package:bitebybyte_mobile/functions/displayError.dart';
import 'package:bitebybyte_mobile/functions/regValidations.dart';
import 'package:bitebybyte_mobile/pages/LoginPage.dart';
import 'package:bitebybyte_mobile/pages/ResetPage.dart';
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
  } else if (response.statusCode == 409) {
    data = jsonDecode(response.body);
  } else {
    displayError("Failed to reset", context);
  }
  return data;
}

Future<dynamic> sendEmailRequest(String emailTo, int code) async {
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

void goReset(code, context, email) {
  print(code);
  Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => ResetPage(
                code: code,
                email: email,
              )));
}

void tryReset(
    {required String email,
    required String password,
    required String confirm,
    required BuildContext context}) {
  sendResetRequest(
    email,
    password,
    confirm,
    context,
  ).then((value) {
    if (value['error'] != "") {
      displayError(value['error'], context);
      return;
    }
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const LoginPage(),
        ));
  }).catchError((error) {
    displayError(error, context);
  });
}
