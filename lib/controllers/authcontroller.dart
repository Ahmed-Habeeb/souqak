import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:souqak/models/usermodel.dart';
import 'package:souqak/network/Auth.dart';

class AuthController extends GetxController{

  Auth _auth=Auth();
  UserModel user=UserModel();

 Future<String> createUser(UserModel user0)async{
    SharedPreferences preferences= await SharedPreferences.getInstance();
   var data = await _auth.createEmail(user0);
   if(data.runtimeType==String){}
   String token=preferences.getString('token')!;
   return token;

  }
  me(String token)async{
  user=await _auth.me(token);
  update();

  }

  login(String email,String password)async{
    SharedPreferences preferences= await SharedPreferences.getInstance();
    user= await _auth.login(email,password);
    String token=preferences.getString('token')!;
    return token;

  }


}