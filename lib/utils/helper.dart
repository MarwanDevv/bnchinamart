import 'package:flutter/material.dart';
import 'colors.dart';

void errorsnackbar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).removeCurrentMaterialBanner();
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: errorColor,
      content: Text(
        message,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: whiteColor,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  );
  return;
}

void addSnackbar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).removeCurrentSnackBar();

  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: primaryColor,
      content: Text(
        message,
        style: TextStyle(
          color: whiteColor,
          fontWeight: FontWeight.bold,
        ),
        textAlign: TextAlign.center,
      ),
    ),
  );
}
