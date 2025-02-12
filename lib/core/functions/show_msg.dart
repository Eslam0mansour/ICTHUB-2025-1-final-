import 'package:flutter/material.dart';

extension ShowMsg on BuildContext {
  ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showErrorMsg(
    String text,
  ) {
    return ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        backgroundColor: Colors.red,
        content: Text(
          text,
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
