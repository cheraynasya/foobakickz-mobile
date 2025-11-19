import 'dart:convert';

List<Product> productFromJson(String str) => List<Product>.from(json.decode(str).map((x) => Product.fromJson(x)));

String productToJson(List<Product> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Product {
    String id;
    int userId;
    String name;
    int price;
    String description;
    String thumbnail;
    String category;
    bool isFeatured;
    int stock;
    int views;
    DateTime createdAt;
    String userUsername;

    Product({
        required this.id,
        required this.userId,
        required this.name,
        required this.price,
        required this.description,
        required this.thumbnail,
        required this.category,
        required this.isFeatured,
        required this.stock,
        required this.views,
        required this.createdAt,
        required this.userUsername,
    });

    factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"].toString(),
        userId: json["user_id"],
        name: json["name"],
        price: json["price"],
        description: json["description"],
        thumbnail: json["thumbnail"],
        category: json["category"],
        isFeatured: json["is_featured"],
        stock: json["stock"],
        views: json["views"],
        createdAt: DateTime.parse(json["created_at"]),
        userUsername: json["user_username"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "name": name,
        "price": price,
        "description": description,
        "thumbnail": thumbnail,
        "category": category,
        "is_featured": isFeatured,
        "stock": stock,
        "views": views,
        "created_at": createdAt.toIso8601String(),
        "user_username": userUsername,
    };
}
