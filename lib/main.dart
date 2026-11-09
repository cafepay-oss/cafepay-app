// import 'package:cafepay/helper/http_helper.dart';
import 'package:cafepay/models/cafe_menu.dart';
import 'package:cafepay/providers/cafe_basket.dart';
import 'package:cafepay/screens/cafe_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

import './providers/auth.dart';
import './providers/user_table.dart';
import 'app.dart';
import 'screens/home.dart';
import 'screens/register.dart';

void main() {
  // HttpHelper.initClient();
  debugPaintSizeEnabled = false;
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<CafeMenuProvider>(
          create: (_) => CafeMenuProvider(),
        ),
        ChangeNotifierProvider<CafeBasket>(
          create: (_) => CafeBasket(),
        ),
        ChangeNotifierProvider<Auth>(
          create: (_) => Auth(),
        ),
        ChangeNotifierProxyProvider<Auth, UserTable>(
          create: (_) => UserTable(),
          update: (ctx, auth, userTable) => userTable..authToken = auth.token,
        ),
      ],
      child: Consumer<Auth>(
        builder: (ctx, auth, _) => MaterialApp(
          localizationsDelegates: [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: [
            Locale("fa", "IR"),
          ],
          locale: Locale("fa", "IR"),
          title: 'CafePay',
          theme: ThemeData(
            canvasColor: Colors.transparent,
            primarySwatch: Colors.purple,
            accentColor: Colors.deepOrange,
            fontFamily: 'Vazirmatn',
          ),
          home: App(),
//          initialRoute: BillScreen.routeName,
//          routes: {
//            HomeScreen.routeName: (ctx) => HomeScreen(),
//            RegisterScreen.routeName: (ctx) => RegisterScreen(),
//            CafeTableScreen.routeName: (ctx) => CafeTableScreen(),
//          },
        ),
      ),
    );
  }
}
