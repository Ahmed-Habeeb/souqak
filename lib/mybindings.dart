import 'package:get/get.dart';
import 'package:souqak/controllers/authcontroller.dart';
import 'controllers/authscreencontroller.dart';





class MyBindings implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut<AuthController>(() => AuthController());
    Get.lazyPut<AuthScreenController>(() => AuthScreenController());

  }

}