import 'package:flutter/material.dart';

class ProductDetailsCard extends StatelessWidget {
  final String name;
  final String price;
  final Color color;

  ProductDetailsCard({
    required this.name,
    required this.price,
    required this.color,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          Text(name),
          Text(price, style: TextStyle(color: Colors.green)),
        ],
      ),
    );
  }
}
