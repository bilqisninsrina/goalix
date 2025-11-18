import 'package:flutter/material.dart';
import 'package:goalix/models/product.dart';
import 'package:goalix/widgets/left_drawer.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'product_detail.dart';

class ProductListPage extends StatefulWidget {
  final bool showAll;
  const ProductListPage({super.key, required this.showAll});

  @override
  State<ProductListPage> createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {
  Future<List<Product>> fetchProduct(CookieRequest request) async {
    final String baseUrl = kIsWeb ? "http://127.0.0.1:8000" : "http://10.0.2.2:8000";
    String url = '$baseUrl/json/';

    // LOGIKA FILTER di sisi Flutter
    if (!widget.showAll) {
      url += '?filter_user=true';
    }

    final response = await request.get(url);
    var data = response;
    
    List<Product> listProduct = [];
    for (var d in data) {
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
        title: Text(widget.showAll ? 'All Products' : 'My Products'),
        backgroundColor: const Color(0xFF0D47A1),
        foregroundColor: Colors.white,
      ),
      drawer: const LeftDrawer(),
      body: FutureBuilder(
        future: fetchProduct(request),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.data == null) {
            return const Center(child: CircularProgressIndicator());
          } else {
            if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Center(child: Text("Tidak ada data produk.", style: TextStyle(fontSize: 20)));
            } else {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (_, index) {
                  Product product = snapshot.data![index];
                  return InkWell(
                    onTap: () {
                        Navigator.push(context, MaterialPageRoute(
                            builder: (context) => ProductDetailPage(product: product)
                        ));
                    },
                    child: Card(
                      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(product.name, style: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
                            const SizedBox(height: 10),
                            Text("Price: Rp ${product.price}"),
                            const SizedBox(height: 10),
                            Text("Category: ${product.category}"),
                            if (product.isFeatured)
                                const Text("Featured", style: TextStyle(color: Colors.amber, fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            }
          }
        },
      ),
    );
  }
}