import 'package:cafepay/helper/colors.dart';
import 'package:cafepay/helper/utils.dart';
import 'package:cafepay/providers/user_table.dart';
import 'package:cafepay/widgets/bill_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:provider/provider.dart';

class BillScreen extends StatefulWidget {
  static const routeName = '/bill';

  @override
  _BillScreenState createState() => new _BillScreenState();
}

class _BillScreenState extends State<BillScreen>
    with AutomaticKeepAliveClientMixin {
  UserTable _userTableData;

  Widget buildPayButton(BuildContext context) {
    return Container(
      width: double.infinity,
      color: AppColors.lightGreen,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            print("hi");
          },
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Text(
                    'پرداخت فاکتور',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17.0,
                      color: Colors.white,
                    ),
                  ),
                ),
                Icon(
                  Icons.payment,
                  color: Colors.white,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildBillFooter(BuildContext context) {
    final totalCartAmount =
        toPersianPrice(_userTableData.totalCartAmount.toString());
    return Container(
      width: double.infinity,
      color: AppColors.lightGray,
      padding: const EdgeInsets.fromLTRB(5.0, 0.0, 15.0, 0.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Checkbox(
                onChanged: null,
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                checkColor: Colors.green,
                activeColor: Colors.white,
                tristate: false,
                value: false,
              ),
              Text(
                'پرداخت کل فاکتور',
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 13.0,
                ),
              ),
            ],
          ),
          RichText(
            text: TextSpan(
              text: 'مجموع پرداخت: ',
              style: TextStyle(
                color: Colors.black87,
                fontSize: 13.0,
              ),
              children: <TextSpan>[
                TextSpan(
                  text: totalCartAmount,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold,
                  ),
//                    recognizer: _longPressRecognizer,
                ),
                TextSpan(text: ' تومان'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildPaymentProgress(BuildContext context) {
    final payedAmount = 5000;
    final totalAmount = _userTableData.currentBill.totalAmount;
    final payedAmountPersan = toPersianPrice(payedAmount.toString());
    final totalAmountPersan = toPersianPrice(totalAmount.toString());
    final payedProgressAmount = ((payedAmount / totalAmount) * 100).floor();
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        children: <Widget>[
          Text(
            ' از $totalAmountPersan تومان',
            textDirection: TextDirection.rtl,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: Text(
              '$payedAmountPersan',
              textDirection: TextDirection.rtl,
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 100 - payedProgressAmount,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.horizontal(left: Radius.circular(20.0)),
                      color: AppColors.tooLightGray,
                    ),
                    height: 20,
                    child: null,
                  ),
                ),
                Expanded(
                  flex: payedProgressAmount,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.horizontal(right: Radius.circular(20.0)),
                      color: AppColors.lightGreen,
                    ),
                    height: 20,
                    child: null,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    print("bill screen build");
    _userTableData = Provider.of<UserTable>(context);
//    print(userTableData);
    return Container(
      color: Colors.white,
      child: Column(
        children: <Widget>[
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 15.0, vertical: 15.0),
                child: Column(
                  children: <Widget>[
                    buildPaymentProgress(context),
                    ..._userTableData.currentBill.billProducts
                        .map(
                          (billProduct) => ChangeNotifierProvider.value(
                            value: billProduct,
                            child: BillItem(),
                          ),
                        )
                        .toList(),
                    ..._userTableData.currentBill.billProducts
                        .map(
                          (billProduct) => ChangeNotifierProvider.value(
                            value: billProduct,
                            child: BillItem(),
                          ),
                        )
                        .toList(),
                    ..._userTableData.currentBill.billProducts
                        .map(
                          (billProduct) => ChangeNotifierProvider.value(
                            value: billProduct,
                            child: BillItem(),
                          ),
                        )
                        .toList(),
                    ..._userTableData.currentBill.billProducts
                        .map(
                          (billProduct) => ChangeNotifierProvider.value(
                            value: billProduct,
                            child: BillItem(),
                          ),
                        )
                        .toList(),
                    ..._userTableData.currentBill.billProducts
                        .map(
                          (billProduct) => ChangeNotifierProvider.value(
                            value: billProduct,
                            child: BillItem(),
                          ),
                        )
                        .toList(),
                  ],
                ),
              ),
            ),
          ),
          buildBillFooter(context),
          buildPayButton(context),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
