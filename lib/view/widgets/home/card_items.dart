import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:drixion/logic/controllers/cart_controller.dart';
import 'package:drixion/logic/controllers/product_controller.dart';
import 'package:drixion/models/product_models.dart';
import 'package:drixion/utils/theme.dart';
import 'package:drixion/view/screens/product_details_scree.dart';
import 'package:drixion/view/widgets/text_utils.dart';

class CardItems extends StatelessWidget {
  CardItems({Key? key}) : super(key: key);

  final controller = Get.find<ProductController>();

  final cartController = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.isLoading.value) {
        return Center(
          child: CircularProgressIndicator(
            color: Get.isDarkMode ? pinkClr : mainColor,
          ),
        );
      } else {
        return Expanded(
          child: controller.searchList.isEmpty &&
                  controller.searchTextController.text.isNotEmpty
              ? Get.isDarkMode
                  ? Image.asset("assets/images/search_empty_dark.png")
                  : Image.asset("assets/images/search_empty_light.png")
              : GridView.builder(
                  itemCount: controller.searchList.isEmpty
                      ? controller.productList.length
                      : controller.searchList.length,
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    childAspectRatio: 0.8,
                    mainAxisSpacing: 9.0,
                    crossAxisSpacing: 6.0,
                    maxCrossAxisExtent: 200,
                  ),
                  itemBuilder: (context, index) {
                    if (controller.searchList.isEmpty) {
                      return buildCardItems(
                          image: controller.productList[index].image,
                          price: controller.productList[index].price,
                          rate: controller.productList[index].rating.rate,
                          productId: controller.productList[index].id,
                          productModels: controller.productList[index],
                          onTap: () {
                            Get.to(() => ProductDetailsScreen(
                                  productModels: controller.productList[index],
                                ));
                          });
                    } else {
                      return buildCardItems(
                          image: controller.searchList[index].image,
                          price: controller.searchList[index].price,
                          rate: controller.searchList[index].rating.rate,
                          productId: controller.searchList[index].id,
                          productModels: controller.searchList[index],
                          onTap: () {
                            Get.to(() => ProductDetailsScreen(
                                  productModels: controller.searchList[index],
                                ));
                          });
                    }
                  },
                ),
        );
      }
    });
  }

  Widget buildCardItems({
    required String image,
    required double price,
    required double rate,
    required int productId,
    required ProductModels productModels,
    required Function() onTap,
  }) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: InkWell(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Get.isDarkMode ? Colors.grey.shade800 : Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade600.withOpacity(0.3),
                spreadRadius: 3.0,
                blurRadius: 5.0,
              ),
            ],
          ),
          child: Column(
            children: [
              Obx(
                () => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {
                        controller.manageFavourites(productId);
                      },
                      icon: controller.isFavourites(productId)
                          ? const Icon(
                              Icons.favorite,
                              color: Colors.red,
                            )
                          : Icon(
                              Icons.favorite_outline,
                              color:
                                  Get.isDarkMode ? Colors.white : Colors.black,
                            ),
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                //height: 160,
                decoration: BoxDecoration(
                  color: Get.isDarkMode ? Colors.grey.shade800 : Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Image.network(
                  image,
                  //width: double.infinity,
                  height: 85,
                  fit: BoxFit.fitHeight,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 15, right: 15, top: 10, bottom: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "\$ $price",
                      style: TextStyle(
                        color: Get.isDarkMode ? Colors.white : Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Container(
                      height: 20,
                      width: 45,
                      decoration: BoxDecoration(
                        color: Get.isDarkMode ? Colors.black12 : mainColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 5, right: 3),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextUtils(
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                              text: "$rate",
                              color: Colors.white,
                              underLine: TextDecoration.none,
                            ),
                            const Icon(
                              Icons.star,
                              size: 13,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              InkWell(
                onTap: () {
                  cartController.addProductToCart(productModels);
                },
                child: Padding(
                  padding: const EdgeInsets.only(left: 5, right: 5),
                  child: Container(
                    height: 40,
                    decoration: BoxDecoration(
                      color: Get.isDarkMode ? Colors.black12 : mainColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextUtils(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            text: "Add To Cart ",
                            color: Colors.white,
                            underLine: TextDecoration.none,
                          ),
                          Icon(
                            Icons.shopping_cart,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
