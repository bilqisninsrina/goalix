// lib/models/product.dart
import 'dart:convert';

List<Product> productFromJson(String str) => List<Product>.from(json.decode(str).map((x) => Product.fromJson(x)));

String productToJson(List<Product> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Product {
    String id;
    String name;
    int price;
    String description;
    String thumbnail;
    String category;
    int stock;
    bool isFeatured;
    String brand;
    int? userId;
    int productViews;

    Product({
        required this.id,
        required this.name,
        required this.price,
        required this.description,
        required this.thumbnail,
        required this.category,
        required this.stock,
        required this.isFeatured,
        required this.brand,
        required this.userId,
        required this.productViews,
    });

    factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        name: json["name"],
        price: json["price"],
        description: json["description"],
        thumbnail: json["thumbnail"] ?? "", // Handle jika kosong
        category: json["category"],
        stock: json["stock"],
        isFeatured: json["is_featured"],
        brand: json["brand"],
        userId: json["user_id"],
        productViews: json["product_views"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "price": price,
        "description": description,
        "thumbnail": thumbnail,
        "category": category,
        "stock": stock,
        "is_featured": isFeatured,
        "brand": brand,
        "user_id": userId,
        "product_views": productViews,
    };
}