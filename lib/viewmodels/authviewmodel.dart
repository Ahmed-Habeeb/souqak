import 'package:get/get.dart';
import 'package:souqak/models/usermodel.dart';
import 'package:souqak/network/Auth.dart';

class AuthViewModel extends GetxController {
  Auth _auth = Auth();
  UserModel user = UserModel();

  Future<String> createUser(UserModel user0) async {

    var data = await _auth.createEmail(user0);
    if (data.runtimeType == UserModel) {
      user = data;

      return "true";
    }
    return data;
  }

  me(String token) async {
    user = await _auth.me(token);
    update();
  }

  loginUser(String email, String password) async {
    var data = await _auth.login(email, password);
    if (data.runtimeType == UserModel) {
      user = data;
      return "true";
    }
    //print(data.runtimeType);
    return data;
  }
}
