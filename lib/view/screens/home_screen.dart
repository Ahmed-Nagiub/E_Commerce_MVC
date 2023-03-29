import 'package:e_commerce_app/utils/theme.dart';
import 'package:e_commerce_app/view/widgets/home/card_items.dart';
import 'package:e_commerce_app/view/widgets/home/search_text_form.dart';
import 'package:e_commerce_app/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: Column(
          children: [
            Container(
              width: double.infinity,
              height: 180,
              decoration: BoxDecoration(
                color: Get.isDarkMode ? darkGreyClr : mainColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(25),
                  bottomRight: Radius.circular(25),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.only(left: 20,right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextUtils(
                      fontSize: 25,
                      fontWeight: FontWeight.normal,
                      text: 'Find Your',
                      color: Get.isDarkMode ? pinkClr : Colors.white,
                      underLine: TextDecoration.none,
                    ),
                    SizedBox(height: 5),
                    TextUtils(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      text: 'INSPIRATION',
                      color: Get.isDarkMode ? pinkClr : Colors.white,
                      underLine: TextDecoration.none,
                    ),
                    SizedBox(height: 20,),
                    SearchFormText(),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Align(
                alignment: Alignment.topLeft,
                child: TextUtils(fontSize: 20,
                  fontWeight: FontWeight.w500,
                  text: 'Categories',
                  color: Get.isDarkMode ? Colors.white : Colors.black,
                  underLine: TextDecoration.none,
                ),
              ),
            ),
            const SizedBox(height: 30),
            CardItems(),
          ],
        ),
      ),
    );
  }
}
