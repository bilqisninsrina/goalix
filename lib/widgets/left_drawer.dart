import 'package:flutter/material.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:goalix/screens/menu.dart';
import 'package:goalix/screens/product_form.dart';
import 'package:goalix/screens/list_product.dart';
import 'package:goalix/screens/login.dart';

class LeftDrawer extends StatelessWidget {
  const LeftDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();

    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(color: Color(0xFF0D47A1)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Football Shop', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white)),
                SizedBox(height: 8),
                Text('Perlengkapan bola terbaik!', style: TextStyle(fontSize: 15, color: Colors.white70)),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home_outlined),
            title: const Text('Halaman Utama'),
            onTap: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const MenuPage())),
          ),
          ListTile(
            leading: const Icon(Icons.shopping_bag_outlined),
            title: const Text('Daftar Produk'),
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const ProductListPage(showAll: true))),
          ),
          ListTile(
            leading: const Icon(Icons.add_circle_outline),
            title: const Text('Tambah Produk'),
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const ProductFormPage())),
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Logout'),
            onTap: () async {
              final String baseUrl = kIsWeb ? "http://127.0.0.1:8000" : "http://10.0.2.2:8000";
              final response = await request.logout("$baseUrl/auth/logout/");
              String message = response["message"];
              if (context.mounted) {
                if (response['status']) {
                  String uname = response["username"] ?? "User";
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("$message Sampai jumpa, $uname.")));
                  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const LoginPage()), (route) => false);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
                }
              }
            },
          ),
        ],
      ),
    );
  }
}