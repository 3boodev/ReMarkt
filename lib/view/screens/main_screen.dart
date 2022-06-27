import 'package:badges/badges.dart';
import 'package:drixion/logic/controllers/auth_controller.dart';
import 'package:drixion/logic/controllers/cart_controller.dart';
import 'package:drixion/logic/controllers/main_controller.dart';
import 'package:drixion/routes/routes.dart';
import 'package:drixion/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainScreen extends StatelessWidget {
  MainScreen({Key? key}) : super(key: key);
  final controller = Get.find<MainController>();
  final cartController = Get.find<CartController>();
  final authController = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Obx(
        () {
          return Scaffold(
            backgroundColor: context.theme.backgroundColor,
            appBar: AppBar(
              elevation: 0,
              leading: Container(),
              actions: [
                Obx(
                  () => Badge(
                    position: BadgePosition.topEnd(top: 0, end: 3),
                    animationDuration: const Duration(milliseconds: 300),
                    animationType: BadgeAnimationType.slide,
                    badgeContent: Text(
                      cartController.quantity().toString(),
                      style: const TextStyle(color: Colors.white),
                    ),
                    child: IconButton(
                      onPressed: () {
                        Get.toNamed(Routes.cartScreen);
                      },
                      icon: Image.asset('assets/images/shop.png'),
                    ),
                  ),
                ),
              ],
              backgroundColor: Get.isDarkMode ? darkGreyClr : mainColor,
              title: Text(controller.title[controller.currentIndex.value]),
              centerTitle: true,
            ),
            bottomNavigationBar: BottomNavigationBar(
              backgroundColor: Get.isDarkMode ? darkGreyClr : Colors.white,
              currentIndex: controller.currentIndex.value,
              type: BottomNavigationBarType.fixed,
              items: [
                BottomNavigationBarItem(
                  activeIcon: Icon(
                    Icons.home,
                    color: Get.isDarkMode ? pinkClr : mainColor,
                  ),
                  icon: Icon(
                    Icons.home,
                    color: Get.isDarkMode ? Colors.white : Colors.black,
                  ),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  activeIcon: Icon(
                    Icons.category_outlined,
                    color: Get.isDarkMode ? pinkClr : mainColor,
                  ),
                  icon: Icon(
                    Icons.category_outlined,
                    color: Get.isDarkMode ? Colors.white : Colors.black,
                  ),
                  label: 'Category',
                ),
                BottomNavigationBarItem(
                  activeIcon: Icon(
                    Icons.favorite,
                    color: Get.isDarkMode ? pinkClr : mainColor,
                  ),
                  icon: Icon(
                    Icons.favorite,
                    color: Get.isDarkMode ? Colors.white : Colors.black,
                  ),
                  label: 'Favorites',
                ),
                BottomNavigationBarItem(
                  activeIcon: authController.auth.currentUser != null
                      ? Container(
                          height: 25,
                          width: 25,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: NetworkImage(
                                authController.displayUserPhoto.value,
                              ),
                              fit: BoxFit.fitHeight,
                            ),
                          ),
                        )
                      : Icon(
                          Icons.settings,
                          color: Get.isDarkMode ? pinkClr : Colors.black,
                        ),
                  icon: Icon(
                    Icons.settings,
                    color: Get.isDarkMode ? Colors.white : Colors.black,
                  ),
                  label: 'Settings',
                ),
              ],
              onTap: (index) {
                controller.currentIndex.value = index;
              },
            ),
            body: IndexedStack(
              index: controller.currentIndex.value,
              children: controller.tabs,
            ),
          );
        },
      ),
    );
  }
}
