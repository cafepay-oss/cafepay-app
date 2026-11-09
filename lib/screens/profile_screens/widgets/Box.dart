import 'package:flutter/material.dart';

class Box extends StatelessWidget {
  const Box({
    Key key,
    this.pocketMoney,
    @required this.tilte,
    @required this.picture,
    @required this.decsription,
  }) : super(key: key);

  final int pocketMoney;
  final String tilte;
  final Widget picture;
  final String decsription;

  @override
  Widget build(BuildContext context) {
    final widthSize = MediaQuery.of(context).size.width;
    final heightSize = MediaQuery.of(context).size.height;
    return Container(
      height: heightSize * 0.18,
      width: widthSize * 0.9,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 4,
            blurRadius: 7,
            offset: Offset(0, 2),
          ),
        ],
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(10),
              width: widthSize * 0.18,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.grey[200]),
              ),
              child: picture,
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "$tilte",
                    style: TextStyle(
                      fontSize: 20.0,
                    ),
                  ),
                  SizedBox(
                    height: heightSize * 0.01,
                  ),
                  Text(
                    decsription,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                    ),
                  ),
                  /*RichText(
                    text: TextSpan(
                      text: "موجودی:",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                      ),
                      children: [
                        TextSpan(
                            text: "  $pocketMoney  ",
                            style: TextStyle(color: Colors.blue)),
                        TextSpan(
                            text: "تومان",
                            style: TextStyle(color: Colors.grey[600])),
                      ],
                    ),
                  ),*/
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
