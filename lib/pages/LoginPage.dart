// ignore_for_file: prefer_const_constructors

import 'dart:convert';
import 'package:bitebybyte_mobile/functions/login.dart';
import "package:http/http.dart" as http;
import 'dart:io';

import 'package:bitebybyte_mobile/pages/DashPage.dart';
import 'package:bitebybyte_mobile/pages/RegisterPage.dart';
import 'package:bitebybyte_mobile/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController userController = TextEditingController();
  TextEditingController passController = TextEditingController();
  String login = "";
  String password = "";
  String firstName = "";
  String lastName = "";
  String id = "";
  String error = "";
  void setUser() {
    login = userController.text;
    if (login.isEmpty) {
      setState(() {
        error = "Username field is empty";
      });
      return;
    }
    password = passController.text;
    if (password.isEmpty) {
      setState(() {
        error = "Password field is empty";
      });
      return;
    }
    sendPostRequest(login, password).then((value) {
      if (value['error'] != "") {
        setState(() {
          this.error = value['error'].toString();
        });
      } else {
        setState(() {
          firstName = value['firstName'];
          lastName = value['lastName'];
          id = value['id'];
        });
        // Now that the state is set with the fetched data, navigate to the DashPage.
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  DashPage(firstName: firstName, lastName: lastName)),
        );
      }
    }).catchError((e) {
      // If there's an error, handle it here
      print(e);
    });
  }

  void goRegister() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => RegisterPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: creamsicle[300],
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Login"),
        backgroundColor: creamsicle,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20.0),
          child: Container(
              height: 500,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //Text(greeting, style: TextStyle(fontSize: 30)),
                  Container(
                    height: 10,
                  ),
                  TextFormField(
                    controller: userController,
                    decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.only(top: 5, right: 8, left: 8),
                        fillColor: Colors.white,
                        filled: true,
                        border: OutlineInputBorder(),
                        labelText: 'Username'),
                  ),
                  Container(
                    height: 10,
                  ),
                  TextFormField(
                    controller: passController,
                    obscureText: true,
                    decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.only(top: 5, right: 8, left: 8),
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(),
                        labelText: 'Password'),
                  ),
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        "Forgot Password",
                        style: TextStyle(fontSize: 10),
                      )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                          onPressed: goRegister, child: Text("Register")),
                      TextButton(
                        onPressed: setUser,
                        child: Text("Login"),
                        statesController: MaterialStatesController(),
                      ),
                    ],
                  ),
                  Text(
                    error,
                    style: TextStyle(color: Colors.red),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
