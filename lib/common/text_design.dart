import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

class commonDesigns {
  static TextStyle headingText = GoogleFonts.ubuntu(
      textStyle: TextStyle(
          color: primaryColor,
          fontSize: 18,
          fontWeight: FontWeight.w500));

  static TextStyle headingText2 = GoogleFonts.ubuntu(
      textStyle: TextStyle(
          color: whiteColor,
          fontSize: 18,
          fontWeight: FontWeight.bold));

  static TextStyle statusText = GoogleFonts.ubuntu(
      textStyle: TextStyle(
          color: whiteColor,
          fontSize: 14,
          fontWeight: FontWeight.bold));


  static TextStyle buttonText = GoogleFonts.ubuntu(
      textStyle: TextStyle(
          color: whiteColor,
          fontSize: 18,
          letterSpacing: 0.1,
          fontWeight: FontWeight.w700));

  static TextStyle buttonText2 = GoogleFonts.ubuntu(
      textStyle: TextStyle(
          color: whiteColor,
          fontSize: 12,
          fontWeight: FontWeight.w700));

  static TextStyle buttonText3 = GoogleFonts.ubuntu(
      textStyle: TextStyle(
          color: black,
          fontSize: 12,
          fontWeight: FontWeight.w700));

  static TextStyle subHeaddingText = GoogleFonts.inter(
      textStyle: TextStyle(
        color: primaryColor,
          fontSize: 14,
          fontWeight: FontWeight.w600));

  static TextStyle redText = GoogleFonts.inter(
      textStyle: TextStyle(
          color: redColor,
          fontSize: 18,
          fontWeight: FontWeight.w600));

  static TextStyle greenText = GoogleFonts.inter(
      textStyle: TextStyle(
          color: amountColor,
          fontSize: 18,
          fontWeight: FontWeight.w600));

  static TextStyle subHeaddingText90 = GoogleFonts.inter(
      textStyle: TextStyle(
          color: primaryColor,
          fontSize: 18,
          letterSpacing: 1,
          fontWeight: FontWeight.bold));

  static TextStyle subHeaddingText91 = GoogleFonts.inter(
      textStyle: TextStyle(
          color: primaryColor,
          fontSize: 12,
          letterSpacing: 1,
          fontWeight: FontWeight.bold));

  static TextStyle subtitleText = GoogleFonts.inter(
      textStyle: TextStyle(
          color: kcVeryLightGrey,
          fontSize: 12,
          letterSpacing: 1,
          fontWeight: FontWeight.bold));
}
