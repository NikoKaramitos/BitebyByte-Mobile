import 'package:bitebybyte_mobile/functions/displayError.dart';
import 'package:bitebybyte_mobile/pages/DashPage.dart';
import 'package:bitebybyte_mobile/pages/ForgotPage.dart';
import 'package:bitebybyte_mobile/pages/RegisterPage.dart';
import 'package:flutter/material.dart';
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

void goRegister(context) {
  Navigator.push(
      context, MaterialPageRoute(builder: (context) => const RegisterPage()));
}

void goForgot(context) {
  Navigator.push(
      context, MaterialPageRoute(builder: (context) => const ForgotPage()));
}

void setUser(
    {required String login, required String password, required context}) {
  //login = userController.text;
  //password = passController.text;
  String error = "";
  if (login.isEmpty) {
    error = "Username field is empty";
  } else if (password.isEmpty) {
    error = "Password field is empty";
  }
  if (error != "") {
    displayError(error, context);
    return;
  }
  sendPostRequest(login, password).then((value) {
    if (value['error'] != "") {
      error = value['error'].toString();
      displayError(error, context);
    } else {
      // Now that the state is set with the fetched data, navigate to the DashPage.
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => DashPage(user: value)),
      );
    }
  }).catchError((e) {
    // If there's an error, handle it here
    print(e);
  });
}
