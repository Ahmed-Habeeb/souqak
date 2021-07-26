import 'package:get/get.dart';
import 'package:souqak/models/itemmodel.dart';
import 'package:souqak/network/store.dart';

class MainScreenController extends GetxController {
  var _store = Store();
  var navOpened = false.obs;
  var index = 0.obs;
  var appBarTitle = ["Home", "Cart", "Orders", "Profile"];
  var categoriesList = [
    "Clothes & Accessories",
    "Electronics",
    "Home & Garden",
    "Vehicles",
    "Family",
    "Entertainment"
  ];
  List<ItemModel> latest = [];
  String selectedCategory = "Clothes & Accessories";
  List<String> subCategoryList = [];
  String? subcategory;

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

  changeCategory(String cat) async {
    this.selectedCategory = cat;
    handleSubcategory(cat);
    update();
  }

  changeSubcategory(String cat) async {
    this.subcategory = cat;
    update();
  }

  handleSubcategory(String category) async {
    switch (category) {
      case 'Clothes & Accessories':
        subCategoryList = [
          'Bags',
          'Women\'s Clothing & Shoes',
          'Men\'s Clothing & Shoes',
          'Jewelry & Accessories',
          'Kids',
        ];
        subcategory = 'Bags';
        break;
      case 'Electronics':
        subCategoryList = [
          'Tvs',
          'Computer',
          'Camera',
          'Phones',
          'Tablets',
        ];
        subcategory = 'Phones';

        break;
      case 'Home & Garden':
        subCategoryList = [
          'Tools',
          'Furniture',
          'Garden',
          'Appliances',
        ];
        subcategory = 'Furniture';
        break;
      case 'Vehicles':
        subCategoryList = [
          'Cars',
          'Motorcycles',
          'Toktok',
        ];
        subcategory = 'Cars';

        break;
      case 'Family':
        subCategoryList = [
          'Health & Beauty',
          'Pet Supplies',
          'Baby & Kids',
          'Toys & Games',
        ];
        subcategory = 'Health & Beauty';

        break;
      case 'Entertainment':
        subCategoryList = [
          'Video Games',
          'Books',
          'Movies & Music',
        ];
        subcategory = 'Video Games';

        break;
      default:
    }
    update();
  }

}
