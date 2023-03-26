import 'package:e_commerce_app/routes/routes.dart';
import 'package:e_commerce_app/utils/theme.dart';
import 'package:e_commerce_app/view/screens/auth/login_screen.dart';
import 'package:e_commerce_app/view/screens/auth/signup_screen.dart';
import 'package:e_commerce_app/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Stack(
        children: [
          Container(
            child: Image.asset(
              'assets/images/background.png',
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            color: Colors.black.withOpacity(0.2),
            width: double.infinity,
            height: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: MediaQuery.of(context).size.height*0.25),
                Container(
                  width: MediaQuery.of(context).size.width * 0.70,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.4),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: const Center(
                    child: TextUtils(
                      text: 'Welcome',
                      color: Colors.white,
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      underLine: TextDecoration.none,
                    ),
                  ),
                ),
                SizedBox(height: 8),
                Container(
                  width: MediaQuery.of(context).size.width * 0.80,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.4),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child:  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        TextUtils(
                          text: 'Asroo',
                          color: mainColor,
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                          underLine: TextDecoration.none,
                        ),
                        SizedBox(width: 7,),
                        TextUtils(
                          text: 'shop',
                          color: Colors.white,
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                          underLine: TextDecoration.none,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height*0.25),
                SizedBox(
                  height: 60,
                  width: 190,
                  child: ElevatedButton(onPressed: (){
                    Get.offNamed(Routes.loginScreen);
                  }, child: TextUtils(
                      fontSize: 15, fontWeight: FontWeight.bold, text: 'Get Start', color: Colors.white,
                      underLine: TextDecoration.none),
                    style:  ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(mainColor),
                    shape: MaterialStatePropertyAll(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),),),
                  ),),
                ),
                SizedBox(height: MediaQuery.of(context).size.height/10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:  [
                    const TextUtils(fontSize: 15, fontWeight: FontWeight.normal,
                        text: "Don't have an Account?", color: Colors.white,underLine: TextDecoration.none),
                    TextButton(onPressed:(){
                      Get.offNamed(Routes.sinUpScreen);
                    }, child: TextUtils(fontSize: 15, fontWeight: FontWeight.normal,
                        text: "Sign up", color: Colors.white,underLine: TextDecoration.underline,))
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
