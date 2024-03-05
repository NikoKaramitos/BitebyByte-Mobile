import 'package:bitebybyte_mobile/components/fullTitle.dart';
import 'package:bitebybyte_mobile/functions/login.dart';
import 'package:bitebybyte_mobile/pages/DashPage.dart';
import 'package:bitebybyte_mobile/pages/ForgotPage.dart';
import 'package:bitebybyte_mobile/pages/RegisterPage.dart';
import 'package:bitebybyte_mobile/theme/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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
  bool passwordVisible = true;
  void setUser() {
    login = userController.text;
    if (login.isEmpty) {
      setState(() {
        error = "* Username field is empty";
      });
      return;
    }
    password = passController.text;
    if (password.isEmpty) {
      setState(() {
        error = "* Password field is empty";
      });
      return;
    }
    sendPostRequest(login, password).then((value) {
      if (value['error'] != "") {
        setState(() {
          error = '* ${value['error'].toString()}';
        });
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

  void goRegister() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const RegisterPage()));
  }

  @override
  Widget build(BuildContext context) {
    double fs = 48;
    return Scaffold(
      backgroundColor: creamsicle[300],
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 40),
          child: ListView(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    height: 50,
                  ),
                  fullTitle(fs: fs),
                  //Text(greeting, style: TextStyle(fontSize: 30)),
                  Container(
                    height: 30,
                  ),
                  Text(
                    error,
                    style: const TextStyle(color: Colors.red),
                  ),
                  Container(
                    height: 20,
                  ),
                  TextFormField(
                    controller: userController,
                    decoration: const InputDecoration(
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
                    obscureText: passwordVisible,
                    decoration: InputDecoration(
                        contentPadding:
                            const EdgeInsets.only(top: 5, right: 8, left: 8),
                        filled: true,
                        fillColor: Colors.white,
                        border: const OutlineInputBorder(),
                        labelText: 'Password',
                        suffixIcon: IconButton(
                            icon: Icon(passwordVisible
                                ? Icons.visibility
                                : Icons.visibility_off),
                            onPressed: () {
                              setState(
                                () {
                                  passwordVisible = !passwordVisible;
                                },
                              );
                            })),
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ForgotPage(),
                            ));
                      },
                      child: const Text(
                        "Forgot Password",
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      )),

                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: orange,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.all(20),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                      elevation: 12,
                    ),
                    onPressed: setUser,
                    statesController: MaterialStatesController(),
                    child: const Text(
                      "Login",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  Container(
                    height: 150,
                  ),
                  TextButton(
                    onPressed: goRegister,
                    child: const Text(
                      "New? Sign Up!",
                      style: TextStyle(
                        fontSize: 12, //decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
