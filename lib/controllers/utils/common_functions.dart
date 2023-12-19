import 'package:eyeq/controllers/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CommonFunctions {
  static void pushScreen(BuildContext context, Widget destination) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext context) => destination,
      ),
    );
  }

  static void pushScreenAndRemoveUntil(
      BuildContext context, Widget destination) {
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (BuildContext context) => destination),
      (route) => false,
    );
  }

  static TextStyle get largeTextStyle => GoogleFonts.montserrat(
        fontWeight: FontWeight.bold,
        fontSize: 24.0,
        color: AppColors.textDarkColor,
      );

  static TextStyle get mediumTextStyle => GoogleFonts.montserrat(
        fontSize: 16.0,
        color: AppColors.textDarkColor,
      );

  static TextStyle get smallTextStyle => GoogleFonts.montserrat(
        fontSize: 14.0,
        color: AppColors.textDarkColor,
      );
}
