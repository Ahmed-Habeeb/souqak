import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:souqak/controllers/auth_controller.dart';

import '../home_screen.dart';
import 'signup_screen.dart';

class Login_Screen extends StatelessWidget {
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
          child: Login_Form(),
        ),
      ),
    );
  }
}

class Login_Form extends StatefulWidget {
  @override
  _Login_FormState createState() => _Login_FormState();
}

class _Login_FormState extends State<Login_Form> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController email;
  TextEditingController password;

  @override
  void initState() {
    email = TextEditingController();
    password = TextEditingController();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      child: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                "SouQak",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 50,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 100,
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
                    builder: (auth) => ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState.validate()) {
                            String email0 = email.value.text;
                            String password0 = password.value.text;
                            auth.login(email0, password0).then((value) {
                              if (value) {
                                Get.offAll(Home_Screen());
                              }
                            });
                          }
                        },
                        child: Text("Login")),
                  )),
              SizedBox(
                height: 160,
              ),
              InkWell(
                  onTap: () {
                    Get.off(SignUp_Screen());
                  },
                  child: Text(
                    "Have not an Account? SignUp",
                    style: TextStyle(color: Colors.white),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
