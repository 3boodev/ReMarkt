import 'package:drixion/view/widgets/category/category_widget.dart';
import 'package:drixion/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryScreen extends StatelessWidget {
 const CategoryScreen({Key? key}) : super(key: key);

 @override
 Widget build(BuildContext context) {
   return Scaffold(
     backgroundColor: context.theme.backgroundColor,
     body: Padding(
       padding: const EdgeInsets.only(left: 15, top: 10),
       child: Column(
         children: [
           Align(
             alignment: Alignment.center,
             child: Padding(
               padding: const EdgeInsets.only(left: 15, top: 15),
               child: TextUtils(
                 color: Get.isDarkMode ? Colors.white : Colors.black,
                 fontSize: 30,
                 fontWeight: FontWeight.bold,
                 text: "Category",
                 underLine: TextDecoration.none,

               ),
             ),
           ),
           const SizedBox(
             height: 20,
           ),
           CategoryWidget(),
         ],
       ),
     ),
   );
 }
}
