import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:souqak/models/user_model.dart';
import 'package:souqak/network/Auth.dart';

class Auth_Controller extends GetxController{

  Auth _auth=Auth();
  User_Model user=User_Model();

 Future<bool> createuser(User_Model user0)async{
    SharedPreferences preferences= await SharedPreferences.getInstance();
   user= await _auth.create_email(user0);
   String token=preferences.getString('token');
   if(token!=null){
     return true;
   }

  }
  me(String token)async{
  user=await _auth.me(token);
  update();

  }

  login(String email,String password)async{
    SharedPreferences preferences= await SharedPreferences.getInstance();
    user= await _auth.login(email,password);
    String token=preferences.getString('token');
    if(token!=null){
      return true;
    }

  }


}