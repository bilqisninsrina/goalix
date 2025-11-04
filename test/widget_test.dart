import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:goalix/main.dart'; // pastikan nama paket sesuai pubspec.yaml kamu

void main() {
  testWidgets('FootballShopApp menampilkan tiga tombol dan snackbar berfungsi',
      (WidgetTester tester) async {
    // Build app dan render frame awal
    await tester.pumpWidget(const FootballShopApp());

    // Pastikan tiga tombol muncul di layar
    expect(find.text('All Products'), findsOneWidget);
    expect(find.text('My Products'), findsOneWidget);
    expect(find.text('Create Product'), findsOneWidget);

    // Tekan tombol "All Products"
    await tester.tap(find.text('All Products'));
    await tester.pump(); // trigger snackbar

    // Verifikasi snackbar muncul
    expect(find.text('Kamu telah menekan tombol All Products'), findsOneWidget);
  });
}
