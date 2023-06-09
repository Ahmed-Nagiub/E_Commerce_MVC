import 'package:e_commerce_app/model/product_models.dart';
import 'package:e_commerce_app/utils/my_string.dart';
import 'package:http/http.dart' as http;

class ProductServices {
  static Future<List<ProductModels>> getProducts() async {
    var response = await http.get(Uri.parse('$baseUrl/products'));
    if (response.statusCode == 200) {
      var jsonData = response.body;
      return productModelsFromJson(jsonData);
    } else {
      return throw Exception('Failed to load product');
    }
  }
}
