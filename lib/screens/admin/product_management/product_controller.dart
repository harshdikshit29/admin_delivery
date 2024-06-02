import 'package:admin_delivery/screens/admin/customer_screens/customer_manage/customer_manage_screen.dart';
import 'package:admin_delivery/screens/admin/product_management/product_management_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mysql1/mysql1.dart';

class AddProductController extends GetxController {
  @override
  void onInit() {
    productNameController.clear();
    brandController.clear();
    modelNumberController.clear();
    productDetailsController.clear();
    quantityController.clear();

    super.onInit();
  }

  String selectedCategory = 'Select Type';
  TextEditingController productNameController = TextEditingController();
  TextEditingController brandController = TextEditingController();
  TextEditingController modelNumberController = TextEditingController();
  TextEditingController productDetailsController = TextEditingController();
  TextEditingController quantityController = TextEditingController();

  var isLoading = false.obs;

  Future<void> addProductData() async {
    try {
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
CREATE TABLE IF NOT EXISTS products (
  id INT AUTO_INCREMENT PRIMARY KEY,
  product_name VARCHAR(255) NOT NULL, brand VARCHAR(255) NOT NULL, model_number VARCHAR(255) NOT NULL, product_details VARCHAR(255) NOT NULL, quantity VARCHAR(255) NOT NULL,
  created_at TIMESTAMP NOT NULL
)
''');

      // Execute a SELECT query to check if a row with the phone number already exists
      Results results = await conn.query(
          'SELECT * FROM products WHERE phone_number = ?',
          [modelNumberController.text]);

      if (results.isEmpty) {
        // If the row doesn't exist, insert a new one
        Results insertResults = await conn.query(
            'INSERT INTO products (product_name, brand, model_number, product_details, quantity, created_at) VALUES (?, ?, ?, ?, ?, NOW())',
            [
              productNameController.text,
              brandController.text,
              modelNumberController.text,
    productDetailsController.text,
    quantityController.text,
              selectedCategory,
            ]);
        isLoading.value = false;
        await conn.close();
        print(insertResults);
        productNameController.clear();
    brandController.clear();
    modelNumberController.clear();
    productDetailsController.clear();
    quantityController.clear();
        Get.snackbar('Success', 'Data Stored successfully');
        Get.off(ProductManagement());
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
