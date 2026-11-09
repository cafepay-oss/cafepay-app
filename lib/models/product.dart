import 'package:flutter/cupertino.dart';

class Product with ChangeNotifier {
  final int pk;
  final String name;
  final String description;
  final int price;

  Product({this.pk, this.name, this.description, this.price});

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      pk: json['pk'],
      name: json['name'],
      description: json['description'],
      price: json['price'],
    );
  }
}
