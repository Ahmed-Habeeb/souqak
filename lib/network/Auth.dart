import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:souqak/models/usermodel.dart';

class Auth {
  String url = "http://192.168.1.39:8000/api/";

  createEmail(UserModel user) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    UserModel user0 = UserModel();

    var response = await Dio().post(url + "create", data: user.tomap());
    if (response.statusCode == 200 && response.data != null) {
      user0.frommap(response.data);

      await pref.setString('token', user0.token!);
      print(response.data);

      return user0;
    } else {
      String error;
      if(response.data["email"]!=null){
        print(response.data["email"][0]);
        error =response.data["email"][0];
        return error;

      }
      else if(response.data["password"]!=null){
        error =response.data["password"][0];
        return error;

      }
      error="error";
      return error;
    }
  }

  login(Map<String,String> map) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    UserModel user = UserModel();


    var response = await Dio().post(url + "login", data: map,options: Options(
      followRedirects: false,
      validateStatus: (status) {
        return (status! < 500);
      },
     // headers: headers,
    ),);

    if (response.statusCode == 200 && response.data != null) {
      user.frommap(response.data);

      await pref.setString('token', user.token!);

      return user;
    } else {

      String error;

      error=response.data["error"];
      print(response.data["error"]);
      return error;
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
