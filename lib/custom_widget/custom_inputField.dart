

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../common/app_colors.dart';

class customInputField extends StatelessWidget{

  final TextEditingController? controller;
  final String textValue;
  final TextInputAction? textInputAction;
  final TextInputType keyboardType;
   customInputField({super.key, this.controller, required this.textValue, required this.keyboardType, this.textInputAction});
  @override
  Widget build(BuildContext context) {
    return  TextField(
      enabled: true,
      cursorColor: kcVeryLightGrey,
      cursorHeight: 23,
      style: GoogleFonts.inter(
          fontSize: 12,
          fontWeight: FontWeight.w400
      ),
      textInputAction: textInputAction,
      keyboardType: keyboardType,
      controller: controller,
      textAlign: TextAlign.start,
       decoration: InputDecoration(
         hintText: textValue,
         border: InputBorder.none,
           hintStyle: GoogleFonts.ubuntu(
             fontSize: 12,
                 fontWeight: FontWeight.w600
           ),
       ),
    );
  }

  // bool isValidEmail(  controller) {
  //   // Regular expression for email validation
  //   final RegExp emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
  //
  //   return emailRegex.hasMatch( controller);
  // }

}

class InputFieldWithIcon extends StatelessWidget{

  final TextEditingController? controller;
  final String textValue;
  
  final IconData prefixIcon;

  final TextInputAction? textInputAction;
  final TextInputType keyboardType;
  const InputFieldWithIcon({super.key, this.controller, required this.textValue, required this.keyboardType, this.textInputAction, required this.prefixIcon});

  @override
  Widget build(BuildContext context) {
    return  TextField(
      enabled: true,
      cursorColor: kcVeryLightGrey,
      cursorHeight: 23,
      style: GoogleFonts.inter(
          fontSize: 12,
          fontWeight: FontWeight.w400
      ),
      textInputAction: textInputAction,
      keyboardType: keyboardType,
      controller: controller,
      textAlign: TextAlign.start,
      decoration: InputDecoration(
        hintText: textValue,
        border: InputBorder.none,
        hintStyle: GoogleFonts.ubuntu(
            fontSize: 12,
            fontWeight: FontWeight.w600
        ),
        prefixIcon: Icon(prefixIcon,color: primaryColor,),
      ),
    );
  }

}


class InputFieldWithSuffixIcon extends StatelessWidget{

  final TextEditingController? controller;
  final String textValue;

  final IconData suffixIcon;

  final TextInputAction? textInputAction;
  final TextInputType keyboardType;
  const InputFieldWithSuffixIcon({super.key, this.controller, required this.textValue, required this.keyboardType, this.textInputAction, required this.suffixIcon});

  @override
  Widget build(BuildContext context) {
    return  TextField(
      enabled: true,
      cursorColor: kcVeryLightGrey,
      cursorHeight: 23,
      style: GoogleFonts.inter(
          fontSize: 12,
          fontWeight: FontWeight.w400
      ),
      textInputAction: textInputAction,
      keyboardType: keyboardType,
      controller: controller,
      textAlign: TextAlign.start,
      decoration: InputDecoration(
        hintText: textValue,
        border: InputBorder.none,
        hintStyle: GoogleFonts.ubuntu(
            fontSize: 12,
            fontWeight: FontWeight.w600
        ),
        suffixIcon: Icon(suffixIcon,color: primaryColor,),
      ),
    );
  }

}

