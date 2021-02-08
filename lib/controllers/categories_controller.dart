import 'package:get/get.dart';

class Categories_Controller extends GetxController {
  List<String> categories = [
    'All',
    'Clothes',
    'Electronics',
    'Furniture',
    'Vehicles',
  ];
  String selected_category = 'All';

  List<String> subcategory = null;
  String selected_subcategory = 'All';

  // ignore: non_constant_identifier_names
  change_selected_category(String name) {
    this.selected_category = name;
    handle_subcategory(name);
    update();
  }
  change_selected_subcategory(String name) {
    this.selected_subcategory = name;
    update();
  }

  // ignore: non_constant_identifier_names
  handle_subcategory(String category) async {
    switch (category) {
      case 'All':
        subcategory = null;
        selected_subcategory = null;
        break;
      case 'Clothes':
        subcategory = [
          'All',
          'Summer',
          'Winter',
          'Bags',
          'Shoes',
          'Women',
          'Men',
          'Kids',
          'Accessories'
        ];
        selected_subcategory = 'All';
        break;
      case 'Electronics':
        subcategory = [
          'All',
          'Tvs',
          'Computer',
          'Camera',
          'Phones',
          'Tablets',
        ];
        selected_subcategory = 'All';

        break;
      case 'Furniture':
        subcategory = [
          'All',
          'Bedroom',
          'Bathroom',
          'Livingroom',
          'Kitchen',
          'Garden',
          'Diningroom',
        ];
        selected_subcategory = 'All';
        break;
      case 'Vehicles':
        subcategory = [
          'All',
          'Cars',
          'Motorcycles',
          'Toktok',
        ];
        selected_subcategory = 'All';

        break;
      default:
    }
    update();
    print(subcategory);
  }
}
