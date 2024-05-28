import 'package:admin_delivery/screens/admin/product_management/product_management_screen.dart';
import 'package:admin_delivery/widgets/custom_button.dart';
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
  String selectedCategory = 'AC';
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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 129, 233, 132),
        title: Text('Product Listing'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Product Category',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              DropdownButton<String>(
                value: selectedCategory,
                onChanged: (String? newValue) {
                  setState(() {
                    selectedCategory = newValue!;
                  });
                },
                items: <String>['AC', 'Oven', 'Refrigerator', 'Speaker']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              TextField(
                controller: productNameController,
                decoration: InputDecoration(
                  labelText: 'Product Name',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.text,
                onChanged: (value) {
                  setState(() {
                    productName = value;
                  });
                },
              ),
              SizedBox(height: 16),
              TextField(
                controller: brandController,
                decoration: InputDecoration(
                  labelText: 'Product Brand',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.text,
                onChanged: (value) {
                  setState(() {
                    brand = value;
                  });
                },
              ),
              SizedBox(height: 16),
              TextField(
                controller: modelNumberController,
                decoration: InputDecoration(
                  labelText: 'Model Number',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.text,
                onChanged: (value) {
                  setState(() {
                    modelNumber = value;
                  });
                },
              ),
              SizedBox(height: 16),
              TextField(
                controller: productDetailsController,
                decoration: InputDecoration(
                  labelText: 'Product Details',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.text,
                onChanged: (value) {
                  setState(() {
                    productDetails = value;
                  });
                },
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                controller: quantityController,
                decoration: InputDecoration(
                  labelText: 'Quantity',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  setState(() {
                    quantity = value;
                  });
                },
              ),
              SizedBox(height: 24),
              Center(
                child: GestureDetector(
                  onTap: () {
                    Get.off(ProductManagement(
                      productDetails: productDetails,
                      brand: brand,
                      modelNumber: modelNumber,
                      productName: productName,
                      quantity: quantity,
                      selectedCategory: selectedCategory,
                    ));
                  },
                  child: CustomButton(
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
