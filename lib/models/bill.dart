import 'package:cafepay/models/product.dart';
import 'package:flutter/foundation.dart';

class BillProduct with ChangeNotifier {
  final Product product;
  int cartCount = 0;
  final int count;
  final int totalPrice;

  void addToCart() {
    if (this.cartCount < count) {
      this.cartCount++;
      notifyListeners();
    }
  }

  void removeFromCart() {
    if (this.cartCount > 0) {
      this.cartCount--;
      notifyListeners();
    }
  }

  BillProduct({this.product, this.count, this.totalPrice});

  factory BillProduct.fromJson(Map<String, dynamic> json) {
    return BillProduct(
      product: Product.fromJson(json['product']),
      count: json['count'],
      totalPrice: json['total price'],
    );
  }
}

class Table {
  final int pk;
  final int number;

  Table({this.pk, this.number});

  factory Table.fromJson(Map<String, dynamic> json) {
    return Table(
      pk: json['pk'],
      number: json['number'],
    );
  }
}

class Bill {
  final int pk;
  final List<Table> tables;

  final List<BillProduct> billProducts;
  final int totalAmount;
  final int payedAmount;

  // final int refundAmount;
  // final int netAmount;
  // final bool isClosed;

  // Bill({this.pk = 1, this.tables, this.billProducts, this.payedAmount, this.refundAmount, this.netAmount, this.isClosed, this.totalAmount});
  Bill(
      {this.pk,
      this.billProducts,
      this.totalAmount,
      this.payedAmount,
      this.tables});

  factory Bill.fromJson(Map<String, dynamic> json) {
    return Bill(
      pk: json['pk'],
      totalAmount: json['total_amount'],
      payedAmount: json['payed_amount'],
      tables: (json['tables'] as List<dynamic>)
          .map(
            (tableJson) => Table.fromJson(
              tableJson,
            ),
          )
          .toList(),
      billProducts: (json['bill_products'] as List<dynamic>)
          .map(
            (billProductJson) => BillProduct.fromJson(
              billProductJson,
            ),
          )
          .toList(),
    );
  }
}
