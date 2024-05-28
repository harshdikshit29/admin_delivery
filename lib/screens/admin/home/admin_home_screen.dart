import 'package:admin_delivery/screens/admin/customer_screens/add_customer_screen.dart';
import 'package:admin_delivery/screens/admin/customer_screens/customer_manage_screen.dart';
import 'package:admin_delivery/screens/admin/product_management/product_management_screen.dart';
import 'package:admin_delivery/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class AdminHomeScreen extends StatelessWidget {
  const AdminHomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              Get.to(CustomerManagementScreen(
                firstName: '',
                lastName: '',
                phoneNumber: '',
                email: '',
                address: '',
              ));
            },
            child: CustomButton(
              buttonText: 'Customer Mangement',
              height: 65,
              width: 275,
            ),
          ),
          SizedBox(
            height: h * .1,
          ),
          GestureDetector(
            onTap: () {
              Get.to(ProductManagement(
                productDetails: '',
                brand: '',
                modelNumber: '',
                productName: '',
                quantity: '', selectedCategory: '',
              ));
            },
            child: CustomButton(
              buttonText: 'Product Mangement',
              height: 65,
              width: 275,
            ),
          )
        ],
      ),
    ));
  }
}
