import 'package:get/get.dart';
import 'package:souqak/models/itemmodel.dart';
import 'package:souqak/network/store.dart';

class MainScreenController extends GetxController {
  var _store = Store();
  var navOpened = false.obs;
  var index = 0.obs;
  var appBarTitle = ["Home", "Categories", "Cart", "Profile"];
  var categoriesList = [
    "Clothes & Accessories",
    "Electronics",
    "Home & Garden",
    "Vehicles",
    "Family",
    "Entertainment"
  ];
  List<ItemModel> latest = [];
  String selectedCategory = "All";

  @override
  void onInit() {
    fetchLatest();
    super.onInit();
  }

  changeIndex(int i) {
    index.value = i;
    update();
  }

  fetchLatest() async {
    latest = await _store.fetchLatest();
    update();
  }
}
