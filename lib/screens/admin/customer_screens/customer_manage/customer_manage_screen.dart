import 'package:admin_delivery/screens/admin/customer_screens/add_customer/add_customer_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:get/get.dart';

import '../../../../App-constant/color.dart';
import '../../../../widgets/custom_button.dart';
import '../../../../widgets/custom_text.dart';
import '../customer_profile/customer_details.dart';
import 'customer_management_controller.dart';

class CustomerManagementScreen extends StatefulWidget {
  @override
  State<CustomerManagementScreen> createState() =>
      _CustomerManagementScreenState();
}

class _CustomerManagementScreenState extends State<CustomerManagementScreen> {
  late CustomerManagementController customerManagementController;
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();

  @override
  void initState() {
    super.initState();
    customerManagementController = Get.put(CustomerManagementController());
    customerManagementController.getAllCustomerData();
  }

  Future<void> _refresh() async {
    await customerManagementController.getAllCustomerData();
  }

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text('Customer Management'),
        actions: [IconButton(onPressed: _refresh, icon: Icon(Icons.refresh))],
      ),
      body: Obx(() {
        if (customerManagementController.isLoading.value) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (customerManagementController.customers.isEmpty) {
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
                    Get.to(CustomerAdd());
                  },
                  child: CustomButton(
                    height: h * .05,
                    width: w * .4,
                    buttonText: 'Add Customer',
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
                    itemCount: customerManagementController.customers.length,
                    itemBuilder: (context, index) {
                      var customer =
                          customerManagementController.customers[index];
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
                                            'Customer Name: ${customer.firstName} ${customer.lastName}'),
                                        Text(
                                            'Phone Number: ${customer.phoneNumber}'),
                                        Text('Email: ${customer.email}'),
                                        Text('Address: ${customer.address}'),
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
                                      onTap: () async {
                                        try {
                                          bool? res =
                                              await FlutterPhoneDirectCaller
                                                  .callNumber(
                                                      customer.phoneNumber);
                                          print('Call made: $res');
                                        } catch (e) {
                                          print('Error: $e');
                                        }
                                      },
                                      child: CustomButton(
                                        buttonText: 'Call Customer',
                                        width: w * .35,
                                        height: h * .04,
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        Get.to(
                                            CustomerDetails(id: customer.id));
                                      },
                                      child: CustomButton(
                                        buttonText: 'View More',
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
                    Get.to(CustomerAdd());
                  },
                  child: CustomButton(
                    height: h * .05,
                    width: w * .4,
                    buttonText: 'Add Customer',
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
