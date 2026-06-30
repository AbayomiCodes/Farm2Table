import 'package:flutter/material.dart';

class ProductDetailsCard extends StatelessWidget {
  final String name;
  final String price;
  final Color color;
  final String image;

  ProductDetailsCard({
    required this.name,
    required this.price,
    required this.color,
    required this.image,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 115,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(8),
            child: Image.asset(image, height: 80),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: TextStyle(fontWeight: FontWeight.bold)),
                Text(price, style: TextStyle(color: Colors.green)),
                SizedBox(height: 8),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
