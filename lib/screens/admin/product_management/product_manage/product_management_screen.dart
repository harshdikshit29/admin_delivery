import 'package:admin_delivery/App-constant/color.dart';
import 'package:admin_delivery/screens/admin/product_management/add_product/add_product_screen.dart';
import 'package:admin_delivery/screens/admin/product_management/product_details/product_description.dart';
import 'package:admin_delivery/screens/admin/product_management/product_manage/product_management_controller.dart';
import 'package:admin_delivery/widgets/custom_button.dart';
import 'package:admin_delivery/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductManagement extends StatefulWidget {
  const ProductManagement({
    super.key,
  });

  @override
  State<ProductManagement> createState() => _ProductManagementState();
}

class _ProductManagementState extends State<ProductManagement> {
  late ProductManagementController productManagementController;
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();

  @override
  void initState() {
    super.initState();
    productManagementController = Get.put(ProductManagementController());
    productManagementController.getAllProductData();
  }

  Future<void> _refresh() async {
    await productManagementController.getAllProductData();
  }

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Management'),
        actions: [IconButton(onPressed: _refresh, icon: Icon(Icons.refresh))],
      ),
      body: Obx(() {
        if (productManagementController.isLoading.value) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (productManagementController.Products.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomText(
                  text: "Empty Data",
                  fontSize: 20,
                  textColor: AppColors.linearBlack,
                  fontWeight: FontWeight.bold,
                ),
                SizedBox(height: h * .05),
                GestureDetector(
                  onTap: () {
                    Get.to(ProductAdd());
                  },
                  child: CustomButton(
                    height: h * .05,
                    width: w * .4,
                    buttonText: 'Add product',
                  ),
                ),
              ],
            ),
          );
        } else {
          return RefreshIndicator(
            key: _refreshIndicatorKey,
            onRefresh: _refresh,
            child: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    physics: BouncingScrollPhysics(),
                    itemCount: productManagementController.Products.length,
                    itemBuilder: (context, index) {
                      var product = productManagementController.Products[index];
                      return Container(
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
                                    Icon(
                                      Icons.person,
                                      size: h * .1,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                            'Product Type: ${product.productCategory}'),
                                        // Text(
                                        //     'Product Name:  ${product.productName}'),
                                        Text(
                                            'Product Brand: ${product.productBrand}'),
                                        Text(
                                            'Model Number: ${product.modelNumber}'),
                                        Text('Quantity: ${product.quantity}'),
                                      ],
                                    ),
                                  ],
                                ),
                                SizedBox(height: h * .02),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        Get.to(ProductDescription(id: product.id));
                                      },
                                      child: CustomButton(
                                        buttonText: 'View Product',
                                        width: w * .35,
                                        height: h * .04,
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        // Get.to(
                                        //     CustomerDetails(id: customer.id)
                                        //     );
                                      },
                                      child: CustomButton(
                                        buttonText: 'Update Product',
                                        width: w * .4,
                                        height: h * .04,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
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
                ),
              ],
            ),
          );
        }
      }),
    );
  }
}
