import 'package:admin_delivery/api/api.dart';
import 'package:admin_delivery/screens/admin/customer_screens/customer_manage/customer_manage_screen.dart';
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
  TextEditingController budgetController = TextEditingController();
  TextEditingController remarkController = TextEditingController();
  String selectedCategory = 'Select Type';

  var isLoading = false.obs;

  Future<void> addCustomerData() async {
    try {
      isLoading.value = true;
      final MySqlConnection conn = await DatabaseManager.connect();
      // Connect to the Hostinger database

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
              selectedCategory,
              budgetController.text,
              remarkController.text
            ]);
        isLoading.value = false;
        await conn.close();
        print(insertResults);
        firstNameController.clear();
        lastNameController.clear();
        phoneNumberController.clear();
        emailController.clear();
        addressController.clear();
        cityController.clear();
        budgetController.clear();
        remarkController.clear();
        Get.snackbar('Success', 'Data Stored successfully');
        Get.off(CustomerManagementScreen());
      } else {
        isLoading.value = false;
        print('Hiii');
      }
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
