import 'package:flutter/material.dart';
import 'package:foobakickz_mobile/widgets/left_drawer.dart';
import 'package:foobakickz_mobile/screens/menu.dart';
import 'dart:convert';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';

class ProductFormPage extends StatefulWidget {
  const ProductFormPage({super.key});

  @override
  State<ProductFormPage> createState() => _ProductFormPageState();
}

class _ProductFormPageState extends State<ProductFormPage> {
  final _formKey = GlobalKey<FormState>();
  String _name = "";
  double _price = 0.0;
  String _description = "";
  String _thumbnail = "";
  String _category = "Jersey";
  bool _isFeatured = false;

  final List<String> _categories = [
    'Jersey', 'Shoes', 'Ball', 'Accessories',
  ];

  @override
  Widget build(BuildContext context) {
   final request = context.watch<CookieRequest>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Tambah Produk Baru', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.red.shade800,
        foregroundColor: Colors.white,
      ),
      drawer: const LeftDrawer(), // Drawer
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Name
              Padding(
                padding: const EdgeInsets.only(bottom: 15.0),
                child: TextFormField(
                  decoration: const InputDecoration(labelText: "Nama Produk"),
                  onChanged: (value) => setState(() => _name = value ?? ""),
                  validator: (value) {
                    if (value == null || value.isEmpty) return "Nama produk tidak boleh kosong!";
                    if (value.length < 3) return "Nama minimal 3 karakter.";
                    return null;
                  },
                ),
              ),

              // Price
              Padding(
                padding: const EdgeInsets.only(bottom: 15.0),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(labelText: "Harga Produk (Rp)"),
                  onChanged: (value) => setState(() => _price = double.tryParse(value ?? '0') ?? 0.0),
                  validator: (value) {
                    if (value == null || value.isEmpty) return "Harga tidak boleh kosong!";
                    final parsedPrice = double.tryParse(value);
                    if (parsedPrice == null) return "Harga harus berupa angka!";
                    if (parsedPrice <= 0) return "Harga harus positif!";
                    return null;
                  },
                ),
              ),

              // Description
              Padding(
                padding: const EdgeInsets.only(bottom: 15.0),
                child: TextFormField(
                  maxLines: 4,
                  decoration: const InputDecoration(labelText: "Deskripsi Produk"),
                  onChanged: (value) => setState(() => _description = value ?? ""),
                  validator: (value) {
                    if (value == null || value.isEmpty) return "Deskripsi tidak boleh kosong!";
                    if (value.length > 300) return "Deskripsi maksimal 300 karakter.";
                    return null;
                  },
                ),
              ),

              // Category
              Padding(
                padding: const EdgeInsets.only(bottom: 15.0),
                child: DropdownButtonFormField<String>(
                  decoration: const InputDecoration(labelText: "Kategori"),
                  value: _category,
                  items: _categories.map((cat) => DropdownMenuItem(value: cat, child: Text(cat))).toList(),
                  onChanged: (newValue) => setState(() => _category = newValue!),
                ),
              ),

              // Thumbnail
              Padding(
                padding: const EdgeInsets.only(bottom: 15.0),
                child: TextFormField(
                  decoration: const InputDecoration(labelText: "URL Gambar Thumbnail"),
                  onChanged: (value) => setState(() => _thumbnail = value ?? ""),
                  validator: (value) {
                    if (value == null || value.isEmpty) return "URL tidak boleh kosong!";
                    if (!value.startsWith('http')) return "Harap masukkan URL yang valid (diawali http/https)!";
                    return null;
                  },
                ),
              ),

              // Is Featured
              SwitchListTile(
                title: const Text("Tandai sebagai Produk Unggulan"),
                value: _isFeatured,
                onChanged: (value) => setState(() => _isFeatured = value),
              ),

              // Tombol save
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red.shade800,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        // Memunculkan pop-up hasil input
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: const Text('Produk Berhasil Disimpan!'),
                              content: SingleChildScrollView(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Nama: $_name'),
                                    Text('Harga: Rp${_price.toStringAsFixed(0)}'),
                                    Text('Deskripsi: $_description'),
                                    const Divider(),
                                    Text('Kategori: $_category'),
                                    Text('URL: $_thumbnail'),
                                    Text('Unggulan: ${_isFeatured ? "Ya" : "Tidak"}'),
                                  ],
                                ),
                              ),
                              actions: [
                                TextButton(
                                  child: const Text('OK'),
                                  onPressed: () {
                                    Navigator.pop(context);
                                    _formKey.currentState!.reset();
                                    setState(() {
                                      _category = _categories[0];
                                      _isFeatured = false;
                                    });
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      }
                    },
                    child: const Text("Save"),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}