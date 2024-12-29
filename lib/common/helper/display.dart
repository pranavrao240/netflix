import 'package:flutter/material.dart';

class DisplayMessage {
  static void errorMessage(String msg, BuildContext context) {
    var snackbar =
        SnackBar(content: Text(msg), behavior: SnackBarBehavior.floating);
    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }
}
