import 'package:flutter/material.dart';

void displayError(String error, context) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text("Error")]),
      content: Text(
        error,
        style: const TextStyle(fontSize: 14),
      ),
      actions: [
        TextButton(
            onPressed: () => {Navigator.pop(context)},
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("OK"),
              ],
            ))
      ],
    ),
  );
}
