import 'package:admin_delivery/App-constant/color.dart';
import 'package:admin_delivery/screens/admin/customer_screens/add_customer/add_customer_controller.dart';
import 'package:admin_delivery/widgets/custom_button.dart';
import 'package:admin_delivery/widgets/custom_text.dart';
import 'package:admin_delivery/widgets/product_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_searchable_dropdown/flutter_searchable_dropdown.dart';
import 'package:get/get.dart';

class CustomerAdd extends StatefulWidget {
  const CustomerAdd({super.key});

  @override
  State<CustomerAdd> createState() => _CustomerAddState();
}

class _CustomerAddState extends State<CustomerAdd> {
  bool _isLoading = false;

  AddCustomerController addCustomerController =
      Get.put(AddCustomerController());
  final ProductList productList = ProductList();
  String a = '';
  String b = '';
  String c = '';
  String d = '';
  String e = '';
  String f = '';
  String i = '';
  String j = '';

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Obx(() {
      return Scaffold(
        appBar: AppBar(
          title: CustomText(
            text: "Add New Customer",
            fontSize: 25,
            textColor: AppColors.linearBlack,
            fontWeight: FontWeight.bold,
          ),
        ),
        body: _isLoading
            ? Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: w * .08, vertical: h * .03),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: h * .02),
                      Form(
                        child: Column(
                          children: [
                            TextFormField(
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  prefixIcon: Icon(Icons.person, size: 30),
                                  labelText: "First Name",
                                  hintText: 'Enter first name'),
                              controller:
                                  addCustomerController.firstNameController,
                              keyboardType: TextInputType.name,
                              onChanged: (value) {
                                setState(() {
                                  a = value;
                                });
                              },
                            ),
                            SizedBox(height: h * .03),
                            TextFormField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                prefixIcon: Icon(Icons.person, size: 30),
                                labelText: "Last Name",
                                hintText: 'Enter last name',
                              ),
                              controller:
                                  addCustomerController.lastNameController,
                              keyboardType: TextInputType.name,
                              onChanged: (value) {
                                setState(() {
                                  b = value;
                                });
                              },
                            ),
                            SizedBox(height: h * .03),
                            TextFormField(
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  prefixIcon: Icon(Icons.person, size: 30),
                                  labelText: "Phone Number",
                                  hintText: 'Enter phone number'),
                              controller:
                                  addCustomerController.phoneNumberController,
                              keyboardType: TextInputType.number,
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(
                                    10), // Limit to 10 characters
                                FilteringTextInputFormatter.allow(
                                    RegExp(r'[0-9]')), // Allow only digits
                              ],
                              onChanged: (value) {
                                setState(() {
                                  c = value;
                                });
                              },
                            ),
                            SizedBox(height: h * .03),
                            TextFormField(
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  prefixIcon: Icon(Icons.person, size: 30),
                                  labelText: "Email",
                                  hintText: 'Enter email'),
                              controller: addCustomerController.emailController,
                              keyboardType: TextInputType.emailAddress,
                              onChanged: (value) {
                                setState(() {
                                  d = value;
                                });
                              },
                            ),
                            SizedBox(height: h * .03),
                            TextFormField(
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  prefixIcon: Icon(Icons.person, size: 30),
                                  labelText: "Address",
                                  hintText: 'Enter address'),
                              controller:
                                  addCustomerController.addressController,
                              keyboardType: TextInputType.streetAddress,
                              onChanged: (value) {
                                setState(() {
                                  e = value;
                                });
                              },
                            ),
                            SizedBox(
                              height: h * .03,
                            ),
                            TextFormField(
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  prefixIcon: Icon(Icons.person, size: 30),
                                  labelText: "City",
                                  hintText: ''),
                              controller: addCustomerController.cityController,
                              keyboardType: TextInputType.streetAddress,
                              onChanged: (value) {
                                setState(() {
                                  f = value;
                                });
                              },
                            ),
                            SizedBox(height: h * .03),
                            CustomText(
                                text: 'Select Product',
                                fontSize: 15,
                                textColor: AppColors.linearBlack),
                            SizedBox(
                              width: double.infinity,
                              child: SearchableDropdown.single(
                                items:
                                    productList.product.map((String product) {
                                  return DropdownMenuItem<String>(
                                    value: product,
                                    child: Text(product),
                                  );
                                }).toList(),
                                value: addCustomerController.selectedCategory,
                                hint: "Select one",
                                searchHint: "Select one",
                                onChanged: (value) {
                                  setState(() {
                                    addCustomerController.selectedCategory =
                                        value;
                                  });
                                },
                                isExpanded: true,
                              ),
                              // DropdownButtonFormField<String>(
                              //   value: addCustomerController.selectedCategory,
                              //   onChanged: (String? newValue) {
                              //     setState(() {
                              //       addCustomerController.selectedCategory =
                              //           newValue!;
                              //     });
                              //   },
                              //   items:
                              //       productList.product.map((String product) {
                              //     return DropdownMenuItem<String>(
                              //       value: product,
                              //       child: Text(product),
                              //     );
                              //   }).toList(),
                              //   decoration: InputDecoration(
                              //     border:
                              //         OutlineInputBorder(), // Optional: Add border
                              //   ),
                              // ),
                            ),
                            SizedBox(height: h * .03),
                            TextFormField(
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  prefixIcon: Icon(Icons.person, size: 30),
                                  labelText: "Remark",
                                  hintText: ''),
                              controller:
                                  addCustomerController.remarkController,
                              keyboardType: TextInputType.text,
                              onChanged: (value) {
                                setState(() {
                                  i = value;
                                });
                              },
                            ),
                            SizedBox(height: h * .03),
                            TextFormField(
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  prefixIcon: Icon(Icons.person, size: 30),
                                  labelText: "Budget",
                                  hintText:
                                      'Enter customer Budget(In thousands)'),
                              controller:
                                  addCustomerController.budgetController,
                              keyboardType: TextInputType.number,
                              onChanged: (value) {
                                setState(() {
                                  j = value;
                                });
                              },
                            ),
                            SizedBox(height: h * .05),
                            Center(
                              child: addCustomerController.isLoading.value
                                  ? Center(
                                      child: CircularProgressIndicator(
                                      color: Colors.blue,
                                    ))
                                  : GestureDetector(
                                      onTap: () {
                                        if (a == '' ||
                                            b == '' ||
                                            c == '' ||
                                            d == '' ||
                                            e == '' ||
                                            f == '' ||
                                            i == '' ||
                                            j == '' ||
                                            addCustomerController
                                                    .selectedCategory ==
                                                '') {
                                          Get.snackbar(
                                              'Error', 'Enter Data to Continue',
                                              duration: Duration(seconds: 3));
                                        } else {
                                          addCustomerController
                                              .addCustomerData();
                                        }
                                      },
                                      child: CustomButton(
                                        buttonText: 'Add Customer',
                                        width: w * .4,
                                      ),
                                    ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
      );
    });
  }
}
