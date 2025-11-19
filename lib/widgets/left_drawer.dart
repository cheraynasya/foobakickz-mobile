import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:foobakickz_mobile/screens/menu.dart';
import 'package:foobakickz_mobile/screens/product_form_page.dart';
import 'package:foobakickz_mobile/screens/product_list_page.dart';
import 'package:foobakickz_mobile/screens/login.dart';
class LeftDrawer extends StatelessWidget {
  const LeftDrawer({super.key});

  @override
  Widget build(BuildContext context) {
   final request = context.watch<CookieRequest>();
   const String logoutUrl = "http://localhost:8000/authentication/logout/";
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
                  "Platform untuk Kebutuhan Olahraga Terbaik Anda!",
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
            title: const Text('Create Product'),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const ProductFormPage(),
                ),
              );
            },
          ),

          // Daftar Semua Produk
          ListTile(
            leading: const Icon(Icons.list_alt),
            title: const Text('All Products'),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const ProductListPage(filterByUser: false)),
              );
            },
          ),

          // My Products
          ListTile(
            leading: const Icon(Icons.shopping_bag),
            title: const Text('My Products'),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const ProductListPage(filterByUser: true)),
              );
            },
          ),
        ],
      ),
    );
  }
}