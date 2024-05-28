import 'package:admin_delivery/App-constant/color.dart';
import 'package:admin_delivery/App-constant/images.dart';
import 'package:admin_delivery/App-constant/string.dart';
import 'package:admin_delivery/screens/initialScreens/onboarding_screen.dart';
import 'package:admin_delivery/widgets/custom_button.dart';
import 'package:admin_delivery/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: h * .1, left: w * .1, right: w * .1),
          child: Column(
            children: [
              Image.asset(
                AppImages.otp,
              ),
              SizedBox(
                height: h * .05,
              ),
              CustomText(
                text: AppString.otpheading,
                fontSize: 30,
                textColor: AppColors.textColorLight,
              ),
              CustomText(
                text: AppString.otpsubheading,
                fontSize: 18,
                textColor: AppColors.textColorLight,
              ),
              SizedBox(
                height: h * .05,
              ),
              OTPTextField(
                length: 6,
                width: MediaQuery.of(context).size.width,
                //fieldWidth: 80,
                style: TextStyle(
                  fontSize: 17,
                  color: AppColors.linearBlack,
                ),
                textFieldAlignment: MainAxisAlignment.spaceAround,
                fieldStyle: FieldStyle.underline,

                onCompleted: (pin) {
                  debugPrint("Completed: $pin");
                },
              ),
              SizedBox(
                height: h * .05,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomText(
                    text: "Didn't recieve the OTP?",
                    fontSize: 14,
                    textColor: AppColors.linearBlack,
                    fontWeight: FontWeight.bold,
                  ),
                  TextButton(
                    onPressed: () {},
                    child: CustomText(
                      text: 'Resend OTP',
                      fontSize: 14,
                      textColor: AppColors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
              Center(
                child: GestureDetector(
                  onTap: () {
                    Get.off(const OnBoardingScreen());
                  },
                  child: CustomButton(
                    height: h * .05,
                    buttonText: 'Verify',
                    buttonTextSize: 20,
                    buttonFontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
