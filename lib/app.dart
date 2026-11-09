import 'package:cafepay/helper/colors.dart';
import 'package:cafepay/navigators/profile_navigator.dart';
import 'package:cafepay/navigators/scan_navigator.dart';
import 'package:cafepay/navigators/table_navigator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class App extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => AppState();
}


enum TabItem { scan, search, table, profile }

Map<TabItem, String> tabName = {
  TabItem.scan: 'scan',
  TabItem.search: 'search',
  TabItem.table: 'table',
  TabItem.profile: 'profile',
};

Map<TabItem, String> tabTitle = {
  TabItem.scan: 'اسکن',
  TabItem.search: 'جست و جو',
  TabItem.table: 'میز سفارش',
  TabItem.profile: 'پروفایل',
};

class AppState extends State<App> {
  TabItem _currentTab = TabItem.scan;
  Map<TabItem, GlobalKey<NavigatorState>> _navigatorKeys = {
    TabItem.scan: GlobalKey(),
    TabItem.search: GlobalKey(),
    TabItem.table: GlobalKey(),
    TabItem.profile: GlobalKey(),
  };

  void _selectTab(TabItem tabItem) {
    if (tabItem == _currentTab) {
      // pop to first route
      _navigatorKeys[tabItem].currentState.popUntil((route) => route.isFirst);
    } else {
      setState(() => _currentTab = tabItem);
    }
  }

  Widget buildTabItem(TabItem tabItem) {
    return Container(
      width: 75.0,
      color: Colors.white,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            _selectTab(tabItem);
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(0.0,3.0,0.0,3.0),
                child: Image(
                  image: AssetImage(
                      tabItem == _currentTab ?
                      'assets/images/bottom_nav/' + tabName[tabItem] + '-selected.png' :
                      'assets/images/bottom_nav/' + tabName[tabItem] + '.png'
                  ),
                  fit: BoxFit.cover,
                  height: 30.0,
                ),
              ),
              Text(
                tabTitle[tabItem],
                textAlign: TextAlign.right,
                style: TextStyle(
                  fontSize: 11.5,
                  color: tabItem == _currentTab ?
                      AppColors.cafeMenuItemSelected :
                      Colors.black87
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final NavigatorState navigator = _navigatorKeys[_currentTab].currentState;
        assert(navigator != null);
        return !await navigator.maybePop();
      },
      child: Scaffold(
        body: Column(
          children: <Widget>[
            Expanded(
              child: Stack(children: <Widget>[
                Offstage(
                  offstage: _currentTab != TabItem.scan,
                  child: ScanNavigator(
                    navigatorKey: _navigatorKeys[TabItem.scan],
                  ),
                ),
                // Offstage(
                //   offstage: _currentTab != TabItem.search,
                //   child: SearchNavigator(
                //     navigatorKey: _navigatorKeys[TabItem.search],
                //   ),
                // ),
                Offstage(
                  offstage: _currentTab != TabItem.table,
                  child: TableNavigator(
                    navigatorKey: _navigatorKeys[TabItem.table],
                  ),
                ),
                Offstage(
                  offstage: _currentTab != TabItem.profile,
                  child: ProfileNavigator(
                    navigatorKey: _navigatorKeys[TabItem.profile],
                  ),
                ),
              ]),
            ),
            Container(
              color: Colors.white,
              height: 55.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  buildTabItem(TabItem.scan),
                  // buildTabItem(TabItem.search),
                  buildTabItem(TabItem.table),
                  buildTabItem(TabItem.profile),
                ],
              ),
            ),
          ],
        ),
//        bottomNavigationBar: BottomNavigation(
//          currentTab: _currentTab,
//          onSelectTab: _selectTab,
//        ),
      ),
    );
  }
}
