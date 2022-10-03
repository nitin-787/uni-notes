import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:overlay_support/overlay_support.dart';

class InternetSnackBar {
  static void showTopSnackBar(BuildContext context) => showSimpleNotification(
      const Text(
        "No Internet Connection !!!",
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      background: const Color.fromARGB(255, 253, 123, 123));
}
