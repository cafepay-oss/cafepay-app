import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'items_screens/cart_list/cart_list.dart';
import 'items_screens/charge_wallet/charge_wallet.dart';
import 'items_screens/personal_information/personal_information.dart';
import 'widgets/Box.dart';
import 'widgets/Button.dart';

class ProfileMainScreen extends StatefulWidget {
  @override
  _ProfileMainScreenState createState() => new _ProfileMainScreenState();
}

class _ProfileMainScreenState extends State<ProfileMainScreen> {
  @override
  Widget build(BuildContext context) {
    final widthSize = MediaQuery.of(context).size.width;
    final heightSize = MediaQuery.of(context).size.height;
    final pocketMoney = 0;
    final bgColor = Colors.grey[200];

    return Scaffold(
      backgroundColor: bgColor,
      appBar: null,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: heightSize * 0.35,
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
                    bottom: 0,
                    right: widthSize * 0.05,
                    child: Box(
                      tilte: 'AmirHosein Gharaati',
                      decsription: 'موجودی ۰ تومان',
                      picture:
                          Image.asset('assets/images/bottom_nav/profile.png'),
                    ),
                  ),
                ],
              ),
            ),
            Column(
              children: [
                SizedBox(
                  height: heightSize * 0.05,
                ),
                ProfileScreenButton(
                  picture: Image.asset(
                      'assets/images/profile_screen/shopping-cart.png'),
                  iconText: "لیست سفارشات",
                  onPress: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CartList()),
                    );
                  },
                ),
                ProfileScreenButton(
                  picture:
                      Image.asset('assets/images/profile_screen/wallet.png'),
                  iconText: "افزایش موجودی",
                  onPress: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ChargeWallet()),
                    );
                  },
                ),
                ProfileScreenButton(
                  picture: SvgPicture.asset(
                      'assets/images/profile_screen/user-info-1.svg'),
                  iconText: "اطلاعات کاربری",
                  onPress: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PersonalInfoScreen()),
                    );
                  },
                ),
                ProfileScreenButton(
                  picture: SvgPicture.asset(
                      'assets/images/profile_screen/remote-assistance.svg'),
                  iconText: "پشتیبانی",
                  onPress: () {},
                ),
                ProfileScreenButton(
                  picture:
                      SvgPicture.asset('assets/images/profile_screen/love.svg'),
                  iconText: "مورد علاقه ها",
                  onPress: () {},
                ),
                ProfileScreenButton(
                  picture:
                      Image.asset('assets/images/profile_screen/logo-icon.png'),
                  iconText: "کافه پی",
                  onPress: () {},
                ),
                ProfileScreenButton(
                  picture: SvgPicture.asset(
                      'assets/images/profile_screen/logout.svg'),
                  iconText: "خروج از حساب کاربری",
                  onPress: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
