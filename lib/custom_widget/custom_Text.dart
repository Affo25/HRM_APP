import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

import '../common/app_colors.dart';

class CustomText extends StatelessWidget {
  CustomText({
    this.customText,
    this.customColor,
    this.customFontSize,
    Key? key,
  }) : super(key: key);
  final String? customText;
  final Color? customColor;
  final double? customFontSize;

  @override
  Widget build(BuildContext context) {
    return Text(
      customText!,
      style: customFontSize == 12
          ? GoogleFonts.inter(
              color: customColor,
              fontSize: customFontSize,
              fontWeight: FontWeight.w400,
              decoration: TextDecoration.none,
            )
          : customFontSize==12 || customColor==primaryColor ?
      GoogleFonts.ubuntu(
        color: customColor,
        fontSize: customFontSize,
        fontWeight: FontWeight.bold,
      ):
      GoogleFonts.ubuntu(
              color: customColor,
              fontSize: customFontSize,
              fontWeight: FontWeight.w500,
            ),
    );
  }
}
