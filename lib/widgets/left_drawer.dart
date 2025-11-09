import 'package:flutter/material.dart';
import 'package:foobakickz_mobile/screens/menu.dart';
import 'package:foobakickz_mobile/screens/product_form_page.dart';

class LeftDrawer extends StatelessWidget {
  const LeftDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(color: Colors.blue),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Foobakickz Menu',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Padding(padding: EdgeInsets.all(5)),
                Text(
                  "Platform untuk penggemar FoobaKickz!",
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),

          // Halaman utama
          ListTile(
            leading: const Icon(Icons.home_outlined),
            title: const Text('Halaman Utama'),
            onTap: () {
              // Menggunakan pushReplacement
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => MyHomePage(),
                ),
              );
            },
          ),

          // Tambah produk
          ListTile(
            leading: const Icon(Icons.add_box),
            title: const Text('Tambah Produk'),
            onTap: () {
              // Menggunakan pushReplacement
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const ProductFormPage(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}