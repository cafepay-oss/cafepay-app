import 'package:cafepay/helper/colors.dart';
import 'package:cafepay/helper/exceptions.dart';
import 'package:cafepay/providers/user_table.dart';
import 'package:cafepay/screens/cafe_screens/digital_menu.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';

enum TabItem { menu, info, comments, blog }

Map<TabItem, String> tabName = {
  TabItem.menu: 'منو',
  TabItem.info: 'اطلاعات',
  TabItem.comments: 'دیدگاه ها',
  TabItem.blog: 'اخبار',
};

class CafeMainScreen extends StatefulWidget {
  static const routeName = '/cafe-table';

  @override
  _CafeMainScreenState createState() => new _CafeMainScreenState();
}

class _CafeMainScreenState extends State<CafeMainScreen> {
  var _currentTab = TabItem.menu;
  var _isInit = true;
  var _isLoading = false;
  String _networkError = null;
  UserTable _userTableData;

  void getBill() async {
    setState(() {
      _isLoading = true;
    });
    Provider.of<UserTable>(context).fetchAndSetBill().then((_) {
      setState(() {
        _networkError = null;
        _isLoading = false;
      });
    }).catchError((error) {
      if (error.type == AppExceptionType.FetchDataException) {
        setState(() {
          _networkError = error.toString();
          _isLoading = false;
        });
      }
    });
  }

  @override
  void didChangeDependencies() {
    print("bill screen didChangeDependencies");
    if (_isInit) {
      this.getBill();
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  Widget buildTabItem(BuildContext context, IconData itemIconData,
      String itemText, TabItem pageViewIndex) {
    final isSelected = _currentTab == pageViewIndex;
    return Expanded(
      flex: 1,
      child: GestureDetector(
        onTap: () {
          setState(() {
            _currentTab = pageViewIndex;
          });
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: pageViewIndex == TabItem.menu
                ? BorderRadius.horizontal(right: Radius.circular(100.0))
                : pageViewIndex == TabItem.blog
                ? BorderRadius.horizontal(left: Radius.circular(100.0))
                : null,
            color: isSelected ? AppColors.cafeMenuItemSelected : Colors.white,
          ),
          height: 40.0,
//          width: 70.0,
          child: Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
//                crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Icon(
                  itemIconData,
                  color: isSelected ? Colors.white : Colors.black,
                ),
                isSelected
                    ? Text(
                  itemText,
                  style: TextStyle(
                    color: isSelected ? Colors.white : Colors.black,
                  ),
                )
                    : SizedBox.shrink(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildHeader(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      decoration: BoxDecoration(
        color: AppColors.tooLightGray,
        image: DecorationImage(
            image: AssetImage('assets/images/cafe-bg.jpg'), fit: BoxFit.cover),
      ),
//                  height: 100,
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(30.0, 0.0, 30.0, 30.0),
            child: Row(
              children: <Widget>[
//                Text('bye'),

                Container(
                  width: 60.0,
                  height: 60.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage('assets/images/cafe-sample.jpg'),
                    ),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 8,
                        color: Colors.black26,
                        offset: Offset(0, 2),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 9.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'کافه هدایت',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Row(
                        children: <Widget>[
                          Icon(Icons.star,
                              color: AppColors.starGold, size: 15.0),
                          Icon(Icons.star,
                              color: AppColors.starGold, size: 15.0),
                          Icon(Icons.star,
                              color: AppColors.starGold, size: 15.0),
                          Icon(Icons.star,
                              color: AppColors.starGold, size: 15.0),
                          Icon(Icons.star,
                              color: AppColors.starGold, size: 15.0),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildTopMenu(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10.0,
            spreadRadius: 0.1,
            offset: Offset(2,2),
          ),
        ],
        borderRadius: BorderRadius.circular(100.0),
        color: Colors.white,
      ),
      height: 40.0,
      width: MediaQuery.of(context).size.width * 0.9,
      child: Row(
//                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
//        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          buildTabItem(
            context,
            Icons.restaurant_menu,
            tabName[TabItem.menu],
            TabItem.menu,
          ),
          buildTabItem(
            context,
            Icons.info,
            tabName[TabItem.info],
            TabItem.info,
          ),
          buildTabItem(
            context,
            Icons.comment,
            tabName[TabItem.comments],
            TabItem.comments,
          ),
          buildTabItem(
            context,
            Icons.rss_feed,
            tabName[TabItem.blog],
            TabItem.blog,
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
    return Scaffold(
      appBar: null,
      body: _isLoading
          ? Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'وایسا الان داره سعی می کنه به API وصل بشه :/...',
              textDirection: TextDirection.rtl,
            ),
            CircularProgressIndicator(),
          ],
        ),
      )
          : _networkError != null
          ? GestureDetector(
        onTap: () => getBill(),
        child: Center(
          child: Text(
            'تو کانکت شدن به سرور این ارور رو داد: ' +
                _networkError +
                'click to retry',
          ),
        ),
      )
          : Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              buildHeader(context),
              Expanded(
                child: Container(
                  color: Colors.white,
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Stack(children: <Widget>[
                    Offstage(
                        offstage: _currentTab != TabItem.menu,
                        child: DigitalMenu()
                    ),
                    Offstage(
                      offstage: _currentTab != TabItem.info,
                      child: Center(
                        child: Container(
                          color: Colors.white,
                          child: Text('information'),
                        ),
                      ),
                    ),
                    Offstage(
                      offstage: _currentTab != TabItem.comments,
                      child: Center(
                        child: Container(
                          color: Colors.white,
                          child: Text('comments'),
                        ),
                      ),
                    ),
                    Offstage(
                      offstage: _currentTab != TabItem.blog,
                      child: Center(
                        child: Container(
                          color: Colors.white,
                          child: Text('blog'),
                        ),
                      ),
                    ),
                  ]),
                ),
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.only(top: 95.0),
//                      padding: const EdgeInsets.only(top:100.0),
            child: Align(
              alignment: Alignment.topCenter,
              child: buildTopMenu(context),
            ),
          ),
        ],
      ),
    );
  }
}
