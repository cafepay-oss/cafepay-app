import 'package:flutter/material.dart';

class PaymentStatus extends StatelessWidget {
  const PaymentStatus({
    Key key,
    @required this.chargeOfDecharge,
    @required this.amountOfMoney,
    @required this.date,
  }) : super(key: key);

  final String chargeOfDecharge;
  final String amountOfMoney;
  final String date;

  @override
  Widget build(BuildContext context) {
    final widthSize = MediaQuery.of(context).size.width;
    final heightSize = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        width: widthSize * 0.9,
        height: heightSize * 0.15,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                text: TextSpan(
                  text: (chargeOfDecharge == '+')
                      ? 'افزایش موجودی - '
                      : 'کسر از موجودی - ',
                  style: TextStyle(
                    fontSize: 20.0,
                    color:
                        (chargeOfDecharge == '+') ? Colors.green : Colors.blue,
                  ),
                  children: [
                    TextSpan(
                      text: amountOfMoney,
                      style: TextStyle(color: Colors.black),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: heightSize * 0.01,
              ),
              Text(
                date,
                style: TextStyle(fontSize: 16.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
