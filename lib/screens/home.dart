import 'package:flutter/material.dart';
import 'package:qr_mobile_vision/qr_camera.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/home';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String qr;
  bool camState = true;
  bool useCamera = true;

  @override
  initState() {
    super.initState();
  }

  Widget buildCodeInput(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
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
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    print('home build');
    return Scaffold(
      appBar: AppBar(
        title: Text('کافه پیdd'),
        centerTitle: true,
      ),
      body: useCamera && camState
          ? Column(children: <Widget>[
              SizedBox(
                width: double.infinity,
                height: 300.0,
                child: QrCamera(
                  onError: (context, error) => Text(
                    error.toString(),
                    style: TextStyle(color: Colors.red),
                  ),
                  qrCodeCallback: (code) {
                    print(code);
                    setState(() {
                      qr = code;
                      print(qr);
                    });
                  },
                  child: Column(children: <Widget>[
                    Spacer(),
                    buildCodeInput(context),
                  ]),
                ),
              ),
            ])
          : buildCodeInput(context),
    );
  }
}
