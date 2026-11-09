import 'package:flutter/material.dart';

class PersonCart extends StatelessWidget {
  final String name;
  PersonCart({@required this.name});

  @override
  Widget build(BuildContext context) {
    final widthSize = MediaQuery.of(context).size.width;
    final heightSize = MediaQuery.of(context).size.height;
    return Container(
      width: widthSize * 0.9,
      height: heightSize * 0.1,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30.0),
      ),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child:
                  Image.asset('assets/images/bottom_nav/profile-selected.png'),
            ),
          ),
          SizedBox(
            width: widthSize * 0.02,
          ),
          RichText(
            text: TextSpan(
                text: 'سفارشات  ',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                ),
                children: [
                  TextSpan(
                    text: '$name',
                    style: TextStyle(color: Colors.blue),
                  ),
                ]),
          ),
        ],
      ),
    );
  }
}
