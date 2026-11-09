# CafePay mobile app

This unfinished Flutter app provides Persian customer screens for CafePay.
It includes menu, table, basket, profile, and wallet screens.
Login remains incomplete, and several screens show fixed sample data.
Use [the customer web app](https://github.com/cafepay-oss/cafepay-webapp) for ordering and payment.

## Current limits

- `Auth` exposes token state but does not implement a working login flow.
- The registration confirmation button only writes a debug message.
- `UserTable.fetchAndSetBill()` returns fixed sample data instead of a live bill.
- `CafeMenuProvider` also starts from fixed sample menu data.
- Search navigation remains commented out.
- `test/widget_test.dart` still tests the unrelated Flutter counter template.

The HTTP helper now uses normal network settings and certificate checks.
Login, ordering, wallet charging, and payment still need development.
Do not treat the sample prices or balances as server records.

## Tools and setup

`pubspec.yaml` requires Dart `>=2.2.2 <3.0.0`.
The code uses older Flutter libraries and language features.
It needs an older, compatible Flutter SDK.
A move to current Flutter requires code and dependency updates.
The current checks did not compile or run this app.
Flutter and Dart were unavailable.

With a compatible Flutter SDK, run:

```sh
flutter --version
flutter doctor
flutter pub get
flutter analyze
flutter test
```

These commands can report failures in the unfinished app.
The existing test checks a sample counter, not CafePay.
Add CafePay tests as you complete the app.

## API configuration

`lib/helper/app_config.dart` reads `CAFEPAY_API_ORIGIN` when Flutter builds the app.
Its default is `https://cafepay.cloud`.
Use the server address without a final `/` or an API path.
The app adds request paths.
To start the app with your backend address, run:

```sh
flutter run --dart-define=CAFEPAY_API_ORIGIN=https://your-api.example
```

The URL contains no authentication token.
Use an address reachable from the target device or emulator.
This setting does not replace the fixed sample data.
The HTTP helper uses normal system routing and certificate checks.
Do not add a certificate bypass to make development endpoints work.

## وضعیت برنامه و راهنمای فارسی

این برنامه موبایل هنوز کامل نیست.
ورود، ثبت‌نام و ارتباط کامل با سفارش‌های واقعی به توسعه نیاز دارند.
برخی صفحه‌ها اطلاعات نمونه نشان می‌دهند.
برای سفارش و پرداخت، از نسخه وب مشتری و راهنمای فارسی آن استفاده کنید.

## Related repositories

- [cafepay-webapp](https://github.com/cafepay-oss/cafepay-webapp): customer web app and Persian user guide.
- [cafepal](https://github.com/cafepay-oss/cafepal): backend, local Docker setup, and sample data.
- [cafepay-admin](https://github.com/cafepay-oss/cafepay-admin): cafe management and Persian staff guide.

## License

CafePay code uses the [MIT License](LICENSE).
The app includes Vazirmatn v33.003 under the [SIL Open Font License 1.1](assets/fonts/OFL.txt).
See [the font notes](assets/fonts/README.md) for its source.
