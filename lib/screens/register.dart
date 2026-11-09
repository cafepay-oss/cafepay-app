import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  static const routeName = '/register';

  @override
  _RegisterScreenState createState() => new _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  String qr;
  bool camState = true;

  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text('کافه پی'),
          centerTitle: true,
        ),
        body: new Column(children: <Widget>[
          TextField(
            decoration: InputDecoration(
                border: InputBorder.none, hintText: 'شماره همراه'),
            textAlign: TextAlign.right,
          ),
          FlatButton(
            child: Text('تایید'),
            color: Colors.blue,
            textColor: Colors.white,
            onPressed: () {
              print('pressed');
            },
          )
        ]));
  }
}
