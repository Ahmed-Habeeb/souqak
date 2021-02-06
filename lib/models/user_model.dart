class User_Model{
  String name,email,token,_password;
  int restaurant;


  User_Model({this.name, this.email, this.token, this.restaurant});


  set password(value) {
    _password = value;
  }

  Map<String,dynamic> tomap(){
    Map<String,dynamic> map=Map<String,dynamic>();
    map["name"]=this.name;
    map["email"]=this.email;
    map["token"]=this.token;
    map['password']=this._password;
    map["restaurant"]=this.restaurant;


    return map;

  }
  frommap(Map<String,dynamic> map){
    this.name=map["name"];
    this.email=map["email"];
    this.token=map["token"];
    this.restaurant=map["restaurant"];
  }

}
