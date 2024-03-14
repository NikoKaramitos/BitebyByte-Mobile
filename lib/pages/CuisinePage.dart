// import 'dart:html';

import 'package:bitebybyte_mobile/components/cuisineCard.dart';
import 'package:bitebybyte_mobile/components/fullTitle.dart';
import 'package:bitebybyte_mobile/components/loginFields.dart';
import 'package:bitebybyte_mobile/components/primaryButton.dart';
import 'package:bitebybyte_mobile/components/secondaryButton.dart';
import 'package:bitebybyte_mobile/functions/login.dart';
import 'package:bitebybyte_mobile/theme/colors.dart';
import 'package:flutter/material.dart';


class CuisinePage extends StatefulWidget {
  const CuisinePage({super.key});

  @override
  State<CuisinePage> createState() => _cuisinePage();
}
// ignore: camel_case_types
class _cuisinePage extends State<CuisinePage>{  
  @override
  Widget build(BuildContext context) {

    final List<Map<String, String>> cuisines = [
      {"name": "Italian", "flag": "lib/images/Flag_of_Italy.png"},
      {"name": "Italian", "flag": "lib/images/Flag_of_Italy.png"},
      {"name": "Italian", "flag": "lib/images/Flag_of_Italy.png"},
      {"name": "Italian", "flag": "lib/images/Flag_of_Italy.png"},
      {"name": "Italian", "flag": "lib/images/Flag_of_Italy.png"},
      {"name": "Italian", "flag": "lib/images/Flag_of_Italy.png"},
      {"name": "Italian", "flag": "lib/images/Flag_of_Italy.png"},
      {"name": "Italian", "flag": "lib/images/Flag_of_Italy.png"},
      {"name": "Italian", "flag": "lib/images/Flag_of_Italy.png"},
      {"name": "Italian", "flag": "lib/images/Flag_of_Italy.png"},
      {"name": "Italian", "flag": "lib/images/Flag_of_Italy.png"},
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text("Pick A Cuisine"),
        backgroundColor: creamsicle,
      ),
      backgroundColor: creamsicle[300],
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: cuisines.length,
                itemBuilder: (context, index) {
                  final cuisine = cuisines[index];
                  return CuisineCard(
                    cuisineName: cuisine["name"]!,
                    flagImage: cuisine["flag"]!,
                    onTap: () {
                      // Handle the card tap
                      print("${cuisine["name"]} tapped!");
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
