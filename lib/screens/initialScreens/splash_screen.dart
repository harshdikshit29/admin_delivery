import 'package:admin_delivery/screens/initialScreens/initial_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;

    Future<void> navigateToLogin() async {
      await Future.delayed(const Duration(seconds: 3));
      Get.off(InitialScreen());
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
        ],
      ),
    );
  }
}
