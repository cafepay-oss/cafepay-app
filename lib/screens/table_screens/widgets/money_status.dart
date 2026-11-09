import 'package:flutter/material.dart';

class MoneyStatus extends StatelessWidget {
  final String money;
  MoneyStatus({@required this.money});
  @override
  Widget build(BuildContext context) {
    final widthSize = MediaQuery.of(context).size.width;
    final heightSize = MediaQuery.of(context).size.height;
    return Container(
      height: heightSize * 0.08,
      width: widthSize * 0.9,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 7,
            offset: Offset(0, 1),
          ),
        ],
      ),
      child: RichText(
        text: TextSpan(
            text: 'پرداخت شده',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
            children: [
              TextSpan(
                  text: '  $money  ', style: TextStyle(color: Colors.green)),
              TextSpan(text: 'تومان از'),
              TextSpan(text: '  ۴۵۵۰۰  ', style: TextStyle(fontSize: 20.0)),
              TextSpan(text: 'تومان'),
            ]),
      ),
    );
  }
}
