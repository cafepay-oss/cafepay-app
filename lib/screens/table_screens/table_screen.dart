import 'package:cafepay/screens/table_screens/widgets/money_status.dart';
import 'package:cafepay/screens/table_screens/widgets/person_cart.dart';
import 'package:cafepay/screens/table_screens/widgets/picture_icon.dart';
import 'package:cafepay/screens/table_screens/widgets/table_name.dart';
import 'package:cafepay/screens/table_screens/widgets/table_user_orders.dart';
import 'package:cafepay/screens/table_screens/widgets/top_title.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TableCafeScreen extends StatefulWidget {
  @override
  _TableCafeScreenState createState() => new _TableCafeScreenState();
}

class _TableCafeScreenState extends State<TableCafeScreen> {

  @override
  Widget build(BuildContext context) {
    final widthSize = MediaQuery.of(context).size.width;
    final heightSize = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: null,
      backgroundColor: Colors.grey[200],
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: heightSize * 0.35,
              child: Stack(
                children: [
                  Container(
                    height: heightSize * 0.3,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.topRight,
                            end: Alignment.topLeft,
                            colors: [Colors.blue[400], Colors.blue[600]])),
                    child: Column(
                      children: [
                        SizedBox(
                          height: heightSize * 0.05,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            PictureIcon(),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                TopTitle(title: 'کارخانه نواوری شیراز'),
                                TableName(
                                  name: 'میز تست',
                                ),
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: 8,
                    right: widthSize * 0.05,
                    child: MoneyStatus(
                      money: '0',
                    ),
                  ),
                ],
              ),
            ),
            TableUserOrders(),
            TableUserOrders(),
          ],
        ),
      ),
    );
  }
}
