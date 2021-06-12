import 'dart:io';

import 'package:dio/dio.dart';
import 'package:souqak/models/cartmodel.dart';
import 'package:souqak/models/itemmodel.dart';

class Store {
  String? token;

  String url = "http://192.168.1.18:8000/api/";

  Store({this.token});

  uploadImage(File image) async {
    Map<String, dynamic> map = Map();
    map['Authorization'] = 'Bearer ' + token!;
    String name = image.path.split("/").last;

    FormData formData = FormData.fromMap(
        {"image": await MultipartFile.fromFile(image.path, filename: name)});

    var response = await Dio()
        .post(url + "image", data: formData, options: Options(headers: map));

    if (response.statusCode == 200) {
      return response.data.toString();
    }
  }

  Future<bool> addItem(ItemModel item, File image) async {
    Map<String, dynamic>? map = item.toMap();
    // var bytes=image.readAsBytesSync();
    // var image0=base64Encode(bytes);

    String name = image.path.split("/").last;

    FormData formData = FormData.fromMap({
      "image": await MultipartFile.fromFile(image.path, filename: name),
      "data": map
    });
    map['Authorization'] = 'Bearer ' + token!;

    var response = await Dio().post(url + "items/add",
        data: formData, options: Options(headers: map));

    return (response.statusCode == 200);
  }

  Future<List<ItemModel>> fetchAll() async {
    List<ItemModel> list = [];
    var res = await Dio().get(url + "items");

    if (res.statusCode == 200) {
      for (var item in res.data) {
        ItemModel itemModel = ItemModel();
        itemModel.fromMap(item);

        list.add(itemModel);
      }
    }

    return list;
  }

  fetchCategory(String cat) async {
    List<ItemModel> list = [];

    Map<String, String> map = Map();
    map["category"] = cat;
    var response = await Dio().post(url + "items_category", data: map);
    if (response.statusCode == 200) {
      for (var item in response.data) {
        ItemModel itemModel = ItemModel();
        itemModel.fromMap(item);

        list.add(itemModel);
      }
    }

    return list;
  }

  fetchSubcategory(String cat, String subcat) async {
    List<ItemModel> list = [];

    Map<String, String> map = Map();
    map["category"] = cat;
    map["subcategory"] = subcat;
    var response = await Dio().post(url + "items_subcategory", data: map);
    if (response.statusCode == 200) {
      for (var item in response.data) {
        ItemModel itemModel = ItemModel();
        itemModel.fromMap(item);

        list.add(itemModel);
      }
    }

    return list;
  }

  addOrder(int userId, int itemId) async {
    Map<String, String> map = Map();
    map['Authorization'] = 'Bearer ' + token!;
    map['user_id'] = userId.toString();
    map['item_id'] = itemId.toString();
    map['state'] = "Processing";

    var response = await Dio()
        .post(url + "order", data: map, options: Options(headers: map));
    if (response.statusCode == 201) {
      print(response.data);
    }
  }

  addCart(int userId, int? itemId) async {
    Map<String, String> map = Map();
    map['Authorization'] = 'Bearer ' + token!;
    map['user_id'] = userId.toString();
    map['item_id'] = itemId.toString();
    map['quantity'] = 1.toString();

    var response = await Dio()
        .post(url + "cart/add", data: map, options: Options(headers: map));
    if (response.statusCode == 201) {
      print(response.data);
    }
  }

  Future<List<CartModel>> fetchAllCart() async {
    List<CartModel> list = [];
    Map<String, String> map = Map();
    map['Authorization'] = 'Bearer ' + token!;
    var response = await Dio()
        .get(url + "cart/fetchuserid", options: Options(headers: map));
    if (response.statusCode == 200) {
      for (var cart in response.data) {
        CartModel cartModel = CartModel();
        cartModel.fromMap(cart);
        list.add(cartModel);
      }
    }

    return list;
  }

  Future<List<ItemModel>> fetchLatest() async {
    List<ItemModel> list = [];

    var response = await Dio().get(url + "fetchlatest");
    if (response.statusCode == 200) {
      for (var i in response.data) {
        ItemModel item = ItemModel();
        item.fromMap(i);
        list.add(item);
      }
    }
    return list;
  }
}
