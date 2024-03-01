import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:bitebybyte_mobile/pages/LoginPage.dart';
import 'package:bitebybyte_mobile/theme/colors.dart';

class DashPage extends StatefulWidget {
  final String firstName;
  final String lastName;
  const DashPage({super.key, required this.firstName, required this.lastName});

  @override
  State<DashPage> createState() => _DashPageState();
}

class _DashPageState extends State<DashPage> {
  void logout() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const LoginPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: creamsicle[300],
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Dashboard"),
        backgroundColor: creamsicle,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            tooltip: 'Logout Icon',
            onPressed: logout,
          )
        ],
      ),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [Text('hello ${widget.firstName} ${widget.lastName}')]),
      ),
    );
  }
}
// Costco hotdogs