import 'package:cafepay/helper/colors.dart';
import 'package:cafepay/helper/utils.dart';
import 'package:cafepay/models/bill.dart';
import 'package:cafepay/models/product.dart';
import 'package:cafepay/providers/cafe_basket.dart';
import 'package:cafepay/providers/user_table.dart';
import 'package:cafepay/screens/cafe_product.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MenuProductItem extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final _product = Provider.of<Product>(context);
    final _count =
        Provider.of<CafeBasket>(context).productInBasketCount(_product);
//    final count = toPersianNumber(_billProduct.count.toString());
//    final cartCount = toPersianNumber(_billProduct.cartCount.toString());
//    final cartPrice = toPersianPrice(
//        (_billProduct.cartCount * _billProduct.product.price).toString());
//    final totalPrice = toPersianPrice(_billProduct.totalPrice.toString());
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
      height: 110.0,
      width: double.infinity,
      margin: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            child: GestureDetector(

              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CafeProductScreen(),
                    settings: RouteSettings(
                      arguments: _product.pk,
                    ),
                  ),
                );
              },
              child: Row(
                children: <Widget>[

                  Hero(
                    tag: 'prodImg' + _product.pk.toString(),
                    child: Container(
                      width: 120.0,
                      height: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.horizontal(
                          left: Radius.elliptical(30.0, 70.0),
                          right: Radius.circular(10.0),
                        ),
                        image: DecorationImage(
                          fit: BoxFit.fill,
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
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
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
                          Padding(
                            padding: const EdgeInsets.only(top: 5.0),
                            child: Hero(
                              tag: 'prodDesc' + _product.pk.toString(),
                              child: Text(
                                _product.description != null ? _product.description : '',
                                style: TextStyle(
                                    fontSize: 12.0,
                                    color: Colors.black54
                                ),
                              ),
                            ),
                          ),
                          Spacer(),
                          Text(
                            toPersianPrice(_product.price.toString()) + ' تومان',
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Column(
            mainAxisAlignment: _count > 0
                ? MainAxisAlignment.spaceAround
                : MainAxisAlignment.center,
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  Provider.of<CafeBasket>(context, listen: false)
                      .addToBasket(_product);
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Container(
                    height: 45.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.cafeMenuBasketActionsColor,
                    ),
                    padding: EdgeInsets.all(3.0),
                    child: Center(
                      child: Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 18.0,
                      ),
                    ),
                  ),
                ),
              ),
              AnimatedContainer(
                duration: Duration(milliseconds: 10),
                height: _count > 0 ? 20.0 : 0,
                child: Center(
                  child: Text(
                    toPersianNumber(_count.toString()),
                    style: TextStyle(
                      color: AppColors.cafeMenuBasketActionsColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 17.0,
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Provider.of<CafeBasket>(context, listen: false)
                      .removeFromBasket(_product);
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 100),
                    height: _count > 0 ? 45.0 : 0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.cafeMenuBasketActionsColor,
                    ),
                    padding: EdgeInsets.all(3.0),
                    child: Center(
                      child: Icon(
                        Icons.remove,
                        color: Colors.white,
                        size: 18.0,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
