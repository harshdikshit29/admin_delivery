import 'package:admin_delivery/App-constant/color.dart';
import 'package:flutter/material.dart';
import 'custom_text.dart';

class CustomButton extends StatelessWidget {
  final String? buttonText;
  final Color? buttonTextColor;
  final Color? btnColor;
  final double? height;
  final double? width;
  final double? buttonTextSize;
  final String? buttonFontFamily;
  final FontWeight? buttonFontWeight;

  const CustomButton(
      {super.key,
      this.buttonText,
      this.height,
      this.width,
      this.btnColor,
      this.buttonTextSize,
      this.buttonTextColor,
      this.buttonFontFamily,
      this.buttonFontWeight});

  @override
  Widget build(BuildContext context) {
 
    Color buttonColor = btnColor ??
         AppColors.buttonlight;
    Color borderColor =  AppColors.buttonborderlight;
    return Container(
      alignment: AlignmentDirectional.center,
      height: height ?? 60,
      width: width ?? 300,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: borderColor,
        ),
        color: buttonColor,
      ),
      child: CustomText(
        text: buttonText ?? '',
        fontSize: buttonTextSize ?? 19.11,
        textColor: buttonTextColor ??
AppColors.textColorLight,
        fontFamily: buttonFontFamily,
        fontWeight: buttonFontWeight,
      ),
    );
  }
}
