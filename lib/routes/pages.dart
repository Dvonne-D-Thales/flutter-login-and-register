import 'package:get/get.dart';
import 'package:latihan_11pplg1/bindings/calculator_binding.dart';
import 'package:latihan_11pplg1/bindings/contact_binding.dart';
import 'package:latihan_11pplg1/bindings/football_binding.dart';
import 'package:latihan_11pplg1/bindings/login_binding.dart';
import 'package:latihan_11pplg1/bindings/screen_binding.dart';
import 'package:latihan_11pplg1/bindings/spashscreen_binding.dart';
import 'package:latihan_11pplg1/pages/contact_page.dart';
import 'package:latihan_11pplg1/pages/example_page.dart';
import 'package:latihan_11pplg1/pages/football_edit_page.dart';
import 'package:latihan_11pplg1/pages/football_page.dart';
import 'package:latihan_11pplg1/pages/calculator_pages.dart';
import 'package:latihan_11pplg1/pages/login_page.dart';
import 'package:latihan_11pplg1/pages/mainmenu_page.dart';
import 'package:latihan_11pplg1/pages/profile_page.dart';
import 'package:latihan_11pplg1/pages/splashscreen_page.dart';
import 'package:latihan_11pplg1/routes/routes.dart';
import 'package:latihan_11pplg1/bindings/login_api_binding.dart';
import 'package:latihan_11pplg1/pages/home_page.dart';
import 'package:latihan_11pplg1/bindings/premier_binding.dart';
import 'package:latihan_11pplg1/pages/premier_pages.dart';
import 'package:latihan_11pplg1/pages/login_api_page.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: AppRoutes.calculator,
      page: () => CalculatorPages(),
      binding: CalculatorBinding(),
    ),
    GetPage(
      name: AppRoutes.footballPage,
      page: () => FootballPage(),
      binding: FootballBinding(),
    ),
    GetPage(name: AppRoutes.footballeditpage, page: () => FootballEditPage()),
    GetPage(name: AppRoutes.mainmenu, page: () => MainmenuPage()),
    GetPage(
      name: AppRoutes.splashscreen,
      page: () => SplashscreenPage(),
      binding: SplashScreenBinding(),
    ),
    GetPage(
      name: AppRoutes.login,
      page: () => LoginPage(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: AppRoutes.contactpage,
      page: () => ContactPage(),
      binding: ContactBinding(),
    ),
    GetPage(
      name: AppRoutes.examplepage,
      page: () => ExamplePage(),
      binding: ScreenBinding(),
    ),
    GetPage(
      name: AppRoutes.loginapi,
      page: () =>  LoginApiPage(),
      binding: LoginApiBinding(),
    ),
    GetPage(name: AppRoutes.profile, page: () => ProfilePage()),
    GetPage(name: AppRoutes.homepage, page: () => HomePage()),
    
    GetPage(
      name: AppRoutes.premiertable,
      page: () => PremierPages(),
      binding: PremierBinding(),
    ),
  ];
}
