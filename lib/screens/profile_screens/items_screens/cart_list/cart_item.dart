import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class CartListItem extends StatelessWidget {
  const CartListItem({
    Key key,
    @required this.title,
    @required this.picture,
    @required this.description,
  }) : super(key: key);

  final String title;
  final Widget picture;
  final String description;

  @override
  Widget build(BuildContext context) {
    final widthSize = MediaQuery.of(context).size.width;
    final heightSize = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Column(
        children: [
          Container(
            width: widthSize * 0.9,
            height: heightSize * 0.18,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10.0),
                topRight: Radius.circular(10.0),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Container(
                    height: heightSize * 0.12,
                    padding: EdgeInsets.all(2.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.grey[200]),
                    ),
                    child: picture,
                  ),
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Wrap(
                        direction: Axis.vertical,
                        children: [
                          Text(
                            title,
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(
                            height: heightSize * 0.01,
                          ),
                          Text(
                            description,
                            style: TextStyle(
                              fontSize: 13.0,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: heightSize * 0.07,
            width: widthSize * 0.9,
            child: Row(
              children: [
                InkWell(
                  onTap: () {},
                  child: Container(
                    width: widthSize * 0.45,
                    height: heightSize * 0.07,
                    decoration: BoxDecoration(
                        color: Colors.grey[350],
                        borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(10.0),
                        )),
                    child: Center(
                      child: Text(
                        'جزییات',
                        style: TextStyle(fontSize: 18.0),
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    width: widthSize * 0.45,
                    height: heightSize * 0.07,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(10.0),
                        )),
                    child: Center(
                      child: Text(
                        'ثبت نظر و امتیاز',
                        style: TextStyle(fontSize: 18.0, color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
