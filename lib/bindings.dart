import 'package:signup_1/controllers/registeration_controller.dart';

import 'package:get/get.dart';

class SomeBinding extends Bindings {
  @override
  dependencies() {
    Get.put(RegisterionController());
  }
}
