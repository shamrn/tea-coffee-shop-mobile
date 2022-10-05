import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:tea_coffee_shop/models/product.dart';
import 'package:tea_coffee_shop/utils/app_constants.dart';

class ProductProvider {
  Future<List<Product>> getProduct() async {
    final http.Response response = await http.get(Uri.parse(
        '${ApiAccess.rootUrl}${ApiAccess.productsEndpoint}?limit=5&offset=0'));
    if (response.statusCode == 200) {
      final List<dynamic> productJson =
          json.decode(utf8.decode(response.bodyBytes))['results'];
      return productJson
          .map((json) => Product.fromJson(json))
          .toList();
    } else {
      throw Exception('Error fetching product');
    }
  }
}
