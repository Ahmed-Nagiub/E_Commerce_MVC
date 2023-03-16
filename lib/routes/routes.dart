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
  ];
}

class Routes {
  static const welcomeScreen = '/WelcomeScreen';
}
