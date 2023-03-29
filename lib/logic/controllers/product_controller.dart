import 'package:e_commerce_app/model/product_models.dart';
import 'package:e_commerce_app/services/product_services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ProductController extends GetxController {
  var productList = <ProductModels>[].obs;
  var favouritesList = <ProductModels>[].obs;
  var isLoading = true.obs;
  var storage = GetStorage();

  @override
  void onInit() {
    super.onInit();
    List? storedShipping = storage.read<List>('isFavouritesList');

    if (storedShipping != null) {
      favouritesList =
          storedShipping.map((e) => ProductModels.fromJson(e)).toList().obs;
    }
    getProduct();
  }

  void getProduct() async {
    var product = await ProductServices.getProducts();

    try {
      isLoading.value = true;
      if (product.isNotEmpty) {
        productList.addAll(product);
      }
    } finally {
      isLoading.value = false;
    }
  }

  void manageFavourites(int productId) async {
    var existingIndex =
        favouritesList.indexWhere((element) => element.id == productId);
    if (existingIndex >= 0) {
      favouritesList.removeAt(existingIndex);
      await storage.remove("isFavouritesList");
    } else {
      favouritesList
          .add(productList.firstWhere((element) => element.id == productId));
      await storage.write("isFavouritesList", favouritesList);
    }
  }

  bool isFavourites(int productId) {
    return favouritesList.any((element) => element.id == productId);
  }
}
