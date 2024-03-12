import 'package:bitebybyte_mobile/components/title.dart';
import 'package:bitebybyte_mobile/theme/colors.dart';
import 'package:flutter/material.dart';

class FullTitle extends StatelessWidget {
  double fs;
  FullTitle({super.key, required this.fs});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Column(children: [
        Padding(
            padding: const EdgeInsets.only(right: 60.0),
            child: MyTitle(text: "Bite", color: blue, size: fs)),
        Padding(
          padding: const EdgeInsets.only(right: 80.0),
          child: MyTitle(text: "By", color: Colors.black, size: fs),
        ),
        MyTitle(
            text: "Byte",
            color: const Color.fromARGB(255, 93, 37, 17),
            size: fs),
      ]),
    );
  }
}
