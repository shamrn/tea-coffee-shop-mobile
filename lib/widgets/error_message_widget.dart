import 'package:flutter/material.dart';
import 'package:tea_coffee_shop/utils/app_constants.dart';

class ErrorMessageWidget extends StatelessWidget {
  const ErrorMessageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(20.0))
      ),
      elevation: 20,
      insetPadding: EdgeInsets.zero,
      backgroundColor: Colors.white.withOpacity(0.5),
      content: Text(
        Texts.loadError,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        maxLines: 2,
        softWrap: false,
      ),
    );
  }
}
