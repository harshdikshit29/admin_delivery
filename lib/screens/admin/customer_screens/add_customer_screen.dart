import 'package:admin_delivery/App-constant/color.dart';
import 'package:admin_delivery/screens/admin/customer_screens/customer_manage_screen.dart';
import 'package:admin_delivery/screens/admin/home/admin_home_screen.dart';
import 'package:admin_delivery/widgets/custom_button.dart';
import 'package:admin_delivery/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class CustomerAdd extends StatefulWidget {
  const CustomerAdd({super.key});

  @override
  State<CustomerAdd> createState() => _CustomerAddState();
}

class _CustomerAddState extends State<CustomerAdd> {
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController address = TextEditingController();
  String firstname = '';
  String lastname = '';
  String phonenumber = '';
  String Email = '';
  String Address = '';
  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                text: "Add New Customer",
                fontSize: 30,
                textColor: AppColors.linearBlack,
                fontWeight: FontWeight.bold,
              ),
              SizedBox(height: h * .02),
              Form(
                  child: Column(
                children: [
                  TextFormField(
                    expands: false,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        prefixIcon: Icon(Icons.person, size: 30),
                        labelText: "First Name",
                        hintText: 'Enter first name'),
                    controller: firstName,
                    keyboardType: TextInputType.name,
                    onChanged: (value) {
                      setState(() {
                        firstname = value;
                      });
                    },
                  ),
                  SizedBox(height: h * .03),
                  TextFormField(
                    expands: false,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      prefixIcon: Icon(Icons.person, size: 30),
                      labelText: "Last Name",
                      hintText: 'Enter last name',
                    ),
                    controller: lastName,
                    keyboardType: TextInputType.name,
                    onChanged: (value) {
                      setState(() {
                        lastname = value;
                      });
                    },
                  ),
                  SizedBox(height: h * .03),
                  TextFormField(
                    expands: false,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        prefixIcon: Icon(Icons.person, size: 30),
                        labelText: "Phone Number",
                        hintText: 'Enter phone number'),
                    controller: phoneNumber,
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      setState(() {
                        phonenumber = value;
                      });
                    },
                  ),
                  SizedBox(height: h * .03),
                  TextFormField(
                    expands: false,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        prefixIcon: Icon(Icons.person, size: 30),
                        labelText: "Email",
                        hintText: 'Enter email'),
                    controller: email,
                    keyboardType: TextInputType.emailAddress,
                    onChanged: (value) {
                      setState(() {
                        Email = value;
                      });
                    },
                  ),
                  SizedBox(height: h * .03),
                  TextFormField(
                    expands: false,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        prefixIcon: Icon(Icons.person, size: 30),
                        labelText: "Address",
                        hintText: 'Enter address'),
                    controller: address,
                    keyboardType: TextInputType.streetAddress,
                    onChanged: (value) {
                      setState(() {
                        Address = value;
                      });
                    },
                  ),
                  SizedBox(height: h * .05),
                  GestureDetector(
                    onTap: () {
                      Get.off(CustomerManagementScreen(
                          firstName: firstname,
                          lastName: lastname,
                          phoneNumber: phonenumber,
                          email: Email,
                          address: Address));
                    },
                    child: CustomButton(
                      buttonText: 'Add Customer',
                      width: 275,
                      height: 52,
                    ),
                  ),
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }
}
