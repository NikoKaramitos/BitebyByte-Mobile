import 'package:bitebybyte_mobile/pages/ProfilePage.dart';
import 'package:flutter/material.dart';
import 'package:bitebybyte_mobile/pages/LoginPage.dart';
import 'package:bitebybyte_mobile/theme/colors.dart';

class DashPage extends StatefulWidget {
  final user;
  const DashPage({super.key, required this.user});

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
        title: const Text("Dashboard"),
        backgroundColor: creamsicle,
        actions: [
          IconButton(
            icon: const Icon(Icons.person),
            tooltip: 'Profile icon',
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ProfilePage(user: widget.user)));
            },
          ),
          IconButton(
            icon: const Icon(Icons.logout),
            tooltip: 'Logout Icon',
            onPressed: logout,
          ),
        ],
      ),
      body: const Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.all(20.0),
                child: Text('Some level selection will go here'),
              )
            ]),
      ),
    );
  }
}
// Costco hotdogs