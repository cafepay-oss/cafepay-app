import 'package:cafepay/screens/profile_screens/items_screens/charge_wallet/payment_status.dart';
import 'package:cafepay/screens/profile_screens/widgets/Box.dart';
import 'package:flutter/material.dart';

import 'money_amount_suggester.dart';

class ChargeWallet extends StatefulWidget {
  @override
  _ChargeWalletState createState() => _ChargeWalletState();
}

class _ChargeWalletState extends State<ChargeWallet> {
  TextEditingController myController = TextEditingController();

  @override
  void initState() {
    super.initState();

    myController.addListener(checkTextLength);
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

  var payButtonColor = Colors.green[300];
  checkTextLength() {
    setState(() {
      payButtonColor = (myController.text == '')
          ? Colors.green[100]
          : Colors.greenAccent[400];
    });
  }

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
                      tilte: 'موجودی و تراکنش ها',
                      picture: Image.asset(
                          'assets/images/profile_screen/wallet.png'),
                      decsription: 'موجودی: 0 تومان',
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: widthSize * 0.9,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        myController.text = '30000';
                      });
                    },
                    child: MoneyAmoutSuggeter(
                      moneyAmout: '۳۰,۰۰۰',
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        myController.text = '50000';
                      });
                    },
                    child: MoneyAmoutSuggeter(
                      moneyAmout: '۵۰,۰۰۰',
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        myController.text = '100000';
                      });
                    },
                    child: MoneyAmoutSuggeter(
                      moneyAmout: '۱۰۰,۰۰۰',
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: heightSize * 0.05,
            ),
            Container(
              width: widthSize * 0.9,
              height: heightSize * 0.1,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Center(
                child: TextField(
                  controller: myController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: 'مبلغ را وارد کنید',
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.all(10.0),
                    suffixText: 'تومان',
                  ),
                ),
              ),
            ),
            SizedBox(
              height: heightSize * 0.04,
            ),
            InkWell(
              onTap: () {},
              child: Container(
                width: widthSize * 0.9,
                height: heightSize * 0.1,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: payButtonColor,
                ),
                child: Center(
                  child: Text(
                    'پرداخت',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: heightSize * 0.04,
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 10.0),
              width: widthSize * 0.9,
              child: Text(
                'لیست تراکنش ها',
                style: TextStyle(fontSize: 20.0),
              ),
            ),
            SizedBox(
              height: heightSize * 0.01,
            ),
            Column(
              children: [
                PaymentStatus(
                  chargeOfDecharge: '+',
                  amountOfMoney: '۱۲,۰۰۰ تومان',
                  date: 'یک‌شنبه، 6 مهر 1399 22:10',
                ),
                PaymentStatus(
                  chargeOfDecharge: '-',
                  amountOfMoney: '۱۸,۰۰۰ تومان',
                  date: 'شنبه، 2 آذر 1398 22:10',
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
