import 'package:flutter/material.dart';

class ProfileScreenButton extends StatelessWidget {
  const ProfileScreenButton({
    Key key,
    @required this.picture,
    @required this.iconText,
    @required this.onPress,
  }) : super(key: key);

  final Widget picture;
  final String iconText;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    final widthSize = MediaQuery.of(context).size.width;
    final heightSize = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        width: widthSize * 10 / 11,
        height: heightSize * 0.08,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10.0),
          child: RaisedButton(
            onPressed: onPress,
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 5.0),
                  width: widthSize * 0.1,
                  height: heightSize * 0.1,
                  child: picture,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    iconText,
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
