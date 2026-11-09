import 'dart:convert';
import 'dart:io';

import 'package:cafepay/helper/exceptions.dart';
import 'package:cafepay/helper/app_config.dart';
import 'package:cafepay/models/bill.dart';
import 'package:cafepay/models/product.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class CafeMenuCategory with ChangeNotifier {
  final int pk;
  final String title;
  final List<Product> categoryProducts;

  CafeMenuCategory({this.pk, this.title, this.categoryProducts});

  factory CafeMenuCategory.fromJson(Map<String, dynamic> json) {
    return CafeMenuCategory(
      pk: json['pk'],
      title: json['title'],
      categoryProducts: (json['category_products'] as List<dynamic>)
          .map(
            (categoryProductJson) => Product.fromJson(
              categoryProductJson,
            ),
          )
          .toList(),
    );
  }
}

class CafeMenu with ChangeNotifier{
  final int pk;
  final String name;
  final List<CafeMenuCategory> productsByCategory;

  CafeMenu({this.pk, this.name, this.productsByCategory});
  List<Product> get allProducts {
    return [
      for (var i = 0; i < productsByCategory.length; i++)
        ...productsByCategory[i].categoryProducts
    ];
  }

  Product findById(int pk) {
    return allProducts.firstWhere((prod) => prod.pk == pk);
  }

  factory CafeMenu.fromJson(Map<String, dynamic> json) {
    return CafeMenu(
      pk: json['pk'],
      name: json['name'],
      productsByCategory: (json['products_by_category'] as List<dynamic>)
          .map(
            (productsByCategoryJson) => CafeMenuCategory.fromJson(
              productsByCategoryJson,
            ),
          )
          .toList(),
    );
  }
}


class CafeMenuProvider with ChangeNotifier {

  CafeMenu cafeMenu = CafeMenu.fromJson(json.decode(
      '[{"pk":1,"name":"منو بهاره","is_active":true,"staff":1,"products_by_category":[{"pk":1,"title":"نوشیدنی","cafe":1,"staff":5,"category_products":[{"pk":2,"name":"موهیتو","description":null,"price":18000,"staff":5,"is_delete":false}]},{"pk":2,"title":"پیتزا","cafe":1,"staff":5,"category_products":[{"pk":7,"name":"مخصوص علی","description":"مخصوص علی ولی برای همه","price":40000,"staff":5,"is_delete":false},{"pk":3,"name":"پپرونی","description":null,"price":35000,"staff":5,"is_delete":false}]},{"pk":3,"title":"برگر","cafe":1,"staff":5,"category_products":[{"pk":6,"name":"دوبل برگر","description":"دوبل برگر به اون میگن","price":32000,"staff":4,"is_delete":false},{"pk":4,"name":"چیزبرگر","description":"چیزبرگر به این میگن","price":28000,"staff":5,"is_delete":false}]},{"pk":4,"title":"ایرانی","cafe":1,"staff":3,"category_products":[{"pk":5,"name":"حلیم بادمجون","description":"حلیم بادمجون به این میگن جون بابا","price":12000,"staff":3,"is_delete":false}]},{"pk":5,"title":"سالاد","cafe":1,"staff":5,"category_products":[{"pk":8,"name":"سزار","description":"سالاد سزارمون حرف نداره","price":22000,"staff":5,"is_delete":false}]}]}]')[0]);


}