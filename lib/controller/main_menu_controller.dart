import 'package:flutter/material.dart';
import 'package:flutter_ulangan/Menu/feat_page.dart';
import 'package:flutter_ulangan/Menu/home_page.dart';
import 'package:flutter_ulangan/Menu/profile_page.dart';
import 'package:get/get.dart';

class MainMenuController extends GetxController {
  final RxInt selectedIndex = 0.obs;

  void changePage(int index) {
    selectedIndex.value = index;
  }

  List<Widget> listPages = [HomePage(), FeatPage(), ProfilePage()];
}
