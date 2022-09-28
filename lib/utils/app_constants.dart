import 'package:flutter/material.dart';

// Texts
class Texts {
  static String loadError =
      'Не удалось загрузить приложение. \nПовторите попытку позже.';
  static String searchHintText = 'Улун молочный & Чай ...';

  static String teaLinkTitle = 'Чай';
  static String coffeeLinkTitle = 'Кофе';
}

// Images
class Assets {
  static String splashScreen = 'assets/images/splash_screen_image.png';
  static String teaLink = 'assets/images/tea_link_image.png';
  static String coffeeLink = 'assets/images/coffee_link_image.png';
}

// Styles
class Styles {
  // Fonts
  static String montserratFont = 'Montserrat';

  // Colors
  static Color primaryGreenColor = const Color(0xFF344B31);
  static Color primaryOrangeColor = const Color(0xFFFFAA23);
  static Color primaryGreyColor = const Color(0xFF8B8F8F);
  static Color primaryLightGreyColor = const Color(0xFFB6BABA);

  // Paddings
  static EdgeInsets primaryPadding =
      const EdgeInsets.only(top: 20, bottom: 30, left: 22, right: 22);
}

// Api access
class ApiAccess {
  static String rootUrl = 'https://vladislav111.pythonanywhere.com/api/';

  // Endpoints
  static String categoriesEndpoint = 'products/categories/';
}
