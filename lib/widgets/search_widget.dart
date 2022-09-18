import 'package:flutter/material.dart';
import 'package:tea_coffee_shop/utils/app_constants.dart';

class SearchWidget extends StatefulWidget {
  const SearchWidget({Key? key}) : super(key: key);

  @override
  State<SearchWidget> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 62,
      child: TextFormField(
        decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.search_outlined,
              color: Styles.primaryGreyColor,
              size: 32,
            ),
            suffixIcon: Image.asset(
              Assets.filter,
              fit: BoxFit.fill,
            ),
            hintText: Texts.searchHintText,
            hintMaxLines: 1,
            hintStyle:
                TextStyle(color: Styles.primaryLightGreyColor, fontSize: 16),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Styles.primaryLightGreyColor),
                borderRadius: const BorderRadius.all(Radius.circular(120))),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Styles.primaryOrangeColor),
                borderRadius: const BorderRadius.all(Radius.circular(120)))),
      ),
    );
  }
}
