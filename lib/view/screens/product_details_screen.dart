import 'package:e_commerce_app/model/product_models.dart';
import 'package:e_commerce_app/view/widgets/productDetails/clothes_info.dart';
import 'package:e_commerce_app/view/widgets/productDetails/image_sliders.dart';
import 'package:e_commerce_app/view/widgets/productDetails/size_list.dart';
import 'package:flutter/material.dart';

import '../widgets/productDetails/add_cart.dart';

class ProductDetailsScreen extends StatelessWidget {
  final ProductModels productModels;
  const ProductDetailsScreen({Key? key, required this.productModels}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ImageSlider(
                imageUrl: productModels.image,
              ),
              ClothesInfo(
                title: productModels.title,
                productId: productModels.id,
                rate: productModels.rating.rate,
                description: productModels.description,
              ),
              SizeList(),
              AddCart(
                productModels: productModels,
                price: productModels.price,
              ),
            ],
          ),
        )
      ),
    );
  }
}
