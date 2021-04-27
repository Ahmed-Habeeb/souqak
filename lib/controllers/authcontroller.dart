import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:souqak/models/usermodel.dart';
import 'package:souqak/network/Auth.dart';

class AuthController extends GetxController {
  Auth _auth = Auth();
  UserModel user = UserModel();

  Future<bool> createUser(UserModel user0) async {
    var data = await _auth.createEmail(user0);
    if (data.runtimeType == UserModel) {
      user = data;

      return true;
    }
    return false;
  }

  me(String token) async {
    user = await _auth.me(token);
    update();
  }

  login(String email, String password) async {
    var data = await _auth.login(email, password);
    if (data.runtimeType == UserModel) {
      user = data;
      return true;
    }
    print(data.runtimeType);
    return false;
  }
}
