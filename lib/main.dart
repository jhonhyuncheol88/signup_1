import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'routers.dart';

main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/AuthScreen',
      getPages: RouterPages.routes,
    );
  }
}
