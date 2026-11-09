import 'package:cafepay/screens/cafe_product.dart';
import 'package:cafepay/screens/cafe_screen.dart';
import 'package:flutter/material.dart';

class TabNavigatorRoutes {
  static const String root = '/';
  static const String product = '/product';
}

class ScanNavigator extends StatelessWidget {
  ScanNavigator({this.navigatorKey});
  final GlobalKey<NavigatorState> navigatorKey;


  Map<String, WidgetBuilder> _routeBuilders(BuildContext context,
      {int productPK: 500}) {
    return {
      TabNavigatorRoutes.root: (context) => CafeMainScreen(),
      TabNavigatorRoutes.product: (context) => CafeProductScreen(),
    };
  }

  @override
  Widget build(BuildContext context) {
    final routeBuilders = _routeBuilders(context);
    return Navigator(
      key: navigatorKey,
      initialRoute: TabNavigatorRoutes.root,
      onGenerateRoute: (routeSettings) {
        return MaterialPageRoute(
          builder: (context) => routeBuilders[routeSettings.name](context),
        );
      },
      observers: [HeroController()],
    );
  }
}
