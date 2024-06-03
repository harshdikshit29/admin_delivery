import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'product_description_controller.dart';

class ProductDescription extends StatefulWidget {
  final int id;
  const ProductDescription({super.key, required this.id});

  @override
  State<ProductDescription> createState() => _ProductDescriptionState();
}

class _ProductDescriptionState extends State<ProductDescription> {
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();
  final ProductDetailsController productDescriptioncontroller =
      Get.put(ProductDetailsController());

  @override
  void initState() {
    productDescriptioncontroller.getProductData(widget.id);
    super.initState();
  }

  Future<void> _refresh() async {
    await productDescriptioncontroller.getProductData(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 167, 236, 57),
        title: Text("Product Description"),
        centerTitle: true,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            // Add back button functionality here
          },
        ),
      ),
      body: Obx(() {
        if (productDescriptioncontroller.isLoading.value) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else {
          var product = productDescriptioncontroller.product.value;
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  // Image.network(
                  //   controller.imageUrl,
                  //   height: 300,
                  //   width: double.infinity,
                  //   fit: BoxFit.cover,
                  // ),
                  SizedBox(height: 16),
                  Text(
                    product!.productName + " " + product.modelNumber,
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: <Widget>[
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text('423 SOLD', style: TextStyle(fontSize: 12)),
                      ),
                      SizedBox(width: 16),
                      Row(
                        children: [
                          Icon(Icons.star, color: Colors.amber, size: 20),
                          SizedBox(width: 4),
                          Text(
                            '4.3',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(width: 4),
                          Text('(53 reviews)', style: TextStyle(fontSize: 14)),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Description',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(
                    product.productDetails,
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 16),

                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Quantity',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        product.quantity,
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'TOTAL PRICE',
                        style: TextStyle(fontSize: 16),
                      ),
                      Text(
                        '\$${(1000).toStringAsFixed(2)}',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        }
      }),
    );
  }
}
