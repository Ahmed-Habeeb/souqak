import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
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
    print("Me");
    user = await _auth.me(token);
    update();
  }

  loginUser(String email, String password) async {
    Map<String, String> map = Map();
    map['email'] = email;
    map['password'] = password;
   // var data = await compute( _auth.login,map);
   var data=await _auth.login(map);
    if (data.runtimeType == UserModel) {
      user = data;
      update();
      return "true";
    }
    //print(data.runtimeType);
    return data;
  }
 Future<bool> logout()async{
    var pref = await SharedPreferences.getInstance();
    String token = pref.getString("token")!;
   bool data=await _auth.logout(token);
    if(data) {

      user.token="noToken";
      return await pref.setString("token", "noToken");
    }else {
      return data;
    }
  }

}
