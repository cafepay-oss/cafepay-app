import 'dart:convert';

import 'package:cafepay/helper/colors.dart';
import 'package:cafepay/helper/utils.dart';
import 'package:cafepay/models/cafe_menu.dart';
import 'package:cafepay/providers/cafe_basket.dart';
import 'package:cafepay/screens/cafe_product.dart';
import 'package:cafepay/widgets/menu_product_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DigitalMenu extends StatefulWidget {
  static const routeName = '/digital_menu';

  @override
  _DigitalMenuState createState() => new _DigitalMenuState();
}

//class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
//  _SliverAppBarDelegate({
//    @required this.minHeight,
//    @required this.maxHeight,
//    @required this.child,
//  });
//
//  final double minHeight;
//  final double maxHeight;
//  final Widget child;
//
//  @override
//  double get minExtent => minHeight;
//
//  @override
//  double get maxExtent => math.max(maxHeight, minHeight);
//
//  @override
//  Widget build(
//      BuildContext context, double shrinkOffset, bool overlapsContent) {
//    return new SizedBox.expand(child: child);
//  }
//
//  @override
//  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
//    return maxHeight != oldDelegate.maxHeight ||
//        minHeight != oldDelegate.minHeight ||
//        child != oldDelegate.child;
//  }
//}

class _DigitalMenuState extends State<DigitalMenu>
    with AutomaticKeepAliveClientMixin {

  final _categoriesPageViewController = PageController();
  var _currentPage = 0;
  List<GlobalKey> categoryTitleKeys;

  Widget buildCategoryTitle(String title, int pageViewIndex) {
    final isSelected = _currentPage == pageViewIndex;
    return GestureDetector(
      onTap: () {
        setState(() {
          _categoriesPageViewController.animateToPage(pageViewIndex,
              duration: Duration(milliseconds: 200), curve: Curves.ease);
        });
      },
      child: Container(
        key: categoryTitleKeys[pageViewIndex],
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(30.0)),
          color: isSelected
              ? AppColors.cafeMenuCategorySelected
              : AppColors.cafeMenuCategoryNotSelected,
        ),
        padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 15.0),
        margin: EdgeInsets.symmetric(vertical: 4.0, horizontal: 3.0),
        child: Text(
          title,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }


  void _onPageViewChange(int page) {
    setState(() {
      Scrollable.ensureVisible(categoryTitleKeys[page].currentContext,
          alignment: 0.7,
          duration: Duration(milliseconds: 500),
          curve: Curves.ease,
      );
      _currentPage = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    final cafeMenu = Provider.of<CafeMenuProvider>(context).cafeMenu;
    final _cafeBasket = Provider.of<CafeBasket>(context);
    final _cafeBasketData = _cafeBasket.totalBasketData;
    categoryTitleKeys = [
      GlobalKey(),
      ...cafeMenu.productsByCategory.map((category) => GlobalKey()),
    ];
    print("digital menu build");
    return Container(
      padding: EdgeInsets.only(top: 6.0),
      color: Colors.white,
      child: Column(
        children: <Widget>[

          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: <Widget>[
                buildCategoryTitle("همه", 0),
                ...cafeMenu.productsByCategory
                    .asMap()
                    .map((index, userTag) => MapEntry(index,
                    buildCategoryTitle(userTag.title, index + 1)))
                    .values
                    .toList(),
              ],
            ),
          ),
          Expanded(
            child: PageView(
              onPageChanged: _onPageViewChange,
              controller: _categoriesPageViewController,
              children: <Widget>[
                CustomScrollView(
                  slivers: <Widget>[
                    SliverList(
                      delegate: SliverChildListDelegate([
                        ...cafeMenu.allProducts
                            .map(
                              (product) => ChangeNotifierProvider.value(
                            value: product,
                            child: MenuProductItem(),
                          ),
                        )
                            .toList()
                      ]),
                    ),
                  ],
                ),
                ...cafeMenu.productsByCategory
                    .asMap()
                    .map((index, userTag) => MapEntry(
                  index,
                  CustomScrollView(
                    slivers: <Widget>[
                      SliverList(
                        delegate:
                        SliverChildListDelegate([
                          ...cafeMenu.productsByCategory[index]
                              .categoryProducts
                              .map(
                                  (product) => ChangeNotifierProvider.value(
                                    value: product,
                                    child: MenuProductItem(),
                                  ),
                                )
                              .toList(),
                        ]),
                      ),
                    ],
                  ),
                ))
                    .values
                    .toList(),
              ],
            ),
          ),
          AnimatedContainer(
            duration: Duration(milliseconds: 100),
            height: _cafeBasketData['count'] > 0 ? 40.0 : 0.0,
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                    height: double.infinity,
                    color: AppColors.tooLightGray,
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                          onTap: () {
                            showBottomSheet(
                                context: context,
                                builder: (context) =>
                                    buildBottomSheet(context));
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Container(
                                height: 30.0,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: AppColors.green,
                                ),
                                margin: const EdgeInsets.only(left: 5.0),
                                padding: const EdgeInsets.fromLTRB(
                                    8.0, 5.0, 8.0, 8.0),
                                child: Center(
                                  child: Text(
                                    toPersianNumber(
                                        _cafeBasketData['count'].toString()),
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                              Text(
                                toPersianPrice(
                                        _cafeBasketData['amount'].toString()),
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 4.0),
                                child: Text(
                                      'تومان',
                                  style: TextStyle(
                                    fontSize: 12.5
                                  ),
                                ),
                              ),
                            ],
                          )),
                    ),
                  ),
                ),
                Container(
                  height: double.infinity,
                  color: AppColors.green,
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                        onTap: () {
                          print('hi');
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(right: 9.0),
                              child: Text(
                                'ثبت در میز سفارش',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Icon(
                              Icons.keyboard_arrow_left,
                              color: Colors.white,
                            )
                          ],
                        )),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;

  Widget buildBottomSheet(BuildContext context) {
    final _cafeBasket = Provider.of<CafeBasket>(context);
    return Container(
      decoration: BoxDecoration(
          color: AppColors.tooLightGray,
          borderRadius: BorderRadius.vertical(top: Radius.circular(30.0)),
          boxShadow: [
            BoxShadow(
              color: Colors.black,
              blurRadius: 3.0,
              spreadRadius: 0.5,
            )
          ]),
      width: double.infinity,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            padding: EdgeInsets.fromLTRB(30.0, 10.0, 30.0, 5.0),
            width: double.infinity,
            child: Column(
              children: <Widget>[
                ..._cafeBasket.items
                    .map((item) => Row(
                          children: <Widget>[
                            Text(item.product.name),
                            Spacer(),
                            Text(toPersianNumber(item.count.toString())),
                          ],
                        ))
                    .toList(),
              ],
            ),
          ),
          Container(
            height: 40.0,
            width: double.infinity,
            child: RaisedButton(
              child: Text(
                'ثبت در میز سفارش',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              onPressed: () {},
              color: AppColors.green,
            ),
          )
        ],
      ),
    );
  }
}
