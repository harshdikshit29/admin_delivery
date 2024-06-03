import 'package:admin_delivery/App-constant/color.dart';
import 'package:admin_delivery/screens/admin/customer_screens/customer_profile/customer_details_controller.dart';
import 'package:admin_delivery/widgets/custom_button.dart';
import 'package:admin_delivery/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class CustomerDetails extends StatefulWidget {
  final int id;
  CustomerDetails({
    super.key,
    required this.id,
  });

  @override
  State<CustomerDetails> createState() => _CustomerDetailsState();
}

class _CustomerDetailsState extends State<CustomerDetails> {
  CustomerDetailsController customerDetailsController =
      Get.put(CustomerDetailsController());
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();

  @override
  void initState() {
    customerDetailsController.getCustomerData(widget.id);
    super.initState();
  }

  Future<void> _refresh() async {
    await customerDetailsController.getCustomerData(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Customer Details'),
        centerTitle: true,
      ),
      body: Obx(() {
        if (customerDetailsController.isLoading.value) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else {
          var customer = customerDetailsController.customer.value;

          return RefreshIndicator(
            key: _refreshIndicatorKey,
            onRefresh: _refresh,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  children: [
                    Image.asset(
                      'assets/images/profile.jpg',
                      width: 150,
                      height: 150,
                    ),
                    const Align(alignment: Alignment.center),

                    const SizedBox(height: 10),
                    Text(
                      customer!.firstName + " " + customer.lastName,
                      style: TextStyle(fontSize: 16, fontFamily: 'JosefinSans'),
                    ),

                    const SizedBox(height: 25),

                    // Row(
                    //   children: [
                    //     Expanded(
                    //       child: ElevatedButton(
                    //         onPressed: () {},
                    //         style: ElevatedButton.styleFrom(
                    //             backgroundColor: Colors.green,
                    //             foregroundColor: Colors.white),
                    //         child: const Text('View Details'),
                    //       ),
                    //     ),
                    //     const SizedBox(width: 10),
                    //     Expanded(
                    //       child: GestureDetector(
                    //           onTap: () {},
                    //           child: CustomButton(
                    //               buttonText: 'View Order History')),
                    //       //  ElevatedButton(
                    //       //   onPressed: () {},
                    //       //   style: ElevatedButton.styleFrom(
                    //       //       backgroundColor: Colors.green,
                    //       //       foregroundColor: Colors.white),
                    //       //   child: const Text('View Order History'),
                    //       // ),
                    //     ),
                    //   ],
                    // ),

                    const SizedBox(height: 25),

                    const Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Personal Details',
                          style: TextStyle(fontSize: 18),
                        )
                      ],
                    ),

                    const SizedBox(height: 25),

                    Container(
                      padding: const EdgeInsets.all(12),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: AppColors.lightgreen,
                        boxShadow: const [
                          BoxShadow(color: Colors.black, blurRadius: 10),
                        ],
                      ),
                      child: Card(
                        color: AppColors.lightgreen,
                        elevation: 0,
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  'ID: ',
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.white),
                                ),
                                Text(
                                  '0001',
                                  style: TextStyle(fontSize: 15),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  'Name: ',
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.white),
                                ),
                                Text(
                                  customer.firstName + customer.lastName,
                                  style: TextStyle(fontSize: 15),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  'Phone Number: ',
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.white),
                                ),
                                Text(
                                  customer.phoneNumber,
                                  style: TextStyle(fontSize: 15),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  'Email: ',
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.white),
                                ),
                                Text(
                                  customer.email,
                                  style: TextStyle(fontSize: 15),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  'Address: ',
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.white),
                                ),
                                Text(
                                  customer.address,
                                  style: TextStyle(fontSize: 15),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  'Intrest: ',
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.white),
                                ),
                                Text(
                                  customer.interest,
                                  style: TextStyle(fontSize: 15),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  'Budget: ',
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.white),
                                ),
                                Text(
                                  customer.budget,
                                  style: TextStyle(fontSize: 15),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  'Remarks: ',
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.white),
                                ),
                                Text(
                                  customer.remark,
                                  style: TextStyle(fontSize: 15),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),

                    // Product Details

                    const SizedBox(height: 25),

                    const Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Order Details',
                          style: TextStyle(fontSize: 18),
                        )
                      ],
                    ),

                    const SizedBox(height: 25),

                    Container(
                      padding: const EdgeInsets.all(12),
                      height: MediaQuery.of(context).size.height * .18,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: AppColors.lightgreen,
                        boxShadow: const [
                          BoxShadow(color: Colors.black, blurRadius: 10),
                        ],
                      ),
                      child: Column(
                        children: [
                          Center(
                              child: CustomText(
                            text: 'No Data Found',
                            fontSize: 20,
                            textColor: AppColors.linearBlack,
                            fontWeight: FontWeight.bold,
                          ))

                          //   Row(
                          //     mainAxisAlignment: MainAxisAlignment.start,
                          //     children: [
                          //       Text(
                          //         'Order ID: ',
                          //         style: TextStyle(
                          //             fontSize: 15, color: Colors.white),
                          //       ),
                          //       Text(
                          //         'Ord.01',
                          //         style: TextStyle(fontSize: 15),
                          //       ),
                          //     ],
                          //   ),
                          //   Row(
                          //     mainAxisAlignment: MainAxisAlignment.start,
                          //     children: [
                          //       Text(
                          //         'Product ID: ',
                          //         style: TextStyle(
                          //             fontSize: 15, color: Colors.white),
                          //       ),
                          //       Text(
                          //         'P512',
                          //         style: TextStyle(fontSize: 15),
                          //       ),
                          //     ],
                          //   ),
                          //   Row(
                          //     mainAxisAlignment: MainAxisAlignment.start,
                          //     children: [
                          //       Text(
                          //         'Product Name: ',
                          //         style: TextStyle(
                          //             fontSize: 15, color: Colors.white),
                          //       ),
                          //       Text(
                          //         'AC',
                          //         style: TextStyle(fontSize: 15),
                          //       ),
                          //     ],
                          //   ),
                          //   Row(
                          //     mainAxisAlignment: MainAxisAlignment.start,
                          //     children: [
                          //       Text(
                          //         'Company Name: ',
                          //         style: TextStyle(
                          //             fontSize: 15, color: Colors.white),
                          //       ),
                          //       Text(
                          //         'Lloyd',
                          //         style: TextStyle(fontSize: 15),
                          //       ),
                          //     ],
                          //   ),
                          //   Row(
                          //     mainAxisAlignment: MainAxisAlignment.start,
                          //     children: [
                          //       Text(
                          //         'Date of Order: ',
                          //         style: TextStyle(
                          //             fontSize: 15, color: Colors.white),
                          //       ),
                          //       Text(
                          //         '24/05/2024',
                          //         style: TextStyle(fontSize: 15),
                          //       ),
                          //     ],
                          //   ),
                          //   Row(
                          //     mainAxisAlignment: MainAxisAlignment.start,
                          //     children: [
                          //       Text(
                          //         'Date of Delivery: ',
                          //         style: TextStyle(
                          //             fontSize: 15, color: Colors.white),
                          //       ),
                          //       Text(
                          //         '24/05/2024',
                          //         style: TextStyle(fontSize: 15),
                          //       ),
                          //     ],
                          //   ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 25),

                    const Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Customer Query',
                          style: TextStyle(fontSize: 18),
                        )
                      ],
                    ),

                    const SizedBox(height: 25),

                    Container(
                        padding: const EdgeInsets.all(12),
                        height: MediaQuery.of(context).size.height * .1,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: const Color.fromARGB(255, 97, 177, 99),
                          boxShadow: const [
                            BoxShadow(color: Colors.black, blurRadius: 10),
                          ],
                        ),
                        child: const Column(
                          children: [
                            Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text('1: ',
                                      style: TextStyle(
                                          fontSize: 15, color: Colors.white)),
                                  Text("What is the ideal delivery duration?")
                                ]),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text('2: ',
                                      style: TextStyle(
                                          fontSize: 15, color: Colors.white)),
                                  Text("What is your return policy?")
                                ])
                          ],
                        ))
                  ],
                ),
              ),
            ),
          );
        }
      }),
    );
  }
}
