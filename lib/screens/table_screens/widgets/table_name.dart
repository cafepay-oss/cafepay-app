import 'package:flutter/material.dart';

class TableName extends StatelessWidget {
  final String name;
  TableName({@required this.name});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 3.0),
      child: Text(
        '$name',
        style: TextStyle(
          fontSize: 18.0,
          color: Colors.white,
        ),
      ),
    );
  }
}
