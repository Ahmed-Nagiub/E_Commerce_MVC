import 'package:e_commerce_app/logic/bindings/auth_binding.dart';
import 'package:e_commerce_app/logic/bindings/main_binding.dart';
import 'package:e_commerce_app/view/screens/auth/forgot_password_screen.dart';
import 'package:e_commerce_app/view/screens/auth/login_screen.dart';
import 'package:e_commerce_app/view/screens/auth/signup_screen.dart';
import 'package:e_commerce_app/view/screens/main_screen.dart';
import 'package:e_commerce_app/view/screens/welcome_screen.dart';
import 'package:get/get.dart';

class AppRoutes {
  /// initialRoute
  static const welcome = Routes.welcomeScreen;

  /// getPages
  static final routes = [
    GetPage(
      name: Routes.welcomeScreen,
      page: ()=> const WelcomeScreen(),
    ),
    GetPage(
      name: Routes.loginScreen,
      page: ()=> LoginScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.sinUpScreen,
      page: ()=>  SignUpScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.forgotPasswordScreen,
      page: ()=>  ForgotPasswordScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.mainScreen,
      page: ()=>  MainScreen(),
      bindings: [
        AuthBinding(),
        MainBinding(),
      ],
    ),
  ];
}

class Routes {
  static const welcomeScreen = '/WelcomeScreen';
  static const loginScreen = '/loginScreen';
  static const sinUpScreen = '/signUpScreen';
  static const forgotPasswordScreen = '/forgotPasswordScreen';
  static const mainScreen = '/mainScreen';
}
