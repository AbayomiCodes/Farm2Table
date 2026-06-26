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
        titleSpacing: 20,
        leading: Icon(Icons.arrow_back),
        actions: [Icon(Icons.favorite)],
      ),

      body: Column(
        children: [
          Expanded(flex: 1, child: Image.asset('assets/images/avocado.jpg')),

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

                Expanded(
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(widget.name),
                            Text(widget.price),
                            Text(widget.weight),
                          ],
                        ),
                      ),

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


















  // appBar: AppBar(title: Text(widget.name)),
      // body: TabBarView(
      //   controller: _tabController,
      //   children: [
      //     Container(
      //       color: widget.color,
      //       child: Center(child: Text('Product Image')),
      //     ),
      //     Container(
      //       color: widget.color,
      //       child: Center(child: Text('Product Description')),
      //     ),
      //   ],
      // ),