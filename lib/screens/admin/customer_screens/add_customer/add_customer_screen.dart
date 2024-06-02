import 'package:admin_delivery/App-constant/color.dart';
import 'package:admin_delivery/screens/admin/customer_screens/add_customer/add_customer_controller.dart';
import 'package:admin_delivery/widgets/custom_button.dart';
import 'package:admin_delivery/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
                              child: DropdownButton<String>(
                                value: addCustomerController.selectedCategory,
                                onChanged: (String? newValue) {
                                  setState(() {
                                    addCustomerController.selectedCategory =
                                        newValue!;
                                  });
                                },
                                items: <String>[
                                  'Select Type',
                                  "Air purifier",
                                  "Air conditioner",
                                  "Alarm clock",
                                  "Backup charger",
                                  "Bread maker",
                                  "Banknote counter",
                                  "Blender",
                                  "Bluetooth speaker",
                                  "Bulb",
                                  "Calculator",
                                  "Car toy",
                                  "Ceiling fan",
                                  "Chandelier",
                                  "Clock",
                                  "Clothes dryer",
                                  "Coffee maker",
                                  "Computer",
                                  "Copier",
                                  "Curling iron",
                                  "Digital camera",
                                  "Dishwasher",
                                  "Doorbell camera",
                                  "Drill",
                                  "Dvd player",
                                  "Earphones",
                                  "Electric frying pan",
                                  "Electric grill",
                                  "Electric guitar",
                                  "Electric pencil sharpener",
                                  "Electric razor",
                                  "Electric stove",
                                  "Exhaust fan",
                                  "External hard drive",
                                  "Fan",
                                  "Facial cleansing machine",
                                  "Fax",
                                  "Fish tank",
                                  "Floor lamp",
                                  "Game controller",
                                  "Grandfather clock",
                                  "Hair dryer",
                                  "Headset",
                                  "Inkjet printer",
                                  "iPod",
                                  "Iron",
                                  "Juicer",
                                  "Kettle",
                                  "Kitchen scale",
                                  "Hair straightening machine",
                                  "Laser printer",
                                  "Lawn mower",
                                  "Lift",
                                  "Meat grinder",
                                  "Microphone",
                                  "Microwave",
                                  "Mixer",
                                  "Monitor",
                                  "Mosquito racket",
                                  "Mouse",
                                  "Mp3 player",
                                  "Oil-free fryer",
                                  "Piano",
                                  "Oven",
                                  "Plotter",
                                  "Pressure cooker",
                                  "Printer",
                                  "Projector",
                                  "Radiator",
                                  "Radio",
                                  "Reading lamp",
                                  "Refrigerator",
                                  "Remote control",
                                  "Rice cooker",
                                  "Safe",
                                  "Robotic vacuum cleaner",
                                  "Sandwich maker",
                                  "Scale",
                                  "Scanner",
                                  "Sewing machine",
                                  "Smart television",
                                  "Smartphone",
                                  "Speakers",
                                  "Tablet",
                                  "Television",
                                  "Timer",
                                  "Toaster",
                                  "Torch",
                                  "USB drive",
                                  "Vacuum cleaner",
                                  "Walkie-talkie",
                                  "Washing machine",
                                  "Watch",
                                  "Water pumps",
                                  "Water purifier",
                                  "Wall fan",
                                  "Water heater",
                                  "Webcam",
                                  "Wifi modem",
                                ].map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                              ),
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
