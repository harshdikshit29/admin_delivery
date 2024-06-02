import 'package:admin_delivery/screens/admin/customer_screens/customer_manage/customer_manage_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mysql1/mysql1.dart';

class CustomerManagementController extends GetxController {
  @override
  void onInit() {
    super.onInit();
  }

  var isLoading = false.obs;
  var customers = <Customer>[].obs;

  Future<void> getAllCustomerData() async {
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

      // Execute a SELECT query to check if a row with the phone number already exists
      Results results = await conn.query('SELECT * FROM customers');

      if (results.isNotEmpty) {
        customers.clear(); // Clear the existing list
        for (var row in results) {
          customers.add(Customer(
            id: row['id'],
            firstName: row['first_name'],
            lastName: row['last_name'],
            phoneNumber: row['phone_number'],
            email: row['email'],
            address: row['address'],
            city: row['city'],
            interest: row['interest'],
            budget: row['budget'],
            remark: row['remark'],
          ));
        }
        print(customers);
      } else {
        Get.snackbar('Empty Data', 'No Data Found');
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
