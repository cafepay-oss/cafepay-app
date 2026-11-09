import 'package:cafepay/screens/table_screens/widgets/person_cart.dart';
import 'package:flutter/material.dart';

class TableUserOrdersItem extends StatefulWidget {
  //container variables
  @override
  _TableUserOrdersItemState createState() => _TableUserOrdersItemState();
}

class _TableUserOrdersItemState extends State<TableUserOrdersItem> {
  double wannaPay = 0.0;

  final int productMoney = 3500;

  final String foodName = 'ماست موسیر';

  final int numberOfProduct = 1;

  final int paid = 0;

  final int yourPaid = 0;

  @override
  Widget build(BuildContext context) {
    final widthSize = MediaQuery.of(context).size.width;
    final heightSize = MediaQuery.of(context).size.height;
    return Container(
      height: heightSize * 0.22,
      width: widthSize * 0.8,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10.0), topRight: Radius.circular(10.0)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '$foodName',
              style: TextStyle(
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(
              height: heightSize * 0.001,
            ),
            Text(
              'مجموع  $numberOfProduct  عدد | 6000 تومان',
              style: TextStyle(
                fontSize: 13.0,
              ),
            ),
            SizedBox(
              height: heightSize * 0.001,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RichText(
                  text: TextSpan(
                      text: 'پرداخت شده:',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                      children: [
                        TextSpan(
                          text: ' $paid ',
                          style: TextStyle(
                            color: Colors.green,
                          ),
                        ),
                        TextSpan(text: 'تومان'),
                      ]),
                ),
                RichText(
                  text: TextSpan(
                      text: 'پرداخت شما:',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                      children: [
                        TextSpan(
                          text: ' $yourPaid ',
                          style: TextStyle(
                            color: Colors.blue,
                          ),
                        ),
                        TextSpan(text: 'تومان'),
                      ]),
                ),
              ],
            ),
            SizedBox(
              height: heightSize * 0.001,
            ),
            RichText(
              text: TextSpan(
                  text: wannaPay.toInt().toString() + '  ',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                  children: [
                    TextSpan(
                      text: 'تومان از این محصول را میخواهید پرداخت کنید',
                    ),
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}
