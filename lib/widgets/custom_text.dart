import 'package:flutter/material.dart';


class CustomText extends StatelessWidget {
  

  const CustomText({super.key, required this.text, required this.fontSize, required this.textColor, this.fontWeight, this.textAlign, this.fontFamily, this.textDecoration, this.maxLines, this.letterSpacing});
  final String text;
  final double fontSize;
  final Color textColor;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;
  final String? fontFamily;
  final TextDecoration? textDecoration;
  final int? maxLines;
  final double? letterSpacing;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        decoration: textDecoration??TextDecoration.none,
          fontSize: fontSize,
          fontFamily:fontFamily,
          fontWeight: fontWeight,
          color: textColor,


      ),
      textAlign: textAlign,maxLines:maxLines,
    );
  }
}