import 'package:flutter/material.dart';

class PictureIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final heightSize = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: heightSize * 0.14,
        height: heightSize * 0.14,
        decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.white),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset('assets/images/bottom_nav/table.png'),
        ),
      ),
    );
  }
}
