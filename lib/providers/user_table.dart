import 'dart:convert';
import 'dart:io';
import 'dart:async';

import 'package:cafepay/helper/exceptions.dart';
import 'package:cafepay/helper/app_config.dart';
import 'package:cafepay/models/bill.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class UserTable with ChangeNotifier {
  var _tableCode = "1"; // hardcoded
  String _authToken;

  set authToken(String value) {
    _authToken = value;
    notifyListeners();
  }

  Bill _currentBill;

  UserTable() {
    print("creating user table");
  }

  Bill get currentBill {
    return _currentBill;
  }

  int get totalCartAmount {
    int amount = 0;
    _currentBill.billProducts.forEach((billProduct) {
      amount += billProduct.cartCount * billProduct.product.price;
    });
    return amount;
  }

  Future<void> fetchAndSetBill() async {
    try {
      print("fetchAndSetBill");
      /*
      final response = await http.get(
          AppConfig.hostUrl + '/api/v1/join/simple/$_tableCode/?format=json');
      _currentBill =
          Bill.fromJson(json.decode(utf8.decode(response.bodyBytes)));
      print("fetchAndSetBill response");
       */

      //hardcoded
      await Future.delayed(const Duration(seconds: 1), () =>
      _currentBill =
          Bill.fromJson(json.decode('{"pk":1,"cafe":{"pk":1,"name":"کافه هدایت"},"tables":[{"pk":1,"number":1}],"bill_products":[{"product":{"pk":1,"cafe":{"pk":1,"name":"کافه هدایت"},"name":"اسپرسو","description":"یک قهوه خوشمزه","price":12000,"category_retrieve":null,"menu_retrieve":[{"pk":1,"name":"منو بهاره"},{"pk":2,"name":"منو تابستانه"}],"staff":1,"is_delete":false,"images":[]},"count":1,"total price":12000}],"total_amount":12000,"payed_amount":0,"refund_amount":0,"net_amount":0,"is_closed":false}'))
      );

      notifyListeners();
    } on SocketException catch (e) {
//      print("hiiii");
      throw FetchDataException(e.toString());
    }
  }

  @override
  void dispose() {
    print("disposing user table");
    super.dispose();
  }
}
