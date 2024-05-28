import 'package:admin_delivery/screens/admin/customer_screens/add_customer_screen.dart';
import 'package:admin_delivery/screens/admin/customer_screens/customer_details.dart';
import 'package:admin_delivery/widgets/custom_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class CustomerManagementScreen extends StatefulWidget {
  final String firstName;
  final String lastName;
  final String phoneNumber;
  final String email;
  final String address;
  const CustomerManagementScreen(
      {super.key,
      required this.firstName,
      required this.lastName,
      required this.phoneNumber,
      required this.email,
      required this.address});

  @override
  State<CustomerManagementScreen> createState() =>
      _CustomerManagementScreenState();
}

class _CustomerManagementScreenState extends State<CustomerManagementScreen> {
  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text('Customer Management'),
      ),
      body: widget.phoneNumber == ''
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Empty Data"),
                  SizedBox(
                    height: h * .05,
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.to(CustomerAdd());
                    },
                    child: CustomButton(
                      height: h * .05,
                      width: w * .4,
                      buttonText: 'Add Customer',
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
                                Icon(
                                  Icons.person,
                                  size: h * .1,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                        'Customer Name: ${widget.firstName} ${widget.lastName}'),
                                    Text('Phone Number: ${widget.phoneNumber}'),
                                    Text('Email: ${widget.email}'),
                                    Text('Address: ${widget.address}'),
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
                                    onTap: () {},
                                    child: CustomButton(
                                      buttonText: 'Call',
                                      width: w * .3,
                                      height: h * .04,
                                    )),
                                GestureDetector(
                                    onTap: () {
                                      Get.to(CustomerDetails());
                                    },
                                    child: CustomButton(
                                      buttonText: 'View Profile',
                                      width: w * .4,
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
                    height: h * .05,
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.to(CustomerAdd());
                    },
                    child: CustomButton(
                      height: h * .05,
                      width: w * .4,
                      buttonText: 'Add Customer',
                    ),
                  )
                ],
              ),
            ),
    );
  }
}
