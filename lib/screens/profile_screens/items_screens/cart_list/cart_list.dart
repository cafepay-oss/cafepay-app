import 'package:cafepay/screens/profile_screens/widgets/Box.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:auto_size_text/auto_size_text.dart';

import 'cart_item.dart';

class CartList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final widthSize = MediaQuery.of(context).size.width;
    final heightSize = MediaQuery.of(context).size.height;
    final bgColor = Colors.grey[200];
    return Scaffold(
      backgroundColor: bgColor,
      appBar: null,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: heightSize * 0.4,
              child: Stack(
                children: [
                  Container(
                    height: heightSize * 0.27,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topRight,
                          end: Alignment.topLeft,
                          colors: [
                            Color(0xff42d5f5),
                            Colors.blue[600],
                          ]),
                    ),
                  ),
                  Positioned(
                    left: widthSize * 0.05,
                    top: heightSize * 0.05,
                    child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.arrow_forward),
                      color: Colors.white,
                    ),
                  ),
                  Positioned(
                    bottom: heightSize * 0.05,
                    right: widthSize * 0.05,
                    child: Box(
                      tilte: 'سفارشات من',
                      picture: Image.asset(
                          'assets/images/profile_screen/shopping-cart.png'),
                      decsription: '۴ سفارش موفق',
                    ),
                  ),
                ],
              ),
            ),
            CartListItem(
              title: 'کافه هدایت',
              picture:
                  Image.asset('assets/images/profile_screen/hedayat_cafe.jpg'),
              description: 'یکشنبه ۱۹ بهمن ۱۳۹۸ ۱۲:۵۴ - 144,000تومان',
            ),
            CartListItem(
              title: 'کافه فردوسی',
              picture:
                  Image.asset('assets/images/profile_screen/hedayat_cafe.jpg'),
              description: 'سه‌شنبه ۲۱ بهمن ۱۳۹۸ ۲۰:۳۳ - 67,000تومان',
            ),
            CartListItem(
              title: 'رستوران باغ‌شاه',
              picture:
                  Image.asset('assets/images/profile_screen/hedayat_cafe.jpg'),
              description: 'جمعه ۱۷ بهمن ۱۳۹۸ ۲۱:۱۰ - 275,000تومان',
            ),
          ],
        ),
      ),
    );
  }
}
