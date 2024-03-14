import 'package:flutter/material.dart';
import 'package:bitebybyte_mobile/theme/colors.dart';

class CuisineCard extends StatelessWidget {
  final String cuisineName;
  final String flagImage;
  final VoidCallback? onTap;

  const  CuisineCard({
    Key? key,
    required this.cuisineName,
    required this.flagImage,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 150,
        margin: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.black, width: 0.5),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 5,
              offset: Offset(0,3),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 100,
              height: 100,
              padding: EdgeInsets.all(2),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                image: DecorationImage(
                  image: AssetImage(flagImage),
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Container(
              width: 90,
            ),
            SizedBox(height: 8),
            Text(
              cuisineName, 
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}