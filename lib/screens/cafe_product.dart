import 'package:cafepay/helper/colors.dart';
import 'package:cafepay/helper/utils.dart';
import 'package:cafepay/models/bill.dart';
import 'package:cafepay/models/cafe_menu.dart';
import 'package:cafepay/models/product.dart';
import 'package:cafepay/providers/cafe_basket.dart';
import 'package:cafepay/providers/user_table.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CafeProductScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final productPk =
      ModalRoute.of(context).settings.arguments as int; // is the id!
    final _product = Provider.of<CafeMenuProvider>(
      context,
      listen: false,
    ).cafeMenu.findById(productPk);
    final _count =
    Provider.of<CafeBasket>(context).productInBasketCount(_product);
//    final count = toPersianNumber(_billProduct.count.toString());
//    final cartCount = toPersianNumber(_billProduct.cartCount.toString());
//    final cartPrice = toPersianPrice(
//        (_billProduct.cartCount * _billProduct.product.price).toString());
//    final totalPrice = toPersianPrice(_billProduct.totalPrice.toString());
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          Hero(
            tag: 'prodImg' + _product.pk.toString(),
            child: Container(
              width: double.infinity,
              height: 250.0,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/images/cafe-sample.jpg'),
                ),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 8,
                    color: Colors.black26,
                    offset: Offset(0, 2),
                  )
                ],
              ),
            ),
          ),
          Hero(
            tag: 'prodName' + _product.pk.toString(),
            child: Text(
              _product.name,
              style: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold
              ),
            ),
          ),
          Hero(
            tag: 'prodDesc' + _product.pk.toString(),
            child: Text(
              _product.description != null ? _product.description : '',
              style: TextStyle(
                  fontSize: 12.0,
                  color: Colors.black54
              ),
            ),
          ),
//          Row(
//            mainAxisAlignment: MainAxisAlignment.spaceBetween,
//            children: <Widget>[
//
//              Expanded(
//                child: Padding(
//                  padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
//                  child: Column(
//                    crossAxisAlignment: CrossAxisAlignment.start,
//                    children: <Widget>[
//                      Text(
//                        _product.name,
//                        style: TextStyle(
//                            fontSize: 15.0,
//                            fontWeight: FontWeight.bold
//                        ),
//                      ),
//                      Padding(
//                        padding: const EdgeInsets.only(top: 5.0),
//                        child: Text(
//                          _product.description != null ? _product.description : '',
//                          style: TextStyle(
//                              fontSize: 12.0,
//                              color: Colors.black54
//                          ),
//                        ),
//                      ),
//                      Spacer(),
//                      Text(
//                        toPersianPrice(_product.price.toString()) + ' تومان',
//                      )
//                    ],
//                  ),
//                ),
//              ),
//              Padding(
//                padding: const EdgeInsets.all(3.0),
//                child: Column(
//                  mainAxisAlignment: _count > 0
//                      ? MainAxisAlignment.spaceAround
//                      : MainAxisAlignment.center,
//                  children: <Widget>[
//                    GestureDetector(
//                      onTap: () {
//                        Provider.of<CafeBasket>(context, listen: false)
//                            .addToBasket(_product);
//                      },
//                      child: Container(
//                        height: 30.0,
//                        decoration: BoxDecoration(
//                          shape: BoxShape.circle,
//                          color: AppColors.cafeMenuBasketActionsColor,
//                        ),
//                        padding: EdgeInsets.all(3.0),
//                        child: Center(
//                          child: Icon(
//                            Icons.add,
//                            color: Colors.white,
//                            size: 18.0,
//                          ),
//                        ),
//                      ),
//                    ),
//                    AnimatedContainer(
//                      duration: Duration(milliseconds: 10),
//                      height: _count > 0 ? 20.0 : 0,
//                      child: Center(
//                        child: Text(
//                          toPersianNumber(_count.toString()),
//                          style: TextStyle(
//                            color: AppColors.cafeMenuBasketActionsColor,
//                            fontWeight: FontWeight.bold,
//                            fontSize: 17.0,
//                          ),
//                        ),
//                      ),
//                    ),
//                    GestureDetector(
//                      onTap: () {
//                        Provider.of<CafeBasket>(context, listen: false)
//                            .removeFromBasket(_product);
//                      },
//                      child: AnimatedContainer(
//                        duration: Duration(milliseconds: 100),
//                        height: _count > 0 ? 30.0 : 0,
//                        decoration: BoxDecoration(
//                          shape: BoxShape.circle,
//                          color: AppColors.cafeMenuBasketActionsColor,
//                        ),
//                        padding: EdgeInsets.all(3.0),
//                        child: Center(
//                          child: Icon(
//                            Icons.remove,
//                            color: Colors.white,
//                            size: 18.0,
//                          ),
//                        ),
//                      ),
//                    ),
//                  ],
//                ),
//              )
//            ],
//          ),
        ],
      ),
    );
  }
}
