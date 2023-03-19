import 'package:e_commerce_app/view/screens/auth/login_screen.dart';
import 'package:e_commerce_app/view/screens/auth/signup_screen.dart';
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
      page: ()=> const LoginScreen(),
    ),
    GetPage(
      name: Routes.sinUpScreen,
      page: ()=> const SignUpScreen(),
    ),
  ];
}

class Routes {
  static const welcomeScreen = '/WelcomeScreen';
  static const loginScreen = '/loginScreen';
  static const sinUpScreen = '/signUpScreen';
}
