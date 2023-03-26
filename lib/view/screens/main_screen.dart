import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../logic/controllers/main_controller.dart';
import '../../routes/routes.dart';
import '../../utils/theme.dart';

class MainScreen extends StatelessWidget {
  MainScreen({Key? key}) : super(key: key);

  final controller = Get.find<MainController>();


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          leading: Container(),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Image.asset('assets/images/shop.png'),
            ),
          ],
          backgroundColor: Get.isDarkMode ? mainColor : darkGreyClr ,
          title: Text("Asroo Shop"),
          centerTitle: true,
        ),
        backgroundColor: Get.isDarkMode ? mainColor : darkGreyClr ,
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Get.isDarkMode ? Colors.white : darkGreyClr,
          currentIndex: 0,
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
              activeIcon: Icon(
                Icons.home,
                color: Get.isDarkMode ? mainColor : pinkClr,
              ),
              icon: Icon(
                Icons.home,
                color: Get.isDarkMode ? Colors.black : Colors.white,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              activeIcon: Icon(
                Icons.category,
                color: Get.isDarkMode ? pinkClr : mainColor,
              ),
              icon: Icon(
                Icons.category,
                color: Get.isDarkMode ? Colors.black : Colors.white,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              activeIcon: Icon(
                Icons.favorite,
                color: Get.isDarkMode ? pinkClr : mainColor,
              ),
              icon: Icon(
                Icons.favorite,
                color: Get.isDarkMode ? Colors.black : Colors.white,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              activeIcon: Icon(
                Icons.settings,
                color: Get.isDarkMode ? pinkClr : mainColor,
              ),
              icon: Icon(
                Icons.settings,
                color: Get.isDarkMode ? Colors.black : Colors.white,
              ),
              label: '',
            ),
          ],
          onTap: (index) {},
        ),
      ),
    );
  }
}
