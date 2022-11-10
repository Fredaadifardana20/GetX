import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'controller/demoController.dart';
import 'view/demoPage.dart';
import 'view/home.dart';

void main() async {
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is theroot of your application
  final DemoController ctrl = Get.put(DemoController());
  @override
  Widget build(BuildContext context) {
    return SimpleBuilder(
      builder: (_) {
        // For darkmode instant change
        return GetMaterialApp(
          // For navigation dont forget to use GetMaterialApp
          title: 'GetX',
          theme: ctrl.theme,
          debugShowCheckedModeBanner: false,
          initialRoute: '/',
          routes: {
            // Routes for named navigation
            '/': (context) => HomePage(),
            '/cart': (context) => DemoPage(),
          },
        );
      },
    );
  }
}
