





class ItemModel{

  String? name,details,category,subcategory,image;
  int? id;
  double? price;

  ItemModel({this.name, this.details, this.category, this.subcategory,
    this.image, this.id,  this.price});





  Map<String, dynamic> toMap(){
    Map<String,dynamic> map=Map<String,dynamic>();
    map["name"]=this.name;
    map["details"]=this.details;
    map["category"]=this.category;
    map["subcategory"]=this.subcategory;
    map["image"]=this.image;

    map["price"]=this.price.toString();

    return map;


  }
  fromMap(Map<String,dynamic> map)async{
    this.name=map["name"];
    this.details=map["details"];
    this.category=map["category"];
    this.subcategory=map["subcategory"];
    this.image=map["image"];
    this.id=int.parse(map["id"].toString());
    this.price=double.parse(map["price"].toString());


  }
}
