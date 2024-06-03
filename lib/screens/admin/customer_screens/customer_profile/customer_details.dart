import 'package:admin_delivery/App-constant/color.dart';
import 'package:admin_delivery/screens/admin/customer_screens/customer_profile/customer_details_controller.dart';
import 'package:admin_delivery/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class CustomerDetails extends StatefulWidget {
  final int id;
  const CustomerDetails({
    super.key,
    required this.id,
  });

  @override
  State<CustomerDetails> createState() => _CustomerDetailsState();
}

class _CustomerDetailsState extends State<CustomerDetails> {
  CustomerDetailsController customerDetailsController =
      Get.put(CustomerDetailsController());
  @override
  @override
  void initState() {
    customerDetailsController.getCustomerData(widget.id);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Customer Details ${widget.id}'),
        centerTitle: true,
      ),
      body: Obx(
         () {
          return SingleChildScrollView(
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
                    widget,
                    style: TextStyle(fontSize: 16, fontFamily: 'JosefinSans'),
                  ),
          
                  const SizedBox(height: 25),
          
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green,
                              foregroundColor: Colors.white),
                          child: const Text('View Details'),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: GestureDetector(
                            onTap: () {},
                            child: CustomButton(buttonText: 'View Order History')),
                        //  ElevatedButton(
                        //   onPressed: () {},
                        //   style: ElevatedButton.styleFrom(
                        //       backgroundColor: Colors.green,
                        //       foregroundColor: Colors.white),
                        //   child: const Text('View Order History'),
                        // ),
                      ),
                    ],
                  ),
          
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
                    height: MediaQuery.of(context).size.height * .16,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: AppColors.lightgreen,
                      boxShadow: const [
                        BoxShadow(color: Colors.black, blurRadius: 10),
                      ],
                    ),
                    child: const Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'ID: ',
                              style: TextStyle(fontSize: 15, color: Colors.white),
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
                              style: TextStyle(fontSize: 15, color: Colors.white),
                            ),
                            Text(
                              'Harsh Dikshit',
                              style: TextStyle(fontSize: 15),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'Phone Number: ',
                              style: TextStyle(fontSize: 15, color: Colors.white),
                            ),
                            Text(
                              '987654321',
                              style: TextStyle(fontSize: 15),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'Email: ',
                              style: TextStyle(fontSize: 15, color: Colors.white),
                            ),
                            Text(
                              'abc@gmail.com',
                              style: TextStyle(fontSize: 15),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'Address: ',
                              style: TextStyle(fontSize: 15, color: Colors.white),
                            ),
                            Text(
                              'Lucknow',
                              style: TextStyle(fontSize: 15),
                            ),
                          ],
                        ),
                      ],
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
                    child: const Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'Order ID: ',
                              style: TextStyle(fontSize: 15, color: Colors.white),
                            ),
                            Text(
                              'Ord.01',
                              style: TextStyle(fontSize: 15),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'Product ID: ',
                              style: TextStyle(fontSize: 15, color: Colors.white),
                            ),
                            Text(
                              'P512',
                              style: TextStyle(fontSize: 15),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'Product Name: ',
                              style: TextStyle(fontSize: 15, color: Colors.white),
                            ),
                            Text(
                              'AC',
                              style: TextStyle(fontSize: 15),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'Company Name: ',
                              style: TextStyle(fontSize: 15, color: Colors.white),
                            ),
                            Text(
                              'Lloyd',
                              style: TextStyle(fontSize: 15),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'Date of Order: ',
                              style: TextStyle(fontSize: 15, color: Colors.white),
                            ),
                            Text(
                              '24/05/2024',
                              style: TextStyle(fontSize: 15),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'Date of Delivery: ',
                              style: TextStyle(fontSize: 15, color: Colors.white),
                            ),
                            Text(
                              '24/05/2024',
                              style: TextStyle(fontSize: 15),
                            ),
                          ],
                        ),
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
          );
        }
      ),
    );
  }
}
