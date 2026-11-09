import 'package:flutter/foundation.dart';

class Auth with ChangeNotifier {
  String _token;

  bool get isAuth {
    return token != null;
  }

  String get token {
    return _token;
  }

  Auth() {
    print("creating auth");
  }

  @override
  void dispose() {
    print("disposing auth");
    super.dispose();
  }
}
