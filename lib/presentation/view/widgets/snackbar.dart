import 'package:flutter/material.dart';

void snackBar(
    {required BuildContext context,
    required String title,
    required String message}) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    behavior: SnackBarBehavior.floating,
    duration: const Duration(milliseconds: 600),
    content: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
        title,
        style: const TextStyle(
        fontSize: 20,
          ),
        ),
        Text(
          message,
          style: const TextStyle(
          fontSize: 18,
          ),
        ),
      ],
    ),
    margin: EdgeInsets.only(
        bottom: MediaQuery.of(context).size.height - 80, left: 10, right: 10),
  ));
}
