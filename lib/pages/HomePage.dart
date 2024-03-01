// ignore_for_file: prefer_const_constructors

import 'dart:async';

import 'package:bitebybyte_mobile/components/title.dart';
import 'package:bitebybyte_mobile/pages/LoginPage.dart';
import 'package:bitebybyte_mobile/theme/colors.dart';
import 'package:flutter/material.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 4),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => LoginPage())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: creamsicle[300],
      body: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            // Title
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Column(children: [
                Padding(
                    padding: const EdgeInsets.only(right: 60.0),
                    child: MyTitle(text: "Bite", color: blue)),
                Padding(
                  padding: const EdgeInsets.only(right: 80.0),
                  child: MyTitle(text: "By", color: Colors.black),
                ),
                MyTitle(text: "Byte", color: Color.fromARGB(255, 93, 37, 17)),
              ]),
            ),
            // Picture

            Padding(
              padding: const EdgeInsets.only(left: 60.0, right: 0),
              child: Image.asset(
                'lib/images/bear_blue.png',
                height: 450,
                fit: BoxFit.fill,
              ),
            ),
          ]),
    );
  }
}

// can u go to login and do the hover imports
// what did you say carlos? si senor