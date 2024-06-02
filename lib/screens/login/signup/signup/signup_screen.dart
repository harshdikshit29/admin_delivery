import 'package:admin_delivery/App-constant/color.dart';
import 'package:admin_delivery/App-constant/images.dart';
import 'package:admin_delivery/App-constant/string.dart';
import 'package:admin_delivery/screens/initialScreens/onboarding_screen.dart';
import 'package:admin_delivery/screens/login/signup/otp_screen.dart';
import 'package:admin_delivery/widgets/custom_button.dart';
import 'package:admin_delivery/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpScreen extends StatefulWidget {
  final int id;
  const SignUpScreen({super.key, required this.id});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: w * 0.1, right: w * 0.1),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: widget.id == 1
                    ? Image.asset(
                        AppImages.loginEmail,
                        height: h * .28,
                      )
                    : Padding(
                        padding: EdgeInsets.only(top: h * .1),
                        child: Image.asset(
                          AppImages.delivery,
                          width: w * .5,
                        ),
                      ),
              ),
              CustomText(
                text: AppString.register,
                fontSize: 30,
                textColor: AppColors.linearBlack,
                fontWeight: FontWeight.bold,
              ),
              SizedBox(
                height: h * 0.02,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: CustomText(
                      text: AppString.name,
                      fontSize: 14,
                      textColor: AppColors.linearBlack,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  TextField(
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                        hintText: 'abcd',
                        hintStyle: TextStyle(
                          color: AppColors.grey,
                        )),
                  ),
                  SizedBox(
                    height: h * 0.02,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: CustomText(
                      text: AppString.username,
                      fontSize: 14,
                      textColor: AppColors.linearBlack,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  TextField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        hintText: 'abc@email.com',
                        hintStyle: TextStyle(
                          color: AppColors.grey,
                        )),
                  ),
                  SizedBox(
                    height: h * 0.02,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: CustomText(
                      text: AppString.phonenumber,
                      fontSize: 14,
                      textColor: AppColors.linearBlack,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  TextField(
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                        hintText: '1234567890',
                        hintStyle: TextStyle(
                          color: AppColors.grey,
                        )),
                  ),
                  SizedBox(
                    height: h * 0.02,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: CustomText(
                      text: AppString.password,
                      fontSize: 14,
                      textColor: AppColors.linearBlack,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                        hintText: '••••••••',
                        hintStyle: TextStyle(
                          color: AppColors.grey,
                        )),
                  ),
                  SizedBox(
                    height: h * 0.02,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: CustomText(
                      text: AppString.confirmpass,
                      fontSize: 14,
                      textColor: AppColors.linearBlack,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                        hintText: '••••••••',
                        hintStyle: TextStyle(
                          color: AppColors.grey,
                        )),
                  ),
                ],
              ),
              SizedBox(
                height: h * 0.04,
              ),
              Center(
                child: GestureDetector(
                  onTap: () {
                    Get.off(const OtpScreen());
                  },
                  child: CustomButton(
                    height: h * .05,
                    buttonText: AppString.signUp,
                    buttonTextSize: 20,
                    buttonFontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomText(
                    text: AppString.alreadyhaveaccount,
                    fontSize: 14,
                    textColor: AppColors.linearBlack,
                    fontWeight: FontWeight.bold,
                  ),
                  TextButton(
                    onPressed: () {
                      Get.to(const OnBoardingScreen());
                    },
                    child: CustomText(
                      text: AppString.signIn,
                      fontSize: 14,
                      textColor: AppColors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: h * 0.02,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
