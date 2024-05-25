import 'package:flutter/material.dart';

class ProductAdd extends StatefulWidget {
  const ProductAdd({super.key});

  @override
  State<ProductAdd> createState() => _ProductAddState();
}

class _ProductAddState extends State<ProductAdd> {
    String selectedCategory = 'AC';
  final TextEditingController productDetailsController = TextEditingController();
  final TextEditingController brandController = TextEditingController();
  final TextEditingController modelNumberController = TextEditingController();
  final TextEditingController productNameController = TextEditingController();
  final TextEditingController modelNameController = TextEditingController();
  final TextEditingController quantityController = TextEditingController();
  int currentQuantity = 0;

  void addProduct() {
    int quantityToAdd = int.tryParse(quantityController.text) ?? 0;
    setState(() {
      currentQuantity += quantityToAdd;
    });
  }

  void removeProduct() {
    int quantityToRemove = int.tryParse(quantityController.text) ?? 0;
    setState(() {
      currentQuantity -= quantityToRemove;
      if (currentQuantity < 0) {
        currentQuantity = 0; // Prevent negative quantities
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 129, 233, 132),
        title: Text('Product Listing'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Product Category',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              DropdownButton<String>(
                value: selectedCategory,
                onChanged: (String? newValue) {
                  setState(() {
                    selectedCategory = newValue!;
                  });
                },
                items: <String>['AC', 'Oven', 'Refrigerator', 'Speaker']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              TextField(
                controller: productDetailsController,
                decoration: InputDecoration(
                  labelText: 'Product Name',
                  border: OutlineInputBorder(),
                ),
                maxLines: 1,
              ),
              SizedBox(height: 16),
              TextField(
                controller: brandController,
                decoration: InputDecoration(
                  labelText: 'Model Number',
                  border: OutlineInputBorder(),
                ),
                maxLines: 1,
              ),
              SizedBox(height: 16),
              TextField(
                controller: modelNumberController,
                decoration: InputDecoration(
                  labelText: 'Product Details',
                  border: OutlineInputBorder(),
                ),
                maxLines: 1,
              ),
              SizedBox(height: 30),
              Text(
                'Current Quantity: $currentQuantity',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 50),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: productNameController,
                      decoration: InputDecoration(
                        labelText: 'Product Name',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: TextField(
                      controller: modelNameController,
                      decoration: InputDecoration(
                        labelText: 'Model Number',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 24),
              TextField(
                controller: quantityController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Quantity',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 24),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: addProduct,
                      child: Text('Add'),
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: 16),
                      ),
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: removeProduct,
                      child: Text('Remove'),
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: 16),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}