import 'package:flutter/material.dart';

class TextFieldInput extends StatelessWidget {
  const TextFieldInput({
    Key key,
    @required this.hintText,
    @required this.icon,
    this.keyboardType,
  }) : super(key: key);

  final String hintText;
  final Widget icon;
  final TextInputType keyboardType;

  @override
  Widget build(BuildContext context) {
    final widthSize = MediaQuery.of(context).size.width;
    final heightSize = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: widthSize * 0.9,
        height: heightSize * 0.1,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Center(
          child: Theme(
            data: Theme.of(context).copyWith(
              primaryColor: Colors.blue,
            ),
            child: TextField(
              keyboardType:
                  (keyboardType == null) ? TextInputType.name : keyboardType,
              decoration: InputDecoration(
                hintText: hintText,
                border: InputBorder.none,
                contentPadding: EdgeInsets.all(10.0),
                suffixIcon: icon,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
