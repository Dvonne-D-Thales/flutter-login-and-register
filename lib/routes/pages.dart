import 'package:get/get.dart';
import 'package:latihan_11pplg1/pages/football_page.dart';
import 'package:latihan_11pplg1/pages/home_page.dart';
import 'package:latihan_11pplg1/routes/routes.dart';

class AppPages {
  static final pages = [
    GetPage(name: AppRoutes.calculator, page: () => HomePage()),
    GetPage(name: AppRoutes.footballPlayers, page: () => FootballPage()),
  ];
}
