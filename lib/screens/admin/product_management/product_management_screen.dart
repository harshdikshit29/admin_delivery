import 'package:admin_delivery/screens/admin/customer_screens/add_customer_screen.dart';
import 'package:admin_delivery/screens/admin/product_management/add_product_screen.dart';
import 'package:admin_delivery/screens/admin/product_management/product_description.dart';
import 'package:admin_delivery/widgets/custom_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class ProductManagement extends StatefulWidget {
  final String productDetails;
  final String brand;
  final String modelNumber;
  final String productName;
  final String quantity;
  final String selectedCategory;
  const ProductManagement({
    super.key,
    required this.productDetails,
    required this.brand,
    required this.modelNumber,
    required this.productName,
    required this.quantity,
    required this.selectedCategory,
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
      body: widget.productName == ''
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Empty Data"),
                  SizedBox(
                    height: h * .02,
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
            )
          : Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: w * .05, vertical: h * .02),
              child: Column(
                children: [
                  Container(
                    width: w * 1,
                    child: Card(
                      elevation: 1,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: w * .05, vertical: h * .02),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Image.network(
                                  'https://images.pexels.com/photos/1006293/pexels-photo-1006293.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
                                  height: h * .08,
                                ),
                                SizedBox(
                                  width: w * .02,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                        'Category: ${widget.selectedCategory}'),
                                    Text('Product Name: ${widget.productName}'),
                                    Text('Brand: ${widget.brand}'),
                                    Text('Quantity: ${widget.quantity}'),
                                    Text('Model Number: ${widget.modelNumber}'),
                                    Text(
                                        'Product Details: ${widget.productDetails}'),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(
                              height: h * .02,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                GestureDetector(
                                    onTap: () {
                                      Get.to(ProductDescription());
                                    },
                                    child: CustomButton(
                                      buttonText: 'View Product',
                                      width: w * .35,
                                      height: h * .04,
                                    )),
                                GestureDetector(
                                    onTap: () {},
                                    child: CustomButton(
                                      buttonText: 'Update Product',
                                      width: w * .35,
                                      height: h * .04,
                                    ))
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: h * .01,
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
