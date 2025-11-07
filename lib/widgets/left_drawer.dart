import 'package:flutter/material.dart';
import '../screens/menu.dart';
import '../screens/product_form.dart';

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
                Text('Football Shop',
                    style: TextStyle(fontSize: 24, color: Colors.white)),
                SizedBox(height: 6),
                Text('Perlengkapan bola terbaik!',
                    style: TextStyle(color: Colors.white70)),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Halaman Utama'),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => const MenuPage()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.add_circle),
            title: const Text('Tambah Produk'),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => const ProductFormPage()),
              );
            },
          ),
        ],
      ),
    );
  }
}
