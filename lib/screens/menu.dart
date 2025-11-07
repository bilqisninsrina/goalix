import 'package:flutter/material.dart';
import '../widgets/left_drawer.dart';
import 'product_form.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  void _snack(BuildContext ctx, String msg) {
    ScaffoldMessenger.of(ctx)
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text(msg)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Football Shop')),
      drawer: const LeftDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton.icon(
              onPressed: () => _snack(context, 'Kamu menekan All Products'),
              icon: const Icon(Icons.storefront),
              label: const Text('All Products'),
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue, foregroundColor: Colors.white),
            ),
            const SizedBox(height: 12),
            ElevatedButton.icon(
              onPressed: () => _snack(context, 'Kamu menekan My Products'),
              icon: const Icon(Icons.inventory_2),
              label: const Text('My Products'),
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green, foregroundColor: Colors.white),
            ),
            const SizedBox(height: 12),
            ElevatedButton.icon(
              onPressed: () {
                // pakai push agar bisa kembali ke menu
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const ProductFormPage()),
                );
              },
              icon: const Icon(Icons.add_circle),
              label: const Text('Create Product'),
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red, foregroundColor: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
