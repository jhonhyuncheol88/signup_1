import 'package:get/get.dart';
import 'package:signup_1/bindings.dart';

import 'package:signup_1/ui/auth_screen.dart';
import 'package:signup_1/ui/home.dart';

class RouterPages {
  static final List<GetPage> routes = [
    GetPage(
        name: '/AuthScreen',
        page: () => AuthScreen(),
        fullscreenDialog: true,
        binding: SomeBinding()),
    GetPage(
      name: '/home',
      page: () => HomeScreen(),
    )
  ];
}
