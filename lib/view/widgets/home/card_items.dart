import 'package:e_commerce_app/logic/controllers/cart_controller.dart';
import 'package:e_commerce_app/logic/controllers/product_controller.dart';
import 'package:e_commerce_app/model/product_models.dart';
import 'package:e_commerce_app/utils/theme.dart';
import 'package:e_commerce_app/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              childAspectRatio: 0.8,
              mainAxisSpacing: 9.0,
              crossAxisSpacing: 6,
              maxCrossAxisExtent: 200,
            ),
            itemCount: controller.productList.length,
            itemBuilder: (context, index) {
              return buildCardItems(
                image: controller.productList[index].image,
                price: controller.productList[index].price,
                rate: controller.productList[index].rating.rate,
                productId: controller.productList[index].id,
                productModels: controller.productList[index],
              );
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
  }) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 3.0,
              blurRadius: 5.0,
            ),
          ],
        ),
        child: Column(
          children: [
            Obx(() => Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {
                    controller.manageFavourites(productId);
                  },
                  icon: controller.isFavourites(productId) ?
                  Icon(
                    Icons.favorite,
                    color: Colors.red,
                  ) : Icon(
                    Icons.favorite_outline,
                    color: darkGreyClr,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    cartController.addProductsToCart(productModels);
                  },
                  icon: Icon(
                    Icons.shopping_cart_sharp,
                    color: darkGreyClr,
                  ),
                ),
              ],
            ),
            ),
            Container(
              width: double.infinity,
              height: 140,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Image.network(
                image,
                fit: BoxFit.fitHeight,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "\$ $price",
                    style: const TextStyle(
                        color: darkGreyClr, fontWeight: FontWeight.bold),
                  ),
                  Container(
                    width: 45,
                    height: 20,
                    decoration: BoxDecoration(
                      color: Get.isDarkMode ? pinkClr : mainColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(left: 3, right: 2),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children:  [
                          TextUtils(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            text: '$rate',
                            color: Colors.white,
                            underLine: TextDecoration.none,
                          ),
                          const Icon(
                            Icons.star,
                            size: 13,
                            color: Colors.white,
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
