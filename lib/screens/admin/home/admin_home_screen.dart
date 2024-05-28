import 'package:admin_delivery/App-constant/color.dart';
import 'package:admin_delivery/screens/admin/customer_screens/customer_manage_screen.dart';
import 'package:admin_delivery/screens/admin/product_management/product_management_screen.dart';
import 'package:admin_delivery/widgets/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class AdminHomeScreen extends StatefulWidget {
  const AdminHomeScreen({super.key});

  @override
  State<AdminHomeScreen> createState() => _AdminHomeScreenState();
}

class _AdminHomeScreenState extends State<AdminHomeScreen> {
  void onTap(String title) {
    print('$title tapped');
    // Add onTap logic here
  }

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: ListView(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.zero,
        children: [
          Container(
            decoration: BoxDecoration(
              color: AppColors.lightgreen,
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(40),
              ),
            ),
            child: Column(
              children: [
                SizedBox(height: h * .04),
                ListTile(
                  contentPadding: EdgeInsets.symmetric(horizontal: w * .1),
                  title: CustomText(
                      text: "Welcome Admin",
                      fontSize: 30,
                      textColor: AppColors.linearBlack),
                  // subtitle: Text('Good Morning',
                  //     style: Theme.of(context)
                  //         .textTheme
                  //         .titleMedium
                  //         ?.copyWith(color: Colors.white54)),
                  // trailing: const CircleAvatar(
                  //   radius: 30,
                  //   backgroundImage: AssetImage('assets/images/user.JPG'),
                  // ),
                ),
                SizedBox(height: h * .04)
              ],
            ),
          ),
          Container(
            color: AppColors.lightgreen,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: w * .1),
              decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius:
                      BorderRadius.only(topLeft: Radius.circular(100))),
              child: GridView.count(
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                crossAxisCount: 2,
                crossAxisSpacing: w * .1,
                mainAxisSpacing: h * .04,
                children: [
                  itemDashboard(
                      'Customers',
                      CupertinoIcons.person_2,
                      Colors.deepOrange,
                      () => Get.to(CustomerManagementScreen(
                            firstName: '',
                            lastName: '',
                            phoneNumber: '',
                            email: '',
                            address: '',
                          ))),
                  itemDashboard(
                      'Products',
                      CupertinoIcons.arrow_up_doc_fill,
                      Colors.green,
                      () => Get.to(ProductManagement(
                            productDetails: '',
                            brand: '',
                            modelNumber: '',
                            productName: '',
                            quantity: '',
                            selectedCategory: '',
                          ))),
                  itemDashboard('Deliveries', CupertinoIcons.airplane,
                      Colors.purple, () => onTap('Deliveries')),
                  itemDashboard('Delivery Managers', CupertinoIcons.person,
                      Colors.brown, () => onTap('Delivery Managers')),
                  itemDashboard('Stocks', CupertinoIcons.cart_fill,
                      Colors.indigo, () => onTap('Stocks')),
                  itemDashboard(
                      'Payments',
                      CupertinoIcons.money_dollar_circle_fill,
                      Colors.teal,
                      () => onTap('Payments')),
                  itemDashboard('Queries', CupertinoIcons.question_circle,
                      Colors.blue, () => onTap('Queries')),
                  itemDashboard('Stores', CupertinoIcons.house_fill,
                      Colors.pinkAccent, () => onTap('Stores')),
                ],
              ),
            ),
          ),
          SizedBox(height: h * .03)
        ],
      ),
    );
  }

  itemDashboard(String title, IconData iconData, Color background,
          VoidCallback onTap) =>
      Container(
        decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                  offset: const Offset(0, 5),
                  color: Theme.of(context).primaryColor.withOpacity(.2),
                  spreadRadius: 2,
                  blurRadius: 5)
            ]),
        child: InkWell(
          // Wrap the content with InkWell to handle taps
          onTap: onTap,
          child: Center(
            // Center the entire Column
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              // Center the content inside the Column
              children: [
                Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: background,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(iconData, color: Colors.white)),
                const SizedBox(height: 8),
                Text(
                  title.toUpperCase(),
                  style: Theme.of(context).textTheme.titleMedium,
                  textAlign: TextAlign
                      .center, // Center the text within the Text widget
                )
              ],
            ),
          ),
        ),
      );
}
