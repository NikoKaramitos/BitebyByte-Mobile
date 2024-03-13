import 'dart:html';

import 'package:bitebybyte_mobile/components/cuisineCard.dart';
import 'package:flutter/material.dart';

class CuisinePage extends StatelessWidget {
  const CuisinePage({super.key});

  @override
  Widget build(BuildContext context) {

    final List<Map<String, String>> cuisines = [
      {"name": "Italian", "flag": "/images/Flag_of_Italy.svg"},
    ];

    return Scaffold(
      appBar: AppBar(title: Text("Pick A Cuisine")),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
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
