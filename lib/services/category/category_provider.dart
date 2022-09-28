import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:tea_coffee_shop/models/category.dart';
import 'package:tea_coffee_shop/utils/app_constants.dart';

class CategoryProvider {
  Future<List<Category>> getCategory() async {
    final http.Response response =
        await http.get(Uri.parse(ApiAccess.rootUrl + ApiAccess.categoriesEndpoint));
    if (response.statusCode == 200) {
      final List<dynamic> categoryJson =
          json.decode(utf8.decode(response.bodyBytes));
      return categoryJson.map((json) => Category.fromJson(json)).toList();
    } else {
      throw Exception('Error fetching category');
    }
  }
}
