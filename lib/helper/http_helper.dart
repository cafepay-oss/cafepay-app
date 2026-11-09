import 'dart:io';

import 'package:http/io_client.dart';

class HttpHelper {
  static IOClient myHttpClient;

  static void initClient() {
    // Use system routing and normal certificate verification.
    myHttpClient?.close();
    myHttpClient = IOClient(HttpClient());
  }
}
