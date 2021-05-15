import 'package:get/get.dart';
import 'package:souqak/viewmodels/authviewmodel.dart';





class MyBindings implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut<AuthViewModel>(() => AuthViewModel());

  }

}