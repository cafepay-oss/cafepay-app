import 'package:cafepay/models/product.dart';
import 'package:flutter/foundation.dart';

class CafeBasketItem {
  final Product product;
  int count;

  CafeBasketItem({this.product, this.count = 0});
}

class CafeBasket with ChangeNotifier {
  List<CafeBasketItem> _items = [];

  get totalBasketData {
    var data = {
      'amount': 0,
      'count': 0,
    };
    _items.forEach((cafeBasketItem) {
      data['amount'] += cafeBasketItem.count * cafeBasketItem.product.price;
      data['count'] += cafeBasketItem.count;
    });
    return data;
  }

  get items {
    return [..._items];
  }

  get isEmpty {
    return _items.length == 0;
  }

  int productInBasketCount(Product product) {
    var basketItem =
        _items.firstWhere((item) => item.product.pk == product.pk, orElse: () {
      return null;
    });
    if (basketItem != null) {
      return basketItem.count;
    }
    return 0;
  }

  void addToBasket(Product product) {
    var basketItem =
        _items.firstWhere((item) => item.product.pk == product.pk, orElse: () {
      var newItem = CafeBasketItem(product: product);
      _items.add(newItem);
      return newItem;
    });
    basketItem.count++;
    notifyListeners();
  }

  void removeFromBasket(Product product) {
    var basketItem =
        _items.firstWhere((item) => item.product.pk == product.pk, orElse: () {
      return null;
    });
    if (basketItem != null) {
      basketItem.count--;
      if (basketItem.count <= 0) {
        _items.remove(basketItem);
      }
      notifyListeners();
    }
  }
}
