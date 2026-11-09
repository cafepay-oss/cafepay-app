
class AppConfig {

  static const hostUrl = String.fromEnvironment(
    'CAFEPAY_API_ORIGIN', defaultValue: 'https://cafepay.cloud');

}
