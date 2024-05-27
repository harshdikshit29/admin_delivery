import 'package:admin_delivery/App-constant/string.dart';
import 'package:admin_delivery/screens/initialScreens/onboarding_screen.dart';
import 'package:admin_delivery/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../App-constant/color.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;

    Future<void> navigateToLogin() async {
      await Future.delayed(const Duration(seconds: 3));
      Get.off(const OnBoardingScreen());
    }

    navigateToLogin();

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        //mainAxisSize: MainAxisSize.min,
        children: [
          Center(
            child: Image.asset(
              'assets/images/logo.jpg',
              width: w * .4,
              height: h * .2,
            ),
          ),
          // Align(
          //     alignment: Alignment.bottomCenter,
          //     child: CustomText(
          //       text: AppString.appName,
          //       fontSize: 25,
          //       textColor: AppColors.linearBlack,
          //       fontWeight: FontWeight.bold,
          //     ))
        ],
      ),
    );
  }
}
