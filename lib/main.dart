import 'package:flutter/material.dart';

void main() {
  runApp(const MenuApp());
}

/// Custom "Coffee" theme colours.
class AppColors {
  static const Color espresso = Color(0xFF3E2723);
  static const Color latte = Color(0xFFD7B899);
  static const Color cream = Color(0xFFFFF8F0);
  static const Color caramel = Color(0xFFB5651D);
}

class MenuItem {
  const MenuItem({
    required this.name,
    required this.description,
    required this.price,
    required this.image,
    required this.icon,
  });

  final String name;
  final String description;
  final double price;
  final String image;
  final IconData icon;
}

const List<MenuItem> menuItems = <MenuItem>[
  MenuItem(
    name: 'Espresso',
    description: 'Rich, bold single shot.',
    price: 6.50,
    image: 'assets/images/espresso.jpg',
    icon: Icons.coffee,
  ),
  MenuItem(
    name: 'Caffe Latte',
    description: 'Espresso with steamed milk.',
    price: 10.00,
    image: 'assets/images/latte.jpg',
    icon: Icons.local_cafe,
  ),
  MenuItem(
    name: 'Cappuccino',
    description: 'Equal parts espresso, milk and foam.',
    price: 10.50,
    image: 'assets/images/cappuccino.jpg',
    icon: Icons.coffee_maker,
  ),
  MenuItem(
    name: 'Iced Americano',
    description: 'Espresso over ice and cold water.',
    price: 9.00,
    image: 'assets/images/americano.jpg',
    icon: Icons.icecream,
  ),
  MenuItem(
    name: 'Butter Croissant',
    description: 'Flaky, freshly baked every morning.',
    price: 7.00,
    image: 'assets/images/croissant.jpg',
    icon: Icons.bakery_dining,
  ),
];

class MenuApp extends StatelessWidget {
  const MenuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bidayuh Annah Cafe',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.caramel,
          surface: AppColors.cream,
        ),
        scaffoldBackgroundColor: AppColors.cream,
        useMaterial3: true,
      ),
      home: const MenuScreen(),
    );
  }
}

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.espresso,
        foregroundColor: AppColors.cream,
        title: const Text('Bidayuh Annah Cafe'),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            color: AppColors.latte,
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(Icons.coffee, color: AppColors.espresso),
                SizedBox(width: 8),
                Text(
                  "Today's Menu",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: AppColors.espresso,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: menuItems.length,
              itemBuilder: (BuildContext context, int index) {
                return MenuCard(item: menuItems[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class MenuCard extends StatelessWidget {
  const MenuCard({super.key, required this.item});

  final MenuItem item;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      clipBehavior: Clip.antiAlias,
      child: Row(
        children: <Widget>[
          SizedBox(
            width: 110,
            height: 110,
            child: Image.asset(
              item.image,
              fit: BoxFit.cover,
              // Shows an icon if the image file is missing.
              errorBuilder:
                  (BuildContext context, Object error, StackTrace? stackTrace) {
                    return Container(
                      color: AppColors.latte,
                      child: Icon(
                        item.icon,
                        size: 40,
                        color: AppColors.espresso,
                      ),
                    );
                  },
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Icon(item.icon, size: 18, color: AppColors.caramel),
                      const SizedBox(width: 6),
                      Expanded(
                        child: Text(
                          item.name,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: AppColors.espresso,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(item.description),
                  const SizedBox(height: 8),
                  Text(
                    'RM ${item.price.toStringAsFixed(2)}',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: AppColors.caramel,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
