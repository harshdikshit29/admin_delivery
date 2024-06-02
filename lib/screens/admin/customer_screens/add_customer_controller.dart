import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mysql1/mysql1.dart';

class AddCustomerController extends GetxController {
  @override
  void onInit() {
    firstNameController.clear();
    lastNameController.clear();
    phoneNumberController.clear();
    emailController.clear();
    addressController.clear();
    cityController.clear();
    interestController.clear();
    budgetController.clear();
    remarkController.clear();

    super.onInit();
  }

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController interestController = TextEditingController();
  TextEditingController budgetController = TextEditingController();
  TextEditingController remarkController = TextEditingController();

  var isLoading = false.obs;

  Future<void> addCustomerData() async {
    try {
      print(emailController.text.trim());
      isLoading.value = true;
      final ConnectionSettings settings = ConnectionSettings(
        host: 'srv1495.hstgr.io',
        port: 3306,
        user: 'u801886947_friendsdigital',
        password: 'Friends_Digital@123@',
        db: 'u801886947_friendsdigital',
      );
      // Connect to the Hostinger database
      final MySqlConnection conn = await MySqlConnection.connect(settings);

      // Execute a CREATE TABLE query to create the customer table
      await conn.query('''
CREATE TABLE IF NOT EXISTS customers (
  id INT AUTO_INCREMENT PRIMARY KEY,
  first_name VARCHAR(255) NOT NULL, last_name VARCHAR(255) NOT NULL, phone_number VARCHAR(255) NOT NULL, email VARCHAR(255) NOT NULL, address VARCHAR(255) NOT NULL, city VARCHAR(255) NOT NULL, interest VARCHAR(255) NOT NULL, budget VARCHAR(255) NOT NULL, remark VARCHAR(255) NOT NULL,
  created_at TIMESTAMP NOT NULL
)
''');

      // Execute a SELECT query to check if a row with the phone number already exists
      Results results = await conn.query(
          'SELECT * FROM customers WHERE phone_number = ?',
          [phoneNumberController.text]);

      if (results.isEmpty) {
        // If the row doesn't exist, insert a new one
        Results insertResults = await conn.query(
            'INSERT INTO customers (first_name, last_name, phone_number, email, address, city, interest, budget, remark, created_at) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, NOW())',
            [
              firstNameController.text,
              lastNameController.text,
              phoneNumberController.text,
              emailController.text.trim(),
              addressController.text,
              cityController.text,
              interestController.text,
              budgetController.text,
              remarkController.text
            ]);
      } else {
        isLoading.value = false;
        print('Hiii');
      }

      isLoading.value = false;
      await conn.close();
      firstNameController.clear();
      lastNameController.clear();
      phoneNumberController.clear();
      emailController.clear();
      addressController.clear();
      cityController.clear();
      interestController.clear();
      budgetController.clear();
      remarkController.clear();
      Get.snackbar('Success', 'Data Stored successfully');
    } catch (e) {
      isLoading.value = false;
      print(Text(e.toString()));
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



// Future<void> signInWithOTP(BuildContext context, String enteredOtp,
//     String sentOtp, String number) async {
//   // Check if the entered OTP matches the one that was sent
//   if (enteredOtp == sentOtp) {
//     // Create a ConnectionSettings object with the connection details for your Hostinger database
//     final ConnectionSettings settings = ConnectionSettings(
//       host: 'srv665.hstgr.io',
//       port: 3306,
//       user: 'u332079037_iwashhubonline', //u332079037_iwashhubonline
//       password: 'Iwashhub@123', //'Iwashhub@123
//       db: 'u332079037_iwashhubapp',
//     );

//     // Connect to the Hostinger database
//     final MySqlConnection conn = await MySqlConnection.connect(settings);

//     // Execute a CREATE TABLE query to create the users table
//     await conn.query('''
// CREATE TABLE IF NOT EXISTS users (
//   id INT AUTO_INCREMENT PRIMARY KEY,
//   phone_number VARCHAR(255) NOT NULL,
//   created_at TIMESTAMP NOT NULL
// )
// ''');

//     // Execute a SELECT query to check if a row with the phone number already exists
//     Results results = await conn
//         .query('SELECT * FROM users WHERE phone_number = ?', [number]);

//     int userId;
//     if (results.isEmpty) {
//       // If the row doesn't exist, insert a new one
//       Results insertResults = await conn.query(
//           'INSERT INTO users (phone_number, created_at) VALUES (?, NOW())',
//           [number]);
//       userId = insertResults.insertId!;
//     } else {
//       // If the row already exists, get the user ID
//       userId = results.first['id'];
//     }

//     // Close the database connection
//     storeUserId(userId);
//     await conn.close();

//     storeLoginState(true);
//     Navigator.pushReplacementNamed(context, AddScreen.id);
//   } else {
//     ScaffoldMessenger.of(context).showSnackBar(
//       const SnackBar(
//         content: Text('The entered OTP is incorrect. Please try again.'),
//       ),
//     );
//   }
// }
