class User_Model{
  String name,email,token,_password;


  User_Model({this.name, this.email, this.token});


  set password(value) {
    _password = value;
  }

  Map<String,dynamic> tomap(){
    Map<String,dynamic> map=Map<String,dynamic>();
    map["name"]=this.name;
    map["email"]=this.email;
    map["token"]=this.token;
    map['password']=this._password;


    return map;

  }
  frommap(Map<String,dynamic> map){
    this.name=map["name"];
    this.email=map["email"];
    this.token=map["token"];
  }

}
