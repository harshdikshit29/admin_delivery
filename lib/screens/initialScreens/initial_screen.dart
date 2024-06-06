// ignore_for_file: use_build_context_synchronously

import 'package:admin_delivery/screens/admin/home/admin_home_screen.dart';
import 'package:admin_delivery/screens/initialScreens/onboarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Example function for storing the login state
void storeLoginState(bool isLoggedIn) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setBool('isLoggedIn', isLoggedIn);
}

// Example function for retrieving the login state
Future<bool> fetchLoginState() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getBool('isLoggedIn') ?? false;
}

// Example widget that checks the user's login state and navigates to the appropriate screen
class InitialScreen extends StatefulWidget {
  const InitialScreen({super.key});

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  @override
  void initState() {
    super.initState();
    checkLoginState();
  }

  void checkLoginState() async {
    final isLoggedIn = await fetchLoginState();
    if (isLoggedIn) {
      Get.off(AdminHomeScreen());
    } else {
      Get.off(OnBoardingScreen());
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Center(child: CircularProgressIndicator());
  }
}
