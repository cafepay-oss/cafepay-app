import 'package:flutter/material.dart';

class TopTitle extends StatelessWidget {
  final String title;
  TopTitle({this.title});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 3.0, bottom: 8.0),
      child: Text("$title",
          style: TextStyle(
            fontSize: 18.0,
            color: Colors.white,
          )),
    );
  }
}
