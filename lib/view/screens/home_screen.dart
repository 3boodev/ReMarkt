import 'package:drixion/utils/theme.dart';
import 'package:drixion/view/widgets/home/card_items.dart';
import 'package:drixion/view/widgets/home/category_home_items.dart';
import 'package:drixion/view/widgets/home/search_text_form.dart';
import 'package:drixion/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: context.theme.backgroundColor,
        body: Column(
          children: [
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height / 5,
              decoration: BoxDecoration(
                color: Get.isDarkMode ? darkGreyClr : mainColor,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextUtils(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      text: "IntroWord1".tr + "  " + "IntroWord2".tr,
                      color: Colors.white,
                      underLine: TextDecoration.none,
                    ),
                    const SizedBox(height: 5),
                    SearchFormText(),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Align(
                alignment: Alignment.topLeft,
                child: TextUtils(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  text: "CATEGORY".tr,
                  color: Get.isDarkMode ? Colors.white : Colors.black,
                  underLine: TextDecoration.none,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            CategoryHomeItems(),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Align(
                alignment: Alignment.topLeft,
                child: TextUtils(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  text: "PRODUCTS".tr,
                  color: Get.isDarkMode ? Colors.white : Colors.black,
                  underLine: TextDecoration.none,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            CardItems(),
          ],
        ),
      ),
    );
  }
}
