import 'package:flutter_ulangan/pages/detail_makana_page.dart';
import 'package:flutter_ulangan/pages/login_page.dart';
import 'package:flutter_ulangan/pages/main_menu_page.dart';
import 'package:get/get.dart';

class Routes {
  static const String main_menu = "/main_menu";
  static const String login_page = "/login_page";
  static const String detail_makanan = "/detail_makanan";


  static final myPages=[
    GetPage(name: main_menu, page: ()=> MainMenuPage()),
    GetPage(name: login_page, page: ()=> LoginPage()),
    GetPage(name: detail_makanan, page: () => DetailMakananPage()),
    ];
}