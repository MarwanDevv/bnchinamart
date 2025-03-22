// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../utils/colors.dart';

AppBar customAppBar() {
  return AppBar(
    backgroundColor: lightGreyColor,
    surfaceTintColor: lightGreyColor,
    title: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Your Location",
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 12,
            color: textColor,
          ),
        ),
        Row(
          children: [
            Text(
              "Hawler",
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 20,
                color: textColor,
                fontWeight: FontWeight.w900,
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            const FaIcon(
              FontAwesomeIcons.angleDown,
              size: 16,
            ),
          ],
        ),
      ],
    ),
  );
}
