import 'package:flutter/material.dart';
import 'package:foobakickz_mobile/widgets/left_drawer.dart';
import 'package:foobakickz_mobile/widgets/item_card.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});

  final String nama = "Cheryl Raynasya Adenan";
  final String npm = "2406437571";
  final String kelas = "A";

  // List items untuk ItemCard
  final List<ItemHomepage> items = [
    ItemHomepage("All Products", Icons.checklist, Colors.blue),
    ItemHomepage("My Products", Icons.shopping_bag, Colors.green),
    ItemHomepage("Create Product", Icons.add_box, Colors.red),
  ];

@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Foobakickz',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      // Drawer
      drawer: const LeftDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Row InfoCard
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InfoCard(title: 'NPM', content: npm),
                InfoCard(title: 'Name', content: nama),
                InfoCard(title: 'Class', content: kelas),
              ],
            ),
            const SizedBox(height: 16.0),
            Center(
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 16.0),
                    child: Text(
                      'Selamat datang di Foobakickz!',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                  // GridView untuk ItemCard
                  GridView.count(
                    primary: true,
                    padding: const EdgeInsets.all(20),
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    crossAxisCount: 3,
                    shrinkWrap: true,
                    children: items.map((ItemHomepage item) {
                      return ItemCard(item);
                    }).toList(),
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