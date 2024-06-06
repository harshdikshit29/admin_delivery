import 'package:admin_delivery/api/api.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mysql1/mysql1.dart';

class ProductDetailsController extends GetxController {
  @override
  void onInit() {
    super.onInit();
  }

  var isLoading = false.obs;
  var product = Rxn<Product>();

  Future<void> getProductData(int id) async {
    try {
      isLoading.value = true;
      final MySqlConnection conn = await DatabaseManager.connect();

      // Execute a SELECT query to check if a row with the phone number already exists
      Results results =
          await conn.query('SELECT * FROM products where id = ?', [id]);

      if (results.isNotEmpty) {
        var row = results.first;
        product.value = Product(
          id: row['id'],
          productName: row['(product_name'] ?? '',
          productBrand: row['brand'] ?? '',
          modelNumber: row['model_number'] ?? '',
          productDetails: row['product_details'] ?? '',
          quantity: row['quantity'] ?? '',
          productCategory: row['product_category'] ?? '',
        );
      } else {
        Get.snackbar('Empty Data', 'No Data Found');
        product.value = null;
      }

      isLoading.value = false;
      await conn.close();
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

// Define a product class to represent the structure of a product object
class Product {
  final int id;
  final String productName;
  final String productBrand;
  final String modelNumber;
  final String productDetails;
  final String quantity;
  final String productCategory;

  Product({
    required this.id,
    required this.productName,
    required this.productBrand,
    required this.modelNumber,
    required this.productDetails,
    required this.quantity,
    required this.productCategory,
  });
}
