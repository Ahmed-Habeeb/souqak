
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:souqak/models/user_model.dart';

class Auth{
  String url="http://192.168.1.7:8000/api/";

  Future<User_Model> create_email(User_Model user)async {
    SharedPreferences pref=await SharedPreferences.getInstance();
    User_Model user0=User_Model();

    var response = await Dio().post(url+"create",data:user.tomap() );
    if (response.statusCode == 200 && response.data!=null) {
      user0.frommap(response.data);

      await pref.setString('token', user0.token);

      return user0;
    }else{
      print('Error SignUp');
    }

  }

  Future<User_Model> login(String email,String pass)async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    User_Model user = User_Model();
    Map<String, String> map = Map();
    map['email'] = email;
    map['password'] = pass;

    var response = await Dio().post(url + "login", data: map);

    if (response.statusCode == 200 && response.data!=null){
      user.frommap(response.data);

    await pref.setString('token', user.token);

    return user;
  }else{
      print("Error Login ");
    }




  }
 Future<User_Model> me(String token)async{
    Map<String, String> map = Map();
    map['Authorization']='Bearer '+token;
    User_Model user = User_Model();


    var response=await Dio().get(url+'me',options:Options(headers: map) );
    if (response.statusCode == 200 && response.data!=null){
      user.frommap(response.data);


      return user;
    }else{
      print("Error Login ");
    }
   print(response);
  }


}