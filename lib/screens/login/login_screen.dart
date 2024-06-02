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
import 'signup/signup/signup_screen.dart';

class LoginScreen extends StatefulWidget {
  final int id;
  const LoginScreen({super.key, required this.id});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  String em = '';
  String pass = '';
  var isLoading = false.obs;
  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Obx(() {
        return SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(left: w * 0.1, right: w * 0.1),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: widget.id == 1
                      ? Padding(
                          padding: EdgeInsets.only(top: h * .1),
                          child: Image.asset(
                            AppImages.loginEmail,
                            height: h * .28,
                          ),
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
                      controller: email,
                      keyboardType: TextInputType.emailAddress,
                      onChanged: (value) {
                        em = value;
                      },
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
                      controller: password,
                      onChanged: (value) {
                        pass = value;
                      },
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
                  child: isLoading.value
                      ? Center(
                          child: CircularProgressIndicator(
                          color: Colors.blue,
                        ))
                      : GestureDetector(
                          onTap: () {
                            if (em == '' && pass == '') {
                              Get.snackbar(
                                  'Error', 'Enter Details to Continue');
                            }
                            if (widget.id == 1 &&
                                em == 'friends@admin.com' &&
                                pass == 'imadmin#%43') {
                              Get.off(const AdminHomeScreen());
                            }
                            if (widget.id == 1 &&
                                em != 'friends@admin.com' ||
                                pass != 'imadmin#%43') {
                              Get.snackbar('Error', 'Wrong Details Entered');
                            }
                            if (widget.id == 2) {
                              Get.off(const DeliveryHomeScreen());
                            }
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
        );
      }),
    );
  }
}
