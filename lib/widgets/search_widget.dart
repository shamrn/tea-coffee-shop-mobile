import 'package:flutter/material.dart';
import 'package:tea_coffee_shop/utils/app_constants.dart';

class SearchWidget extends StatefulWidget {
  const SearchWidget({Key? key}) : super(key: key);

  @override
  State<SearchWidget> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {

  static const primarySize = 62.0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: primarySize,
      child: TextFormField(
        decoration: InputDecoration(
            suffixIcon: ClipOval(
              child: Material(
                color: Styles.primaryOrangeColor,
                child: InkWell(
                  splashColor: Styles.primaryGreenColor,
                  splashFactory: InkRipple.splashFactory,
                  onTap: () {},
                  child: SizedBox(
                    width: primarySize,
                    height: primarySize,
                    child: Icon(
                      Icons.search,
                      color: Styles.primaryWhiteColor,
                      size: 35,
                    ),
                  ),
                ),
              ),
            ),
            hintText: Texts.searchHintText,
            hintMaxLines: 1,
            hintStyle:
                TextStyle(color: Styles.primaryLightGreyColor, fontSize: 18),
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
