import 'package:admin_delivery/App-constant/color.dart';
import 'package:admin_delivery/App-constant/images.dart';
import 'package:admin_delivery/App-constant/string.dart';
import 'package:admin_delivery/screens/login/login_screen.dart';
import 'package:admin_delivery/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/custom_button.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            AppImages.login,
            height: h,
            width: w,
            fit: BoxFit.cover,
          ),
          Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    Get.to(const LoginScreen(id: 1));
                  },
                  child: CustomButton(
                    height: h * .05,
                    buttonText: AppString.buttonAdmin,
                    buttonTextSize: 18,
                  ),
                ),
                SizedBox(
                  height: h * .01,
                ),
                CustomText(
                  text: AppString.or,
                  fontSize: 16,
                  textColor: AppColors.linearBlack,
                  fontWeight: FontWeight.bold,
                ),
                SizedBox(
                  height: h * .01,
                ),
                GestureDetector(
                  onTap: () {
                    Get.to(const LoginScreen(id: 2));
                  },
                  child: CustomButton(
                    btnColor: AppColors.white,
                    height: h * .05,
                    buttonText: AppString.buttonDelivery,
                    buttonTextSize: 18,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
