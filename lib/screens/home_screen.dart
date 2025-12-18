import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  final List<Product> products = const [
    Product(
      name: "Laptop Mac 16",
      subtitle: "M2 Chip - 16GB RAM",
      price: 2500,
      image: "assets/image/image1.png",
    ),
    Product(
      name: "Laptop HP 1078",
      subtitle: "Intel i7 - SSD",
      price: 1800,
      image: "assets/image/image2.png",
    ),
    Product(
      name: "Laptop HP Dragon",
      subtitle: "Core i5 - 8GB RAM",
      price: 1500,
      image: "assets/image/image3.png",
    ),
    Product(
      name: "Laptop Dell 5055",
      subtitle: "Ryzen 7 - SSD",
      price: 1700,
      image: "assets/image/image4.png",
    ),
    Product(
      name: "iPhone 13 Pro Max",
      subtitle: "256GB - blue",
      price: 1200,
      image: "assets/image/image5.png",
    ),
    Product(
      name: "iPhone 16",
      subtitle: "128GB - Black",
      price: 1400,
      image: "assets/image/image6.png",
    ),
    Product(
      name: "iPhone 12",
      subtitle: "64GB - baby blue",
      price: 800,
      image: "assets/image/image7.png",
    ),
    Product(
      name: "iPhone 14",
      subtitle: "128GB - White",
      price: 1000,
      image: "assets/image/image8.png",
    ),
    Product(
      name: "iPhone 14 Pro",
      subtitle: "256GB - Gold",
      price: 1300,
      image: "assets/image/image9.png",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(

        iconSize: 30,
        selectedItemColor: Colors.teal,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_bag_outlined), label: "Cart"),
          BottomNavigationBarItem(icon: Icon(Icons.person_2_outlined), label: "Settings"),
        ],
      ),
      drawer: Drawer(
        width: 250,
        child: ListView(
          padding: EdgeInsets.zero,
          children: const [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.grey),
              child: Padding(
                padding: EdgeInsets.all(30.0),
                child: Text(
                  "Mega Store",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            ListTile(leading: Icon(Icons.home), title: Text("Home")),
            ListTile(leading: Icon(Icons.shopping_cart), title: Text("Cart")),
            ListTile(leading: Icon(Icons.settings), title: Text("Settings")),
          ],
        ),
      ),
      body: SafeArea(
        top: true,
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 30, 20, 0),
          child: ListView(
            children: [
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.search),
                        hintText: "Search",
                        filled: true,
                        fillColor: Colors.grey[200],
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Builder(
                    builder: (context) => IconButton(
                      icon: const Icon(Icons.menu),
                      onPressed: () {
                        Scaffold.of(context).openDrawer();
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              const Text(
                "Categories",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              SizedBox(
                height: 120,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: const [
                    CategoryItem(icon: Icons.laptop, title: "Laptop"),
                    CategoryItem(icon: Icons.phone_android, title: "Mobile"),
                    CategoryItem(icon: Icons.headset_sharp, title: "HeadPhone"),
                    CategoryItem(icon: Icons.watch, title: "Watch"),
                    CategoryItem(icon: Icons.card_giftcard_sharp, title: "Gifts"),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                "Best Selling",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 15),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: products.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 0.75,
                ),
                itemBuilder: (context, index) {
                  final product = products[index];
                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 110,
                          width: double.infinity,
                          decoration: const BoxDecoration(
                            color: Color(0xFFE0E0E0),
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(12),
                            ),
                          ),
                          child: Image.asset(
                            product.image,
                            fit: BoxFit.contain,
                            errorBuilder: (context, error, stackTrace) {
                              return const Icon(
                                Icons.image_not_supported,
                                size: 40,
                              );
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                product.name,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                product.subtitle,
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey[600],
                                ),
                              ),
                              const SizedBox(height: 6),
                              Text(
                                "\$${product.price}",
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.teal,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Product {
  final String name;
  final String subtitle;
  final double price;
  final String image;

  const Product({
    required this.name,
    required this.subtitle,
    required this.price,
    required this.image,
  });
}

class CategoryItem extends StatelessWidget {
  final IconData icon;
  final String title;

  const CategoryItem({super.key, required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 15),
      child: Column(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              shape: BoxShape.circle,
            ),
            child: Icon(icon, size: 32),
          ),
          const SizedBox(height: 8),
          Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.grey[700],
            ),
          ),
        ],
      ),
    );
  }
}
