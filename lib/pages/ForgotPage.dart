import 'package:bitebybyte_mobile/functions/regValidations.dart';
import 'package:bitebybyte_mobile/theme/colors.dart';
import 'package:flutter/material.dart';

class ForgotPage extends StatefulWidget {
  const ForgotPage({super.key});

  @override
  State<ForgotPage> createState() => _ForgotPageState();
}

class _ForgotPageState extends State<ForgotPage> {
  String error = "";
  MaterialColor color = Colors.red;
  @override
  Widget build(BuildContext context) {
    void sendEmail(email) {
      if (!emailVal(email)) {
        setState(() {
          color = Colors.red;
          error = "*Enter a valid email";
        });
        return;
      } else {
        setState(() {
          color = Colors.green;
          error = "Sent";
        });
      }
    }

    TextEditingController emailController = TextEditingController();
    return Scaffold(
      backgroundColor: creamsicle[300],
      appBar: AppBar(
        backgroundColor: creamsicle[300],
        title: const Text(
          "Forgot Password",
          style: TextStyle(fontSize: 16),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Send a password reset link",
                style: TextStyle(fontSize: 12),
              ),
              Container(
                height: 10,
              ),
              TextFormField(
                controller: emailController,
                decoration: const InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(),
                    labelText: 'Email'),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  error,
                  style: TextStyle(color: color),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  sendEmail(emailController.text);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: orange,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.all(20),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  elevation: 12,
                ),
                child: const Text("Send Email"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
