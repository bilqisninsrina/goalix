import 'package:flutter/material.dart';
import '../widgets/left_drawer.dart';

class ProductFormPage extends StatefulWidget {
  const ProductFormPage({super.key});

  @override
  State<ProductFormPage> createState() => _ProductFormPageState();
}

class _ProductFormPageState extends State<ProductFormPage> {
  final _formKey = GlobalKey<FormState>();

  String _name = '';
  String _price = '';
  String _description = '';
  String _category = '';
  String _thumbnail = '';
  bool _isFeatured = false;

  final List<String> categories = ['Sepatu', 'Jersey', 'Bola', 'Aksesoris'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tambah Produk Baru')),
      drawer: const LeftDrawer(),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Name
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Nama Produk',
                ),
                onChanged: (v) => setState(() => _name = v),
                validator: (v) =>
                    (v == null || v.isEmpty) ? 'Nama tidak boleh kosong' : null,
              ),
              const SizedBox(height: 12),

              // Price
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Harga Produk',
                ),
                keyboardType: TextInputType.number,
                onChanged: (v) => setState(() => _price = v),
                validator: (v) {
                  if (v == null || v.isEmpty) return 'Harga wajib diisi';
                  final n = int.tryParse(v);
                  if (n == null || n <= 0) return 'Harga harus angka positif';
                  return null;
                },
              ),
              const SizedBox(height: 12),

              // Description
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Deskripsi Produk',
                ),
                maxLines: 3,
                onChanged: (v) => setState(() => _description = v),
                validator: (v) => (v == null || v.isEmpty)
                    ? 'Deskripsi wajib diisi'
                    : null,
              ),
              const SizedBox(height: 12),

              // Category
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(
                  labelText: 'Kategori',
                ),
                items: categories
                    .map((c) => DropdownMenuItem(value: c, child: Text(c)))
                    .toList(),
                onChanged: (v) => setState(() => _category = v ?? ''),
                validator: (v) =>
                    (v == null || v.isEmpty) ? 'Pilih kategori' : null,
              ),
              const SizedBox(height: 12),

              // Thumbnail URL
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'URL Thumbnail (opsional)',
                ),
                onChanged: (v) => setState(() => _thumbnail = v),
                validator: (v) {
                  if (v == null || v.isEmpty) return null; // optional
                  final uri = Uri.tryParse(v);
                  if (uri == null || uri.isAbsolute == false) {
                    return 'URL tidak valid';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 12),

              // Is Featured
              SwitchListTile(
                title: const Text('Tandai sebagai Produk Unggulan'),
                value: _isFeatured,
                onChanged: (val) => setState(() => _isFeatured = val),
              ),
              const SizedBox(height: 20),

              // Save button
              Align(
                alignment: Alignment.center,
                child: ElevatedButton(
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      showDialog(
                        context: context,
                        builder: (_) => AlertDialog(
                          title: const Text('Produk berhasil disimpan'),
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Nama: $_name'),
                              Text('Harga: $_price'),
                              Text('Deskripsi: $_description'),
                              Text('Kategori: $_category'),
                              Text('Thumbnail: ${_thumbnail.isEmpty ? "-" : _thumbnail}'),
                              Text('Unggulan: ${_isFeatured ? "Ya" : "Tidak"}'),
                            ],
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                                _formKey.currentState!.reset();
                                setState(() {
                                  _name = _price = _description =
                                      _category = _thumbnail = '';
                                  _isFeatured = false;
                                });
                              },
                              child: const Text('OK'),
                            ),
                          ],
                        ),
                      );
                    }
                  },
                  child: const Text('Save',
                      style: TextStyle(color: Colors.white)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}