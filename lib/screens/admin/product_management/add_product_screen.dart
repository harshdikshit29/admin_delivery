import 'package:admin_delivery/App-constant/color.dart';
import 'package:admin_delivery/screens/admin/product_management/product_management_screen.dart';
import 'package:admin_delivery/widgets/custom_button.dart';
import 'package:admin_delivery/widgets/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class ProductAdd extends StatefulWidget {
  const ProductAdd({super.key});

  @override
  State<ProductAdd> createState() => _ProductAddState();
}

class _ProductAddState extends State<ProductAdd> {
  String selectedCategory = 'Select Type';
  TextEditingController productNameController = TextEditingController();
  TextEditingController brandController = TextEditingController();
  TextEditingController modelNumberController = TextEditingController();
  TextEditingController productDetailsController = TextEditingController();

  TextEditingController quantityController = TextEditingController();
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
                child: DropdownButton<String>(
                  value: selectedCategory,
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedCategory = newValue!;
                    });
                  },
                  items: <String>[
                    'Select Type',
                    'AC',
                    'Oven',
                    'Refrigerator',
                    'Speaker'
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
              SizedBox(
                height: h * .05,
              ),
              TextField(
                controller: productNameController,
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
                controller: brandController,
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
                controller: modelNumberController,
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
                controller: productDetailsController,
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
                controller: quantityController,
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
                child: GestureDetector(
                  onTap: () {
                    if (productDetails == '' ||
                        brand == '' ||
                        modelNumber == '' ||
                        productName == '' ||
                        quantity == '' ||
                        selectedCategory == 'Select Type') {
                      Get.snackbar('Error', 'Enter Data to Continue',
                          duration: Duration(seconds: 3));
                    } else {
                      Get.off(ProductManagement(
                        productDetails: productDetails,
                        brand: brand,
                        modelNumber: modelNumber,
                        productName: productName,
                        quantity: quantity,
                        selectedCategory: selectedCategory,
                      ));
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
