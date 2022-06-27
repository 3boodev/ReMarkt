import 'package:drixion/logic/controllers/settings_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:drixion/logic/controllers/category_controller.dart';
import 'package:drixion/utils/theme.dart';
import 'package:drixion/view/widgets/category/category_items.dart';

class CategoryWidget extends StatelessWidget {
  CategoryWidget({Key? key}) : super(key: key);

  final controller = Get.find<CategoryController>();
  final settingcontroller = Get.find<SettingController>();
  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        if (controller.isCatgeoryLoading.value) {
          return Center(
            child: CircularProgressIndicator(
              color: Get.isDarkMode ? pinkClr : mainColor,
            ),
          );
        } else {
          return Expanded(
            child: ListView.separated(
              itemBuilder: (context, index) {
                return InkWell(
                  splashColor: Get.isDarkMode?pinkClr:mainColor,
                  onTap: () {
                    controller.getCategoryIndex(index);
                    Get.to(() => CategoryItems(
                      catehoryTitle: controller.categoryNameList[index],
                    ));
                  },
                  child: Container(
                    height: 150,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Get.isDarkMode?Colors.grey.shade900:Colors.white54,
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: NetworkImage(
                          controller.imageCategory[index],
                        ),
                        fit: BoxFit.contain,
                      ),
                    ),
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        settingcontroller.capitalize(controller.categoryNameList[index]),
                        style: const TextStyle(
                          backgroundColor: Colors.black38,
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return const SizedBox(
                  height: 20,
                );
              },
              itemCount: controller.categoryNameList.length,
              shrinkWrap: true,
              physics:BouncingScrollPhysics(),
            ),
          );
        }
      },
    );
  }
}
