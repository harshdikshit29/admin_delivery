import 'package:admin_delivery/App-constant/color.dart';
import 'package:admin_delivery/screens/admin/customer_screens/add_customer_controller.dart';
import 'package:admin_delivery/screens/admin/customer_screens/customer_manage_screen.dart';
import 'package:admin_delivery/widgets/custom_button.dart';
import 'package:admin_delivery/widgets/custom_text.dart';
import 'package:flutter/material.dart';
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
                              // onChanged: (value) {
                              //   setState(() {
                              //     firstname = value;
                              //   });
                              // },
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
                              // onChanged: (value) {
                              //   setState(() {
                              //     lastname = value;
                              //   });
                              // },
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
                              // onChanged: (value) {
                              //   setState(() {
                              //     phonenumber = value;
                              //   });
                              // },
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
                              // onChanged: (value) {
                              //   setState(() {
                              //     Email = value;
                              //   });
                              // },
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
                              // onChanged: (value) {
                              //   setState(() {
                              //     Address = value;
                              //   });
                              // },
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
                              // onChanged: (value) {
                              //   setState(() {
                              //     City = value;
                              //   });
                              // },
                            ),
                            SizedBox(height: h * .03),
                            TextFormField(
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  prefixIcon: Icon(Icons.person, size: 30),
                                  labelText: "Interested In",
                                  hintText: 'Enter Product details'),
                              controller:
                                  addCustomerController.interestController,
                              keyboardType: TextInputType.text,
                              // onChanged: (value) {
                              //   setState(() {
                              //     Interest = value;
                              //   });
                              // },
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
                              // onChanged: (value) {
                              //   setState(() {
                              //     Remark = value;
                              //   });
                              // },
                            ),
                            SizedBox(height: h * .03),
                            TextFormField(
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  prefixIcon: Icon(Icons.person, size: 30),
                                  labelText: "Budget",
                                  hintText: 'Enter customer Budget'),
                              controller:
                                  addCustomerController.budgetController,
                              keyboardType: TextInputType.number,
                              // onChanged: (value) {
                              //   setState(() {
                              //     Interest = value;
                              //   });
                              // },
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
                                        if (addCustomerController
                                                    .firstNameController ==
                                                '' ||
                                            addCustomerController
                                                    .lastNameController ==
                                                '' ||
                                            addCustomerController
                                                    .phoneNumberController ==
                                                '' ||
                                            addCustomerController.emailController ==
                                                '' ||
                                            addCustomerController.addressController ==
                                                '' ||
                                            addCustomerController.remarkController ==
                                                '' ||
                                            addCustomerController
                                                    .budgetController ==
                                                '' ||
                                            addCustomerController
                                                    .cityController ==
                                                '' ||
                                            addCustomerController
                                                    .interestController ==
                                                '') {
                                          Get.snackbar(
                                              'Error', 'Enter Data to Continue',
                                              duration: Duration(seconds: 3));
                                        } else {
                                          addCustomerController
                                              .addCustomerData();
                                          // Get.off(
                                          //   CustomerManagementScreen(
                                          //     firstName: firstname,
                                          //     lastName: lastname,
                                          //     phoneNumber: phonenumber,
                                          //     email: Email,
                                          //     address: Address));
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
