import 'package:get/get.dart';
import 'package:drixion/view/screens/category_screen.dart';
import 'package:drixion/view/screens/favorites_screen.dart';
import 'package:drixion/view/screens/home_screen.dart';
import 'package:drixion/view/screens/settings_screen.dart';

class MainController extends GetxController {
  RxInt currentIndex = 0.obs;

  var tabs = [
    HomeScreen(),
    CategoryScreen(),
    FavoritesScreen(),
    SettingsScreen(),
  ].obs;

  var title = [
    "Drixion",
    "Categories",
    'Favourites',
    "Settings",
  ].obs;
}
