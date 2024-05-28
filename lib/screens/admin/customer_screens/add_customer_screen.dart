import 'package:admin_delivery/App-constant/color.dart';
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
      appBar: AppBar(
        title: CustomText(
          text: "Add New Customer",
          fontSize: 25,
          textColor: AppColors.linearBlack,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: w * .08, vertical: h * .03),
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
                        if (firstname == '' ||
                            lastname == '' ||
                            phonenumber == '' ||
                            Email == '' ||
                            Address == '') {
                          Get.snackbar('Error', 'Enter Data to Continue',
                              duration: Duration(seconds: 3));
                        } else {
                          Get.off(CustomerManagementScreen(
                              firstName: firstname,
                              lastName: lastname,
                              phoneNumber: phonenumber,
                              email: Email,
                              address: Address));
                        }
                      },
                      child: CustomButton(
                        buttonText: 'Add Customer',
                        width: w * .4,
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
  }
}
