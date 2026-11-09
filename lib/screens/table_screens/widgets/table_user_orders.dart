import 'package:cafepay/screens/table_screens/widgets/person_cart.dart';
import 'package:cafepay/screens/table_screens/widgets/table_user_orders_item.dart';
import 'package:flutter/material.dart';

class TableUserOrders extends StatefulWidget {
  //container variables
  @override
  _TableUserOrdersState createState() => _TableUserOrdersState();
}

class _TableUserOrdersState extends State<TableUserOrders> {
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
    return Column(
      children: [
        SizedBox(
          height: heightSize * 0.03,
        ),
        PersonCart(
          name: 'AmirHosein Gharaati',
        ),
        SizedBox(
          height: heightSize * 0.03,
        ),
        //Produc Details
        Column(
          children: [
            TableUserOrdersItem(),
            TableUserOrdersItem(),
            Container(
              width: widthSize * 0.92,
              height: heightSize * 0.06,
              padding: EdgeInsets.only(bottom: 10.0),
              child: SliderTheme(
                data: SliderTheme.of(context).copyWith(
                  trackHeight: 14,
                  inactiveTickMarkColor: Colors.grey[350],
                  activeTickMarkColor: Colors.blue,
                  activeTrackColor: Colors.blue,
                  inactiveTrackColor: Colors.grey[350],
                  thumbColor: Colors.white,
                  thumbShape: RoundSliderThumbShape(enabledThumbRadius: 14),
                ),
                child: Slider(
                  value: wannaPay,
                  onChanged: (newRating) {
                    setState(() {
                      wannaPay = newRating;
                    });
                  },
                  divisions: productMoney ~/ 500,
                  min: 0,
                  max: productMoney.toDouble(),
                  label: wannaPay.toInt().toString(),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
