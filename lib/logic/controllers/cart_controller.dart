import 'package:e_commerce_app/model/product_models.dart';
import 'package:e_commerce_app/routes/routes.dart';
import 'package:e_commerce_app/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  var productsMap = {}.obs;

  get productSubTotal =>
      productsMap.entries.map((e) => e.key.price * e.value).toList();

  get total => productsMap.entries
      .map((e) => e.key.price * e.value)
      .toList()
      .reduce((value, element) => value + element)
      .toStringAsFixed(2);

  void addProductsToCart(ProductModels productModels) {
    if (productsMap.containsKey(productModels)) {
      productsMap[productModels] += 1;
    } else {
      productsMap[productModels] = 1;
    }
  }

  void removeProductsFromCart(ProductModels productModels) {
    if (productsMap.containsKey(productModels) &&
        productsMap[productModels] == 1) {
      productsMap.removeWhere((key, value) => key == productModels);
    } else {
      productsMap[productModels] -= 1;
    }
  }

  void removeOneProduct(ProductModels productModels) {
    productsMap.removeWhere((key, value) => key == productModels);
  }

  void clearAllProducts() {
    Get.defaultDialog(
      title: "Clean Products",
      titleStyle: const TextStyle(
        fontSize: 18,
        color: Colors.black,
        fontWeight: FontWeight.bold,
      ),
      middleText: 'Are you sure you need clear products',
      middleTextStyle: const TextStyle(
        fontSize: 18,
        color: Colors.black,
        fontWeight: FontWeight.bold,
      ),
      backgroundColor: Colors.grey,
      radius: 10,
      textCancel: " No ",
      cancelTextColor: Colors.white,
      textConfirm: " YES ",
      confirmTextColor: Colors.white,
      onCancel: () {
        Get.toNamed(Routes.cartScreen);
      },
      onConfirm: () {
        productsMap.clear();
        Get.back();
      },
      buttonColor: Get.isDarkMode ? pinkClr : mainColor,
    );
  }

  int quantity() {
    if (productsMap.isEmpty) {
      return 0;
    } else {
      return productsMap.entries
          .map((e) => e.value)
          .toList()
          .reduce((value, element) => value + element);
    }
  }
}
