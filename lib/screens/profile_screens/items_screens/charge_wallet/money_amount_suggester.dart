import 'package:flutter/material.dart';

class MoneyAmoutSuggeter extends StatelessWidget {
  const MoneyAmoutSuggeter({
    @required this.moneyAmout,
    Key key,
  }) : super(key: key);

  final String moneyAmout;

  @override
  Widget build(BuildContext context) {
    final widthSize = MediaQuery.of(context).size.width;
    final heightSize = MediaQuery.of(context).size.height;
    return Container(
      width: widthSize * 0.28,
      height: heightSize * 0.08,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Center(
        child: RichText(
          text: TextSpan(
              text: moneyAmout,
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.blue,
                fontWeight: FontWeight.w500,
              ),
              children: [
                TextSpan(
                    text: ' تومان',
                    style: TextStyle(
                      color: Colors.grey[600],
                    ))
              ]),
        ),
      ),
    );
  }
}
