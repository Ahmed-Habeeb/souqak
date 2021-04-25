import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:souqak/models/usermodel.dart';

class Auth {
  String url = "http://192.168.1.7:8000/api/";

  createEmail(UserModel user) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    UserModel user0 = UserModel();

    var response = await Dio().post(url + "create", data: user.tomap());
    if (response.statusCode == 200 && response.data != null) {
      user0.frommap(response.data);

      await pref.setString('token', user0.token!);

      return user0;
    } else {
      return "Error";
    }
  }

  login(String email, String pass) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    UserModel user = UserModel();
    Map<String, String> map = Map();
    map['email'] = email;
    map['password'] = pass;

    var response = await Dio().post(url + "login", data: map);

    if (response.statusCode == 200 && response.data != null) {
      user.frommap(response.data);

      await pref.setString('token', user.token!);

      return user;
    } else {
      return "Error";
    }
  }

  me(String token) async {
    Map<String, String> map = Map();
    map['Authorization'] = 'Bearer ' + token;
    UserModel user = UserModel();

    var response = await Dio().get(url + 'me', options: Options(headers: map));
    if (response.statusCode == 200 && response.data != null) {
      user.frommap(response.data);

      return user;
    } else {
      return "Error";
    }
  }
}
