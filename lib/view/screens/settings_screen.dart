import 'package:e_commerce_app/utils/theme.dart';
import 'package:e_commerce_app/view/widgets/settings/dark_mode_widget.dart';
import 'package:e_commerce_app/view/widgets/settings/language_widget.dart';
import 'package:e_commerce_app/view/widgets/settings/logout_widget.dart';
import 'package:e_commerce_app/view/widgets/settings/profile_widget.dart';
import 'package:e_commerce_app/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: ListView(
          padding: EdgeInsets.all(24),
          children: [
            ProfileWidget(),
            const SizedBox(height: 10),
            Divider(
              thickness: 2,
              color: Get.isDarkMode ? Colors.white : Colors.grey,
            ),
            const SizedBox(height: 20),
            TextUtils(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              text: "GENERAL",
              color: Get.isDarkMode ? pinkClr : mainColor,
              underLine: TextDecoration.none,
            ),
            const SizedBox(height: 20),
            DarkModeWidget(),
            const SizedBox(height: 20),
            LanguageWidget(),
            const SizedBox(height: 20),
            LogOutWidget(),
          ],
        ),

        // body: Center(
        //   child: Column(
        //     mainAxisAlignment: MainAxisAlignment.center,
        //     children: [
        //       TextButton(
        //         onPressed: (){
        //           ThemeController().changesTheme();
        //         },
        //         child: Text(Get.isDarkMode ? "Dark Mode" : "Light Mode",
        //           style: TextStyle(color: Get.isDarkMode ? Colors.white : darkGreyClr),),
        //       ),
        //       SizedBox(height: 20),
        //       GetBuilder<AuthController>(
        //           builder: (controller){
        //         return TextButton(
        //           onPressed: (){
        //             Get.defaultDialog(
        //               title: 'Logout From App',
        //               middleText: 'Are you sure you want to log out',
        //               middleTextStyle: TextStyle(
        //                   color:Get.isDarkMode ? Colors.white : Colors.black),
        //               radius: 10,
        //               textCancel: "No",
        //               onCancel: (){
        //                 Get.back();
        //               },
        //               textConfirm: "Yes",
        //               onConfirm: (){
        //                 controller.signOutFromApp();
        //               },
        //               buttonColor: Get.isDarkMode ? pinkClr : mainColor
        //             );
        //           },
        //           child: Text("Log Out",
        //             style: TextStyle(color: Get.isDarkMode ? Colors.white : darkGreyClr),),
        //         );
        //       })
        //     ],
        //   ),
        // ),
      ),
    );
  }
}
