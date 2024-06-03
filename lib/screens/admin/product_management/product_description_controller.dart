import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mysql1/mysql1.dart';

class ProductDescriptionController extends GetxController {
  // Static Variables
  final String imageUrl =
      'https://images.pexels.com/photos/1006293/pexels-photo-1006293.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1';
  final int initialQuantity = 50;
  final List<String> ramOptions = ['8GB', '12GB', '16GB'];
  final List<String> colorOptions = ['blue', 'yellow'];

  // Dynamic Variables
  var quantity = 50.obs;
  var selectedRam = '8GB'.obs;
  var selectedColor = 'blue'.obs;
  var isLoading = false.obs;

  // Controllers for text fields
  TextEditingController productNameController = TextEditingController();
  TextEditingController brandController = TextEditingController();
  TextEditingController modelNumberController = TextEditingController();
  TextEditingController productDetailsController = TextEditingController();
  TextEditingController quantityController = TextEditingController();

  // Selected Category
  String selectedCategory = 'Select Type';

  @override
  void onInit() {
    super.onInit();
    productNameController.clear();
    brandController.clear();
    modelNumberController.clear();
    productDetailsController.clear();
    quantityController.clear();
  }

  void selectRam(String ram) {
    selectedRam.value = ram;
  }

  void selectColor(String color) {
    selectedColor.value = color;
  }

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
      final MySqlConnection conn = await MySqlConnection.connect(settings);

      await conn.query('''
CREATE TABLE IF NOT EXISTS products (
  id INT AUTO_INCREMENT PRIMARY KEY,
  product_name VARCHAR(255) NOT NULL, 
  brand VARCHAR(255) NOT NULL, 
  model_number VARCHAR(255) NOT NULL, 
  product_details VARCHAR(255) NOT NULL, 
  quantity VARCHAR(255) NOT NULL, 
  product_category VARCHAR(255) NOT NULL,
  created_at TIMESTAMP NOT NULL
)
''');

      Results results = await conn.query(
          'SELECT * FROM products WHERE model_number = ?',
          [modelNumberController.text]);

      if (results.isEmpty) {
        Results insertResults = await conn.query(
            'INSERT INTO products (product_name, brand, model_number, product_details, quantity, product_category, created_at) VALUES (?, ?, ?, ?, ?, ?, NOW())',
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
        productNameController.clear();
        brandController.clear();
        modelNumberController.clear();
        productDetailsController.clear();
        quantityController.clear();
        Get.snackbar('Success', 'Data Stored successfully');
        //Get.off(ProductManagement());
      } else {
        isLoading.value = false;
        Get.snackbar('Error', 'Product with this model number already exists');
      }
    } catch (e) {
      isLoading.value = false;
      Get.snackbar('Error', e.toString());
    }
  }
}
