// lib/main.dart
import 'package:flutter/material.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';
import 'screens/login.dart'; // Kita akan buat ini nanti

void main() => runApp(const FootballShopApp());

class FootballShopApp extends StatelessWidget {
  const FootballShopApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) {
        CookieRequest request = CookieRequest();
        return request;
      },
      child: MaterialApp(
        title: 'Football Shop',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color(0xFF0D47A1), // Warna biru sesuai tema B-Athletica
            brightness: Brightness.light,
          ),
        ),
        home: const LoginPage(), // Arahkan ke Login dulu
      ),
    );
  }
}