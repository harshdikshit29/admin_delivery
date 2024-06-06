import 'package:admin_delivery/api/api.dart';
import 'package:admin_delivery/screens/admin/customer_screens/customer_manage/customer_manage_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mysql1/mysql1.dart';

class CustomerDetailsController extends GetxController {
  @override
  void onInit() {
    super.onInit();
  }

  var isLoading = false.obs;
  var customer = Rxn<Customer>();

  Future<void> getCustomerData(int id) async {
    try {
      isLoading.value = true;
      final MySqlConnection conn = await DatabaseManager.connect();

      // Execute a SELECT query to check if a row with the phone number already exists
      Results results =
          await conn.query('SELECT * FROM customers where id = ?', [id]);

      if (results.isNotEmpty) {
        var row = results.first;
        customer.value = Customer(
          id: row['id'],
          firstName: row['first_name'] ?? '',
          lastName: row['last_name'] ?? '',
          phoneNumber: row['phone_number'] ?? '',
          email: row['email'] ?? '',
          address: row['address'] ?? '',
          city: row['city'] ?? '',
          interest: row['interest'] ?? '',
          budget: row['budget'] ?? '',
          remark: row['remark'] ?? '',
        );
      } else {
        Get.snackbar('Empty Data', 'No Data Found');
        customer.value = null;
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

// Define a Customer class to represent the structure of a customer object
class Customer {
  final int id;
  final String firstName;
  final String lastName;
  final String phoneNumber;
  final String email;
  final String address;
  final String city;
  final String interest;
  final String budget;
  final String remark;

  Customer({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
    required this.email,
    required this.address,
    required this.city,
    required this.interest,
    required this.budget,
    required this.remark,
  });
}
