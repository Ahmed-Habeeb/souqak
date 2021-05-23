


class CartModel{
  late int id,userId,itemId,quantity;
  late String name,details,category,subCategory,image;
  late double price;



  fromMap(Map<String,dynamic> map)async{
    this.name=map["name"];
    this.details=map["details"];
    this.category=map["category"];
    this.subCategory=map["subcategory"];
    this.image=map["image"];
    this.id=int.parse(map["id"].toString());
    this.userId=int.parse(map["user_id"].toString());
    this.itemId=int.parse(map["item_id"].toString());
    this.quantity=int.parse(map["quantity"].toString());
    this.price=double.parse(map["price"].toString());


  }


}
