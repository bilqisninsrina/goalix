import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'menu.dart';
import '../widgets/left_drawer.dart';

class ProductFormPage extends StatefulWidget {
  const ProductFormPage({super.key});

  @override
  State<ProductFormPage> createState() => _ProductFormPageState();
}

class _ProductFormPageState extends State<ProductFormPage> {
  final _formKey = GlobalKey<FormState>();
  String _name = '';
  int _price = 0;
  String _description = '';
  String _category = '';
  String _thumbnail = '';
  bool _isFeatured = false;

  final List<String> categories = ['fitness', 'apparel', 'shoes', 'outdoor', 'ball', 'racket', 'accessories', 'supplements', 'others'];

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Tambah Produk Baru'),
        backgroundColor: const Color(0xFF0D47A1),
        foregroundColor: Colors.white,
      ),
      drawer: const LeftDrawer(),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(labelText: 'Nama Produk', border: OutlineInputBorder()),
                onChanged: (v) => _name = v,
                validator: (v) => v!.isEmpty ? 'Nama tidak boleh kosong' : null,
              ),
              const SizedBox(height: 12),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Harga Produk', border: OutlineInputBorder()),
                keyboardType: TextInputType.number,
                onChanged: (v) => _price = int.tryParse(v) ?? 0,
                validator: (v) => v!.isEmpty ? 'Harga wajib diisi' : null,
              ),
              const SizedBox(height: 12),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Deskripsi', border: OutlineInputBorder()),
                maxLines: 3,
                onChanged: (v) => _description = v,
                validator: (v) => v!.isEmpty ? 'Deskripsi wajib diisi' : null,
              ),
              const SizedBox(height: 12),
              DropdownButtonFormField(
                decoration: const InputDecoration(labelText: 'Kategori', border: OutlineInputBorder()),
                items: categories.map((c) => DropdownMenuItem(value: c, child: Text(c))).toList(),
                onChanged: (v) => _category = v.toString(),
                validator: (v) => v == null ? 'Pilih kategori' : null,
              ),
              const SizedBox(height: 12),
              TextFormField(
                decoration: const InputDecoration(labelText: 'URL Thumbnail (opsional)', border: OutlineInputBorder()),
                onChanged: (v) => _thumbnail = v,
              ),
              const SizedBox(height: 12),
              SwitchListTile(
                title: const Text('Tandai sebagai Produk Unggulan'),
                value: _isFeatured,
                onChanged: (val) => setState(() => _isFeatured = val),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF0D47A1), padding: const EdgeInsets.all(16)),
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                      final String baseUrl = kIsWeb ? "http://127.0.0.1:8000" : "http://10.0.2.2:8000";
                      final response = await request.postJson(
                          "$baseUrl/create-flutter/",
                          jsonEncode({
                              'name': _name, 'price': _price, 'description': _description,
                              'category': _category, 'thumbnail': _thumbnail, 'is_featured': _isFeatured,
                              'stock': 10, 'brand': 'Flexora'
                          }),
                      );
                      if (context.mounted) {
                          if (response['status'] == 'success') {
                              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Berhasil menyimpan!")));
                              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const MenuPage()));
                          } else {
                              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Gagal menyimpan.")));
                          }
                      }
                  }
                },
                child: const Text('Save', style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}