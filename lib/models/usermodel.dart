class UserModel{
  String? name, email,token,password;


  UserModel({this.name,this.email,this.token,this.password});

  Map<String,dynamic> tomap(){
    Map<String,dynamic> map=Map<String,dynamic>();
    map["name"]=this.name;
    map["email"]=this.email;
    map["token"]=this.token;
    map['password']=this.password;


    return map;

  }
  frommap(Map<String,dynamic> map){
    this.name=map["name"];
    this.email=map["email"];
    this.token=map["token"];
  }

}
