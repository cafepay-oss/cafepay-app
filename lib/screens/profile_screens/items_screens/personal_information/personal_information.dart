import 'package:cafepay/screens/profile_screens/items_screens/personal_information/text_field_input.dart';
import 'package:cafepay/screens/profile_screens/widgets/Box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PersonalInfoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final widthSize = MediaQuery.of(context).size.width;
    final heightSize = MediaQuery.of(context).size.height;
    final bgColor = Colors.grey[200];
    return Scaffold(
      appBar: null,
      backgroundColor: bgColor,
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
                      tilte: 'اطلاعات کاربری',
                      picture: SvgPicture.asset(
                          'assets/images/profile_screen/user-info-1.svg'),
                      decsription: 'عضویت در: ۶ مهر ۱۳۹۹',
                    ),
                  ),
                ],
              ),
            ),
            TextFieldInput(
              hintText: 'نام',
              icon: Icon(Icons.person),
            ),
            TextFieldInput(
              hintText: ' نام خانوادگی',
              icon: Icon(Icons.person),
            ),
            TextFieldInput(
              hintText: 'شماره تلفن',
              icon: Icon(Icons.phone_android),
              keyboardType: TextInputType.phone,
            ),
            TextFieldInput(
              hintText: 'شماره شبا',
              icon: Icon(Icons.credit_card),
              keyboardType: TextInputType.number,
            ),
            TextFieldInput(
              hintText: 'تاریخ تولد',
              icon: Icon(Icons.cake),
              keyboardType: TextInputType.datetime,
            ),
            SizedBox(
              height: heightSize * 0.01,
            ),
            InkWell(
              onTap: () {},
              child: Container(
                width: widthSize * 0.9,
                height: heightSize * 0.1,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Center(
                  child: Text(
                    'تغییر مشخصات',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
