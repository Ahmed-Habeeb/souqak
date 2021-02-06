

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:souqak/controllers/auth_controller.dart';
import 'package:souqak/models/user_model.dart';
import 'package:souqak/screens/home_screen.dart';

import 'login_screen.dart';

class SignUp_Screen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment(-1.0, -4.0),
                end: Alignment(1.0, 4.0),
                colors: [
              Colors.white,
              Colors.blue,
            ])),
        child: Padding(
          padding: const EdgeInsets.only(top: 150, left: 20, right: 20),
          child: SignUp_Form(),
        ),
      ),
    );
  }
}

class SignUp_Form extends StatefulWidget {
  @override
  _SignUp_FormState createState() => _SignUp_FormState();
}

class _SignUp_FormState extends State<SignUp_Form> {
  final _formKey1 = GlobalKey<FormState>();
  TextEditingController name;

  TextEditingController email;
  TextEditingController password;

  @override
  void initState() {
    name = TextEditingController();

    email = TextEditingController();
    password = TextEditingController();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      child: Form(
        key: _formKey1,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                "FoodSociety",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 50,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 100,
              ),
              TextFormField(
                controller: name,
                style: TextStyle(color: Colors.white),
                cursorColor: Colors.white,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelStyle: TextStyle(color: Colors.white),
                  labelText: "name",
                  border: OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white)),
                ),
                validator: (d) {
                  if (d.isEmpty) {
                    return 'Please Enter your name!';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: email,
                style: TextStyle(color: Colors.white),
                cursorColor: Colors.white,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelStyle: TextStyle(color: Colors.white),
                  labelText: "E-mail",
                  border: OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white)),
                ),
                validator: (d) {
                  if (d.isEmpty) {
                    return 'Please Enter an E-mail!';
                  } else if (!d.contains("@")) {
                    return 'E-mail must have @ sign !';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: password,
                style: TextStyle(color: Colors.white),
                cursorColor: Colors.white,
                obscureText: true,
                decoration: InputDecoration(
                  labelStyle: TextStyle(color: Colors.white),
                  labelText: "Password",
                  border: OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                ),
                validator: (d) {
                  if (d.isEmpty) {
                    return 'Please Enter Password!';
                  } else if (d.length < 8) {
                    return 'Password must be more than 8  !';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                  width: double.infinity,
                  height: 45,
                  child: GetBuilder<Auth_Controller>(
                    init: Auth_Controller(),
                    builder: (auth)=>ElevatedButton(
                      onPressed: () {
                        if (_formKey1.currentState.validate()) {
                          String name0= name.value.text;
                          String email0=email.value.text;
                          String password0=password.value.text;
                          User_Model user=User_Model(name:name0 ,email:email0 );
                          user.password=password0;
                          auth.createuser(user).then((value) {
                            if(value){
                              Get.to(Home_Screen());
                            }
                          });

                        }
                      },
                      child: Text("SignUp")),)),
              SizedBox(height: 100,),
              InkWell(
                  onTap: () {
                    Get.to(Login_Screen());
                  },
                  child: Text(
                    "Already Have an Account?Login",
                    style: TextStyle(color: Colors.white),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
