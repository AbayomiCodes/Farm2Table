import 'package:bakingapp/pages/screens/widgets/product_details_card.dart';
import 'package:flutter/material.dart';

class ProductDetails extends StatefulWidget {
  final String name;
  final String price;
  final String weight;
  final Color color;

  const ProductDetails({
    super.key,
    required this.name,
    required this.price,
    required this.weight,
    required this.color,
  });

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final List<Map<String, dynamic>> similarProducts = [
    {'name': 'Orange', 'price': 'GHS 10', 'color': Colors.orange[100]},
    {'name': 'Apple', 'price': 'GHS 15', 'color': Colors.red[100]},
    {'name': 'Banana', 'price': 'GHS 8', 'color': Colors.yellow[100]},
    {'name': 'Mango', 'price': 'GHS 20', 'color': Colors.amber[100]},
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [Icon(Icons.favorite)],
      ),

      body: Column(
        children: [
          Expanded(flex: 1, child: Image.asset('assets/images/tomatoes.jpg')),

          Expanded(
            flex: 2,
            child: Column(
              children: [
                TabBar(
                  controller: _tabController,
                  tabs: [
                    Tab(text: 'Details'),
                    Tab(text: 'Reviews'),
                  ],
                ),

                //Details
                Expanded(
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(widget.name),
                                Spacer(),
                                Text(
                                  widget.price,
                                  style: TextStyle(color: Colors.green),
                                ),
                              ],
                            ),
                            SizedBox(height: 10),

                            Row(
                              children: [
                                Text('Quantity Available'),
                                Spacer(),
                                Text(
                                  '100',
                                  style: TextStyle(color: Colors.green),
                                ),
                              ],
                            ),
                            SizedBox(height: 10),

                            Row(
                              children: [
                                Text('Net Weight'),
                                Spacer(),
                                Text(
                                  widget.weight,
                                  style: TextStyle(color: Colors.green),
                                ),
                              ],
                            ),

                            SizedBox(height: 25),
                            Text(
                              'Similar Products',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: similarProducts.map(
                                  (product) {
                                    return Padding(
                                      padding: EdgeInsets.only(right: 10),
                                      child: ProductDetailsCard(
                                        name: product['name'],
                                        price: product['price'],
                                        color: product['color'],
                                      ),
                                    );
                                  },
                                ).toList(), // 👈 .toList() goes here, outside the Row children brackets
                              ),
                            ),
                          ],
                        ),
                      ),

                      //reviews
                      Center(child: Text('Reviews content')),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),

      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
        child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green,
            minimumSize: Size(double.infinity, 50),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: Text('Add to Cart', style: TextStyle(color: Colors.white)),
        ),
      ),
    );
  }
}
