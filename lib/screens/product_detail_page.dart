import 'package:flutter/material.dart';
import 'package:foobakickz_mobile/models/product.dart';

class ProductDetailPage extends StatelessWidget {
  final Product product;

  const ProductDetailPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.name),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Gambar
             Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  'http://localhost:8000/proxy-image/?url=${Uri.encodeComponent(product.thumbnail)}',
                  height: 200,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Container(
                    height: 200, width: double.infinity, color: Colors.grey[300], child: const Icon(Icons.broken_image)
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Detail Text
            Text(product.name, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Text("Price: Rp ${product.price}", style: const TextStyle(fontSize: 18, color: Colors.green)),
            const SizedBox(height: 10),
            Text("Description: ${product.description}"),
            const SizedBox(height: 10),
            Text("Category: ${product.category}"),
            const SizedBox(height: 10),
            Text("Stock: ${product.stock}"),
            const SizedBox(height: 10),
            Text("Views: ${product.views}"),
            const SizedBox(height: 10),
            Text("Uploaded by: ${product.userUsername}"),

            const SizedBox(height: 30),

            Center(
              child: ElevatedButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Back to List'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}