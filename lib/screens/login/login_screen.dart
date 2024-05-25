import 'package:admin_delivery/App-constant/color.dart';
import 'package:admin_delivery/App-constant/images.dart';
import 'package:admin_delivery/App-constant/string.dart';
import 'package:admin_delivery/screens/admin/home/admin_home_screen.dart';
import 'package:admin_delivery/screens/delivery/home/delivery_home_screen.dart';
import 'package:admin_delivery/widgets/custom_button.dart';
import 'package:admin_delivery/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'signup/password/forget_password.dart';
import 'signup/signup_screen.dart';

class LoginScreen extends StatefulWidget {
  final int id;
  const LoginScreen({super.key, required this.id});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
              widget.id == 1
                  ? Image.asset(
                      AppImages.light,
                      width: w * .35,
                    )
                  : Container(),
              Center(
                child: widget.id == 1
                    ? Image.asset(
                        AppImages.loginEmail,
                        height: h * .28,
                      )
                    : Padding(
                        padding: EdgeInsets.only(top: h * .2),
                        child: Image.asset(
                          AppImages.delivery,
                          width: w * .5,
                        ),
                      ),
              ),
              CustomText(
                text: AppString.login,
                fontSize: 30,
                textColor: AppColors.linearBlack,
                fontWeight: FontWeight.bold,
              ),
              CustomText(
                text: AppString.loginText_1,
                fontSize: 16,
                textColor: AppColors.linearBlack,
              ),
              SizedBox(
                height: h * 0.03,
              ),
              Column(
                children: [
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
                ],
              ),
              widget.id == 2
                  ? Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {
                          Get.to(const ForgetPasswordScreen());
                        },
                        child: CustomText(
                            text: AppString.forgetpassword,
                            fontSize: 14,
                            textColor: AppColors.blue),
                      ),
                    )
                  : Container(),
              SizedBox(
                height: h * 0.03,
              ),
              Center(
                child: GestureDetector(
                  onTap: () {
                    widget.id == 1
                        ? Get.off(const AdminHomeScreen())
                        : Get.off(const DeliveryHomeScreen());
                  },
                  child: CustomButton(
                    height: h * .05,
                    buttonText: AppString.signIn,
                    buttonTextSize: 20,
                    buttonFontWeight: FontWeight.bold,
                  ),
                ),
              ),
              widget.id == 2
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomText(
                          text: AppString.donthave,
                          fontSize: 14,
                          textColor: AppColors.linearBlack,
                          fontWeight: FontWeight.bold,
                        ),
                        TextButton(
                          onPressed: () {
                            widget.id == 1
                                ? Get.to(const SignUpScreen(id: 1))
                                : Get.to(const SignUpScreen(id: 2));
                          },
                          child: CustomText(
                            text: AppString.createone,
                            fontSize: 14,
                            textColor: AppColors.blue,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    )
                  : Container(),
            ],
          ),
        ),
      ),
    );
  }
}
