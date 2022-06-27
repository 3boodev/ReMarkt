import 'package:drixion/logic/controllers/settings_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:drixion/logic/controllers/category_controller.dart';
import 'package:drixion/utils/theme.dart';
import 'package:drixion/view/widgets/category/category_items.dart';

class CategoryHomeItems extends StatelessWidget {
  CategoryHomeItems({Key? key}) : super(key: key);

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
          return Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height / 7,
            alignment: AlignmentDirectional.center,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return InkWell(
                  splashColor: Get.isDarkMode ? pinkClr : mainColor,
                  onTap: () {
                    controller.getCategoryIndex(index);
                    Get.to(() => CategoryItems(
                          catehoryTitle: controller.categoryNameList[index],
                        ));
                  },
                  child: Column(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width / 8,
                        height: MediaQuery.of(context).size.height / 12,
                        decoration: BoxDecoration(
                          color: Get.isDarkMode
                              ? Colors.grey.shade900
                              : Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            image: NetworkImage(
                              controller.imageCategory[index],
                            ),
                            fit: BoxFit.fitHeight,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 5),
                        child: Align(
                          child: Text(
                            settingcontroller
                                .capitalize(controller.categoryNameList[index]),
                            style: TextStyle(
                              color:
                                  Get.isDarkMode ? Colors.white : Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return const SizedBox(
                  width: 10,
                );
              },
              itemCount: controller.categoryNameList.length,
              shrinkWrap: true,
              physics: BouncingScrollPhysics(),
            ),
          );
        }
      },
    );
  }
}
