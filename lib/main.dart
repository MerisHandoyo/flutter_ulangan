import 'package:flutter/material.dart';
import 'package:flutter_ulangan/routes.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      initialRoute: Routes.login_page,
      getPages: Routes.myPages,
    );
  }
}
