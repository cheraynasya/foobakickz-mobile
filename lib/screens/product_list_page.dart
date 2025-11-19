import 'package:flutter/material.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';
import 'package:foobakickz_mobile/models/product.dart';
import 'package:foobakickz_mobile/widgets/left_drawer.dart';
import 'package:foobakickz_mobile/widgets/product_card.dart';

class ProductListPage extends StatefulWidget {
  final bool filterByUser;
  const ProductListPage({super.key, this.filterByUser = false});

  @override
  State<ProductListPage> createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {

  Future<List<Product>> fetchProduct(CookieRequest request) async {
    const String baseUrl = 'http://localhost:8000/main/';

    String url;
    if (widget.filterByUser) {
      url = '${baseUrl}json/user/';
    } else {
      url = '${baseUrl}json/';
    }

    final response = await request.get(url);

    List<Product> listProduct = [];

    for (var d in response) {
      if (d != null) {
        listProduct.add(Product.fromJson(d));
      }
    }

    return listProduct;
  }

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.filterByUser ? 'My Products' : 'All Products'),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
      ),
      drawer: const LeftDrawer(),
      body: FutureBuilder(
        future: fetchProduct(request),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else {
            if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Tidak ada data produk.",
                      style: TextStyle(color: Color(0xff59A5D8), fontSize: 20),
                    ),
                    SizedBox(height: 8),
                  ],
                ),
              );
            } else {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (_, index) => ProductCard(
                  product: snapshot.data![index],
                ),
              );
            }
          }
        },
      ),
    );
  }
}