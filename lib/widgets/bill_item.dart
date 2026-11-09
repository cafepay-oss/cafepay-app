import 'package:cafepay/helper/colors.dart';
import 'package:cafepay/helper/utils.dart';
import 'package:cafepay/models/bill.dart';
import 'package:cafepay/providers/user_table.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BillItem extends StatelessWidget {
  BillItem();

  @override
  Widget build(BuildContext context) {
    final _billProduct = Provider.of<BillProduct>(context);
    final count = toPersianNumber(_billProduct.count.toString());
    final cartCount = toPersianNumber(_billProduct.cartCount.toString());
    final cartPrice = toPersianPrice(
        (_billProduct.cartCount * _billProduct.product.price).toString());
    final totalPrice = toPersianPrice(_billProduct.totalPrice.toString());
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            blurRadius: 8,
            color: Colors.black26,
            offset: Offset(0, 2),
          )
        ],
      ),
      width: double.infinity,
      margin: const EdgeInsets.fromLTRB(2.0, 10.0, 2.0, 0.0),
      padding: const EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            width: 70.0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        _billProduct.removeFromCart();
                        Provider.of<UserTable>(context, listen: false)
                            .notifyListeners();
                      },
                      child: Icon(
                        Icons.remove,
                        size: 17.0,
                        color: Colors.black87,
                      ),
                    ),
                    Text(
                      cartCount,
                      style: TextStyle(
                        color: AppColors.lightBlue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        _billProduct.addToCart();
                        Provider.of<UserTable>(context, listen: false)
                            .notifyListeners();
                      },
                      child: Icon(
                        Icons.add,
                        size: 17.0,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(right: 2.0),
                      child: Text(
                        'تومان',
                        textAlign: TextAlign.right,
                      ),
                    ),
                    Text(
                      '$cartPrice',
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        color: AppColors.lightBlue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Text(
                _billProduct.product.name,
                textAlign: TextAlign.right,
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'مجموع: $count عدد | $totalPrice تومان',
                textAlign: TextAlign.right,
                style: TextStyle(
                  fontSize: 14.0,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
