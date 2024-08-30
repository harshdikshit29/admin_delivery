import 'package:admin_delivery/App-constant/color.dart';
import 'package:admin_delivery/App-constant/images.dart';
import 'package:admin_delivery/App-constant/string.dart';
import 'package:admin_delivery/widgets/custom_button.dart';
import 'package:admin_delivery/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../otp_screen.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: w * 0.1, right: w * 0.1, top: h * .1),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Image.asset(
              AppImages.forgetpassword,
              height: h * .4,
            ),
            CustomText(
              text: AppString.forgotpassword,
              fontSize: 30,
              textColor: AppColors.textColorLight,
            ),
            CustomText(
              text: AppString.subforgotpassword,
              fontSize: 16,
              textColor: AppColors.textColorLight,
            ),
            SizedBox(
              height: h * .05,
            ),
            CustomText(
              text: AppString.forgotemail,
              fontSize: 14,
              textColor: AppColors.linearBlack,
              fontWeight: FontWeight.w500,
            ),
            TextField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                  hintText: '1234567890',
                  hintStyle: TextStyle(
                    color: AppColors.grey,
                  )),
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
                  buttonText: 'Verify',
                  buttonTextSize: 20,
                  buttonFontWeight: FontWeight.bold,
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
