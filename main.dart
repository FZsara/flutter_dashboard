import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dashboard UI',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const DashboardScreen(),
    );
  }
}

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ONLINE SOFT SELL'),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: SingleChildScrollView( // Allow scrolling if necessary
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(16.0),
              color: Colors.green,
              width: double.infinity,
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hello, Admin',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            LayoutBuilder(
              builder: (context, constraints) {
                int crossAxisCount = constraints.maxWidth < 600 ? 2 : 3; // 2 cards in mobile view, 3 in larger view
                double childAspectRatio = 0.8; // Adjusted for smaller size

                return GridView.count(
                  padding: const EdgeInsets.all(16.0),
                  crossAxisCount: crossAxisCount,
                  crossAxisSpacing: 16.0,
                  mainAxisSpacing: 16.0,
                  childAspectRatio: childAspectRatio,
                  physics: const NeverScrollableScrollPhysics(), // Disable GridView scrolling
                  shrinkWrap: true, // Allow the GridView to wrap its content
                  children: [
                    DashboardCard(
                      title: 'Customers',
                      imagePath: 'assets/images/customer.jpg',
                      onTap: () {},
                    ),
                    DashboardCard(
                      title: 'Suppliers',
                      imagePath: 'assets/images/supplier.jpg',
                      onTap: () {},
                    ),
                    DashboardCard(
                      title: 'Products',
                      imagePath: 'assets/images/product.jpg',
                      onTap: () {},
                    ),
                    DashboardCard(
                      title: 'POS',
                      imagePath: 'assets/images/pos.jpg',
                      onTap: () {},
                    ),
                    DashboardCard(
                      title: 'Expense',
                      imagePath: 'assets/images/expense.jpg',
                      onTap: () {},
                    ),
                    DashboardCard(
                      title: 'Orders',
                      imagePath: 'assets/images/order.jpg',
                      onTap: () {},
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class DashboardCard extends StatelessWidget {
  final String title;
  final String imagePath;
  final VoidCallback onTap;

  const DashboardCard({super.key, required this.title, required this.imagePath, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0), // Smaller padding
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Adjust the image height and use Flexible for better responsiveness
              Flexible(
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(height: 8), // Reduced spacing between image and text
              Text(
                title,
                style: const TextStyle(
                  fontSize: 20, 
                  fontWeight: FontWeight.bold,
                  color: Colors.green, 
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}