import 'package:admin_delivery/App-constant/color.dart';
import 'package:admin_delivery/screens/admin/product_management/add_product/add_product_controller.dart';
import 'package:admin_delivery/screens/admin/product_management/product_manage/product_management_screen.dart';
import 'package:admin_delivery/widgets/custom_button.dart';
import 'package:admin_delivery/widgets/custom_text.dart';
import 'package:admin_delivery/widgets/product_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_searchable_dropdown/flutter_searchable_dropdown.dart';
import 'package:get/get.dart';

class ProductAdd extends StatefulWidget {
  const ProductAdd({super.key});

  @override
  State<ProductAdd> createState() => _ProductAddState();
}

class _ProductAddState extends State<ProductAdd> {
  bool _isLoading = false;

  AddProductController addProductController = Get.put(AddProductController());
  final ProductList productList = ProductList();
  String productDetails = '';
  String brand = '';
  String modelNumber = '';
  String productName = '';

  String quantity = '';
  int currentQuantity = 0;

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          text: "Product Listing",
          fontSize: 25,
          textColor: AppColors.linearBlack,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: w * .08, vertical: h * .03),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                text: 'Product Category',
                fontSize: 18,
                fontWeight: FontWeight.bold,
                textColor: AppColors.linearBlack,
              ),
              SizedBox(
                width: double.infinity,
                child: SearchableDropdown.single(
                  items: productList.product.map((String product) {
                    return DropdownMenuItem<String>(
                      value: product,
                      child: Text(product),
                    );
                  }).toList(),
                  value: addProductController.selectedCategory,
                  hint: "Select one",
                  searchHint: "Select one",
                  onChanged: (value) {
                    setState(() {
                      addProductController.selectedCategory = value;
                    });
                  },
                  isExpanded: true,
                ),
                // DropdownButtonFormField<String>(
                //   value: addProductController.selectedCategory,
                //   onChanged: (String? newValue) {
                //     setState(() {
                //       addProductController.selectedCategory = newValue!;
                //     });
                //   },
                //   items: productList.product.map((String product) {
                //     return DropdownMenuItem<String>(
                //       value: product,
                //       child: Text(product),
                //     );
                //   }).toList(),
                //   decoration: InputDecoration(
                //     border: OutlineInputBorder(), // Optional: Add border
                //   ),
                // ),
              ),
              SizedBox(
                height: h * .05,
              ),
              TextField(
                controller: addProductController.productNameController,
                decoration: InputDecoration(
                  labelText: 'Product Name',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                keyboardType: TextInputType.text,
                onChanged: (value) {
                  setState(() {
                    productName = value;
                  });
                },
              ),
              SizedBox(
                height: h * .03,
              ),
              TextField(
                controller: addProductController.brandController,
                decoration: InputDecoration(
                  labelText: 'Product Brand',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                keyboardType: TextInputType.text,
                onChanged: (value) {
                  setState(() {
                    brand = value;
                  });
                },
              ),
              SizedBox(
                height: h * .03,
              ),
              TextField(
                controller: addProductController.modelNumberController,
                decoration: InputDecoration(
                  labelText: 'Model Number',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                keyboardType: TextInputType.text,
                onChanged: (value) {
                  setState(() {
                    modelNumber = value;
                  });
                },
              ),
              SizedBox(
                height: h * .03,
              ),
              TextField(
                controller: addProductController.productDetailsController,
                decoration: InputDecoration(
                  labelText: 'Product Details',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                keyboardType: TextInputType.text,
                onChanged: (value) {
                  setState(() {
                    productDetails = value;
                  });
                },
              ),
              SizedBox(
                height: h * .03,
              ),
              TextField(
                controller: addProductController.quantityController,
                decoration: InputDecoration(
                  labelText: 'Quantity',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  setState(() {
                    quantity = value;
                  });
                },
              ),
              SizedBox(
                height: h * .05,
              ),
              Center(
                child: addProductController.isLoading.value
                    ? Center(
                        child: CircularProgressIndicator(
                        color: Colors.blue,
                      ))
                    : GestureDetector(
                        onTap: () {
                          if (productDetails == '' ||
                              brand == '' ||
                              modelNumber == '' ||
                              productName == '' ||
                              quantity == '' ||
                              addProductController.selectedCategory ==
                                  'Select Type') {
                            Get.snackbar('Error', 'Enter Data to Continue',
                                duration: Duration(seconds: 3));
                          } else {
                            addProductController.addProductData();
                          }
                        },
                        child: CustomButton(
                          width: w * .4,
                          buttonText: 'Add',
                        ),
                      ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
