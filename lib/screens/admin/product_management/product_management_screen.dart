import 'package:admin_delivery/screens/admin/customer_screens/add_customer_screen.dart';
import 'package:admin_delivery/screens/admin/product_management/add_product_screen.dart';
import 'package:admin_delivery/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class ProductManagement extends StatefulWidget {
  const ProductManagement({
    super.key,
  });

  @override
  State<ProductManagement> createState() => _ProductManagementState();
}

class _ProductManagementState extends State<ProductManagement> {
  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Management'),
      ),
      body:
          //widget.phoneNumber == ''
          //     ? Center(
          //         child: Column(
          //           mainAxisAlignment: MainAxisAlignment.center,
          //           children: [
          //             Text("Empty Data"),
          //             GestureDetector(
          //               onTap: () {
          //                 Get.to(CustomerAdd());
          //               },
          //               child: CustomButton(
          //                 height: h * .05,
          //                 width: w * .4,
          //                 buttonText: 'Add Customer',
          //               ),
          //             )
          //           ],
          //         ),
          //       )
          // :
          Padding(
        padding: EdgeInsets.symmetric(horizontal: w * .05, vertical: h * .02),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: h * .15,
              color: Colors.red,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: w * .05, vertical: h * .02),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('First Name:'),
                    // Text('Last Name: ${widget.lastName}'),
                    // Text('Phone Number: ${widget.phoneNumber}'),
                    // Text('Email: ${widget.email}'),
                    // Text('Address: ${widget.address}'),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Get.to(ProductAdd());
              },
              child: CustomButton(
                height: h * .05,
                width: w * .4,
                buttonText: 'Add Product',
              ),
            )
          ],
        ),
      ),
    );
  }
}
