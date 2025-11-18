// lib/screens/product_detail.dart
import 'package:flutter/material.dart';
import 'package:goalix/models/product.dart';

class ProductDetailPage extends StatelessWidget {
  final Product product;

  const ProductDetailPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(product.name)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (product.thumbnail.isNotEmpty)
              Center(child: Image.network(product.thumbnail, height: 200, errorBuilder: (_,__,___) => const Icon(Icons.broken_image))),
            const SizedBox(height: 20),
            Text(product.name, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Text("Price: Rp ${product.price}", style: const TextStyle(fontSize: 18, color: Colors.green)),
            const SizedBox(height: 10),
            Text("Brand: ${product.brand}"),
            Text("Category: ${product.category}"),
            Text("Stock: ${product.stock}"),
            Text("Views: ${product.productViews}"),
            Text("Featured: ${product.isFeatured ? 'Yes' : 'No'}"),
            const SizedBox(height: 20),
            const Text("Description:", style: TextStyle(fontWeight: FontWeight.bold)),
            Text(product.description),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Kembali ke Daftar'),
            ),
          ],
        ),
      ),
    );
  }
}