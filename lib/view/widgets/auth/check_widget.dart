import 'package:e_commerce_app/logic/controllers/auth_controller.dart';
import 'package:e_commerce_app/utils/theme.dart';
import 'package:e_commerce_app/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class CheckWidget extends StatelessWidget {
  CheckWidget({Key? key}) : super(key: key);
  final controller = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(
        builder: (_){
      return Row(
        children: [
          InkWell(
            onTap: () {
              controller.checkBox();
            },
            child: Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey.shade200,
              ),
              child: controller.isCheckBox ?
              Get.isDarkMode ? Image.asset("assets/images/check.png"):
              Icon(Icons.done,color: pinkClr,) :
              Container(),
            ),
          ),
          SizedBox(width: 10,),
          Row(
            children:  [
              TextUtils(
                fontSize: 16,
                fontWeight: FontWeight.normal,
                text: 'I accept ',
                color: Get.isDarkMode ? Colors.black : Colors.white,
                underLine: TextDecoration.none,
              ),
              TextUtils(
                fontSize: 16,
                fontWeight: FontWeight.normal,
                text: 'terms & condition ',
                color: Get.isDarkMode ? Colors.black : Colors.white,
                underLine: TextDecoration.underline,
              ),
            ],
          )
        ],
      );
    });
  }
}
