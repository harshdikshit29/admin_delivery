import 'dart:convert';

import 'package:admin_delivery/screens/admin/home/admin_home_screen.dart';
import 'package:admin_delivery/screens/delivery/home/delivery_home_screen.dart';
import 'package:admin_delivery/screens/initialScreens/initial_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  @override
  void onInit() {
    userNameController.clear();
    passwordController.clear();

    super.onInit();
  }

  TextEditingController passwordController = TextEditingController();
  TextEditingController userNameController = TextEditingController();

  var isLoading = false.obs;

  Future<void> loginWithEmailAdmin() async {
    try {
      print(userNameController.text.trim());
      print(passwordController.text);
      isLoading.value = true;
      // var headers = {'Content-Type': 'application/json'};
      // var url = Uri.parse(
      //     ApiEndPoints.baseUrl + ApiEndPoints.authEndpoints.loginEmail);

      // Map body = {
      //   "email": userNameController.text.trim(),
      //   "password": passwordController.text,

      //   //'confirmpassword': passwordController.text,
      // };
      // print(body);
      // http.Response response =
      //     await http.post(url, body: jsonEncode(body), headers: headers);
      // print(response.statusCode);

      // if (response.statusCode == 200) {
      //   isLoading.value = false;
      //   print('trueeeee===>>>');
      //   final json = jsonDecode(response.body);
      //   print(response.statusCode);

      //   userNameController.clear();
      //   passwordController.clear();
      //   Get.snackbar('Success', 'Logged In successfully');

      //   //String userId = json["data"];
      //   final data1 = json["data"];
      //   String userId = data1["_id"];}
      if (userNameController.text == 'friends@admin.com' &&
          passwordController.text == 'imadmin#%43') {
        String userId = "1";
        storeUserId(userId);
        storeLoginState(true);
        Get.offAll(AdminHomeScreen());
      } else {
        isLoading.value = false;
        print('Hiii');
        //throw jsonDecode(response.body)['message'] ?? 'Unknown Error Occured';
      }
    } catch (e) {
      isLoading.value = false;
      showDialog(
          context: Get.context!,
          builder: (context) {
            return SimpleDialog(
              title: Text('Error'),
              contentPadding: EdgeInsets.all(20),
              children: [Text(e.toString())],
            );
          });
    }
  }

  Future<void> loginWithEmailDelivery() async {
    try {
      print(userNameController.text.trim());
      print(passwordController.text);
      isLoading.value = true;
      // var headers = {'Content-Type': 'application/json'};
      // var url = Uri.parse(
      //     ApiEndPoints.baseUrl + ApiEndPoints.authEndpoints.loginEmail);

      // Map body = {
      //   "email": userNameController.text.trim(),
      //   "password": passwordController.text,

      //   //'confirmpassword': passwordController.text,
      // };
      // print(body);
      // http.Response response =
      //     await http.post(url, body: jsonEncode(body), headers: headers);
      // print(response.statusCode);

      // if (response.statusCode == 200) {
      //   isLoading.value = false;
      //   print('trueeeee===>>>');
      //   final json = jsonDecode(response.body);
      //   print(response.statusCode);

      //   userNameController.clear();
      //   passwordController.clear();
      //   Get.snackbar('Success', 'Logged In successfully');

      //   //String userId = json["data"];
      //   final data1 = json["data"];
      //   String userId = data1["_id"];}
      if (userNameController.text == 'friends@admin.com' &&
          passwordController.text == 'imadmin#%43') {
        String userId = "2";
        storeUserId(userId);
        storeLoginState(true);
        Get.offAll(DeliveryHomeScreen());
      } else {
        isLoading.value = false;
        print('Hiii');
        //throw jsonDecode(response.body)['message'] ?? 'Unknown Error Occured';
      }
    } catch (e) {
      isLoading.value = false;
      showDialog(
          context: Get.context!,
          builder: (context) {
            return SimpleDialog(
              title: Text('Error'),
              contentPadding: EdgeInsets.all(20),
              children: [Text(e.toString())],
            );
          });
    }
  }
}

void storeUserId(String userId) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setString('userId', userId);
}
