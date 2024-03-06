import 'package:bitebybyte_mobile/functions/displayError.dart';
import 'package:bitebybyte_mobile/functions/regValidations.dart';
import 'package:bitebybyte_mobile/pages/DashPage.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<dynamic> sendRegisterRequest(String firstName, String lastName,
    String username, String email, String password) async {
  var data;

  final apiUrl =
      Uri.parse('http://bitebybyte-9e423411050b.herokuapp.com/api/register');
  var response = await http.post(apiUrl,
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
  } else if (response.statusCode == 409) {
    data = jsonDecode(response.body);
  } else {
    print("Error registering");
  }
  return data;
}

void registerUser({
  required String firstName,
  required String lastName,
  required String username,
  required String email,
  required String password,
  required String confirmPass,
  required context,
}) async {
  String error = "";
  // Field Validation Checks
  if (firstName.isEmpty) {
    error = "First name field is empty";
  } else if (lastName.isEmpty) {
    error = "Last name field is empty";
  } else if (!userVal(username)) {
    error = "Invalid username";
  } else if (!emailVal(email)) {
    error = "Invalid email: \nUse a format like example@mail.com";
  } else if (!passwordVal(password)) {
    error =
        "Password must contain: \n8 characters \n1 number \n1 special character \n1 capital letter";
  } else if (!passwordConfirm(password, confirmPass)) {
    error = "Password has to match";
  }
  if (error != "") {
    displayError(error, context);
    return;
  }

  sendRegisterRequest(firstName, lastName, username, email, password)
      .then((value) {
    if (value['error'] != "") {
      displayError(error, context);
      return;
    }

    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DashPage(user: value),
        ));
  }).catchError((error) {
    displayError(error, context);
  });
}
