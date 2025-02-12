
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:google_fonts/google_fonts.dart';

import '../common/app_colors.dart';

class CustomRichText extends StatelessWidget{

  CustomRichText({
    required this.customText1,
    required this.customText2,
    required this.customColor,
   required this.customFontSize,
     this.onTap,
    Key?key,
  }):super(key:key);
  final String customText1;
    final String customText2;
    final Color? customColor;
    final double customFontSize;
 final TapGestureRecognizer? onTap;


  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: customText1,
        style:  GoogleFonts.inter(
          color: whiteColor,
          fontWeight: FontWeight.w400
        ),
        children: <TextSpan>[
          TextSpan(
            text: customText2,
            recognizer: onTap,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: customColor,
              decoration: TextDecoration.underline,
              fontSize: customFontSize
            )
          ),
        ]
      ),
    );
  }

}