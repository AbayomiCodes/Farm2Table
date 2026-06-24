import 'package:bakingapp/pages/screens/widgets/product_card.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
// import 'product_card.dart';




class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

   final List<Map<String, dynamic>> categories = [  
    {'icon': Icons.shopping_basket, 'label': 'All Products', 'color': Colors.pink[100]},
    {'icon': Icons.grass, 'label': 'Vegetables', 'color': Colors.green[100]},
    {'icon': Icons.apple, 'label': 'Fruits', 'color': Colors.pink[100]},
    {'icon': Icons.grain, 'label': 'Grains', 'color': Colors.green[100]},
    {'icon': Icons.egg, 'label': 'Eggs', 'color': Colors.pink[100]},
    {'icon': Icons.coffee, 'label': 'Beverages', 'color': Colors.green[100]},
    {'icon': Icons.breakfast_dining, 'label': 'Spreads', 'color': Colors.pink[100]},
  ];

  final List<Map<String, dynamic>> dummyProducts = [
    {'name': 'Fresh Tomatoes', 'price': 'GHS 100' , 'image_placeholder': Colors.orange[100], 'weight_quantity': '140 kg', 'unit': 'per kg', 'available': 'available'},
    {'name': 'Avocado', 'price': 'GHS 25' , 'image_placeholder': Colors.red[100], 'weight_quantity': '40 kg', 'unit': 'per kg', 'available': 'available'},
    {'name': 'Eggs', 'price': 'GHS 4' , 'image_placeholder': Colors.yellow[100], 'weight_quantity': '900 g (Crate)', 'unit': 'per kg', 'available': 'available'},
    {'name': 'Oranges', 'price': 'GHS 10' , 'image_placeholder': Colors.amber[100], 'weight_quantity': '25 kg', 'unit': 'per kg', 'available': 'available'},
    {'name': 'Yam', 'price': 'GHS 70' , 'image_placeholder': Colors.blue[100], 'weight_quantity': '160 kg', 'unit': 'per kg', 'available': 'available'},
    {'name': 'Grains', 'price': 'GHS 30' , 'image_placeholder': Colors.green[100], 'weight_quantity': '50 kg', 'unit': 'per kg', 'available': 'available'},
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 7, vsync: this);
    _tabController.addListener(() {
      print('Tab changed to: ${_tabController.index}');
    }
    );
  }

  @override
void dispose() {
  _tabController.dispose();
  super.dispose();
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Header
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(40),
              color: Colors.green,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                Text('Fresh Farm',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                ),

                Text('Products',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                ),

                Text('Direct from your local farmers to your table',
                style: TextStyle(
                  color: Colors.white,
                ),
                ),

                SizedBox(height: 10,),

                      TextField(
                        decoration: InputDecoration(
                          hintText: 'Search for Products...',
                          filled: true,
                          fillColor: const Color.fromARGB(255, 241, 240, 240),
                      
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide.none,
                          )
                        ),
                      ),
                    ],
                  ),
                ),
                       

                Expanded(
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(20),
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,

                              child: 
                              Row(
                                children: categories.map((category) {
                                   return Padding(
                                     padding:  EdgeInsets.only(right: 15),
                                     child: Column(
                                      children: [
                                        Container(                                        
                                          height: 60,
                                          width: 60,
                                          decoration: BoxDecoration(
                                            color: category['color'],
                                            borderRadius: BorderRadius.circular(10),
                                          ),
                                          child: Icon(category['icon']),
                                        ),
                                        SizedBox(height: 5),
                                        Text(
                                          category['label'],
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        ),
                                      ],
                                     ),
                                   );
                                     }).toList(),
                                  ),                                                                                         
                ),
                ),

                Expanded(
                                       child: GridView.builder(
                                          gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 2,
                                            crossAxisSpacing: 10,
                                            mainAxisSpacing: 10,
                                            mainAxisExtent: 280,
                                            
                                           ),
                                          itemCount: dummyProducts.length,
                                          itemBuilder: (BuildContext context, int index) {
                                            return ProductCard(
                                            name: dummyProducts[index]['name'], 
                                            price: dummyProducts[index]['price'],
                                            weight: dummyProducts[index]['weight_quantity'], 
                                            color: dummyProducts[index]['image_placeholder'],
                                            unit: dummyProducts[index]['unit'],
                                            available: dummyProducts[index]['available'],
                                          );     
                                        },
                                       ),
                                    ),
                ],              
                      ),
                    ],
              ), 
                ),
                    ],
            ),
                ),
        );  
  }
}
