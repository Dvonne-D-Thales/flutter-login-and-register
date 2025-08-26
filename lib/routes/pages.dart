import 'package:get/get.dart';
import 'package:latihan_11pplg1/pages/football_edit_page.dart';
import 'package:latihan_11pplg1/pages/football_page.dart';
import 'package:latihan_11pplg1/pages/home_page.dart';
import 'package:latihan_11pplg1/pages/mainmenu_page.dart';
import 'package:latihan_11pplg1/routes/routes.dart';

class AppPages {
  static final pages = [
    GetPage(name: AppRoutes.calculator, page: () => HomePage()),
    GetPage(name: AppRoutes.footballPage, page: () => FootballPage()),
    GetPage(name: AppRoutes.footballeditpage, page: () => FootballEditPage()),
  GetPage(name: AppRoutes.mainmenu, page: () => MainmenuPage()),

  ];
}
