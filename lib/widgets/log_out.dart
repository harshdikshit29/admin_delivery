import 'package:admin_delivery/App-constant/color.dart';
import 'package:admin_delivery/screens/initialScreens/initial_screen.dart';
import 'package:admin_delivery/screens/initialScreens/onboarding_screen.dart';
import 'package:admin_delivery/widgets/custom_button.dart';
import 'package:admin_delivery/widgets/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

logOutPopup(BuildContext context) {
  var h = MediaQuery.of(context).size.height;
  var w = MediaQuery.of(context).size.width;
  return Opacity(
    opacity: 1,
    child: Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: w * .1),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10), color: Colors.white),
          height: h * .2,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: h * .03),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomText(
                  text: 'Are you sure you want to logout ?',
                  fontSize: 16,
                  textColor: AppColors.linearBlack,
                  fontWeight: FontWeight.w600,
                  textAlign: TextAlign.center,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () {
                        storeLoginState(false);
                        Get.offAll(OnBoardingScreen());
                      },
                      child: CustomButton(
                        buttonText: 'Yes',
                        width: w * .2,
                        height: h * .05,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: CustomButton(
                        buttonText: 'No',
                        width: w * .2,
                        height: h * .05,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    ),
  );
}
