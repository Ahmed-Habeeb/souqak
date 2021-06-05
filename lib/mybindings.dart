import 'package:get/get.dart';
import 'package:souqak/viewmodels/authviewmodel.dart';
import 'package:souqak/viewmodels/mainscreencontroller.dart';





class MyBindings implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut<MainScreenController>(() => MainScreenController());
    Get.lazyPut<AuthViewModel>(() => AuthViewModel());



  }

}