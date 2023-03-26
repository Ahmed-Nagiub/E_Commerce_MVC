import 'package:e_commerce_app/utils/theme.dart';
import 'package:e_commerce_app/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class AuthButton extends StatelessWidget {
  final Function() onPressed;
  final String text;
  const AuthButton({Key? key, required this.onPressed, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Get.isDarkMode ? mainColor : pinkClr,
          minimumSize: const Size(360, 50),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          )
        ),
        onPressed: onPressed,
        child: TextUtils(
          fontSize: 18,
          fontWeight: FontWeight.normal,
          text: text,
          color: Colors.white,
          underLine: TextDecoration.none,
        ));
  }
}
