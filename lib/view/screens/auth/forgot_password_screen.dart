import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../logic/controllers/auth_controller.dart';
import '../../../utils/my_string.dart';
import '../../../utils/theme.dart';
import '../../widgets/auth/auth_button.dart';
import '../../widgets/auth/auth_text_form_field.dart';

class ForgotPasswordScreen extends StatelessWidget {
  ForgotPasswordScreen({Key? key}) : super(key: key);

  final formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();

  final controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Get.isDarkMode ? Colors.white : darkGreyClr,
        appBar: AppBar(
          backgroundColor: Get.isDarkMode ? Colors.white : darkGreyClr,
          centerTitle: true,
          elevation: 0,
          title: Text(
            'Forgot Password',
            style: TextStyle(
              color: Get.isDarkMode ? mainColor : pinkClr,
            ),
          ),
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.arrow_back,
              color: Get.isDarkMode ? Colors.black : Colors.white,
            ),
          ),
        ),
        body: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerRight,
                    child: IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: Icon(
                        Icons.close_rounded,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20,),
                  Text(
                    'If you want to recover your account, then please provide your email ID below..',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Get.isDarkMode ? Colors.black : Colors.white,
                    ),
                  ),
                  const SizedBox(height: 50,),
                  Image.asset(
                    'assets/images/forgetpass copy.png',
                    width: 250,
                  ),
                  const SizedBox(height: 50,),
                  AuthTextFormField(
                    controller: emailController,
                    obscureText: false,
                    validation: (value) {
                      validateEmail(value);
                    },
                    prefixIcon: Get.isDarkMode
                        ? Image.asset('assets/images/email.png')
                        : Icon(Icons.mail, color: pinkClr, size: 30),
                    suffixIcon: Text(""),
                    hintText: "Email",
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const SizedBox(height: 50,),
                  GetBuilder<AuthController>(
                    builder: (_) {
                      return AuthButton(
                        onPressed: () {
                          if(formKey.currentState!.validate()){
                            controller.resetPassword(emailController.text.trim());
                          }
                        },
                        text: "SEND",
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  validateEmail(String value) {
    if (!RegExp(validationEmail).hasMatch(value)) {
      return 'Invalid Email';
    } else {
      return null;
    }
  }
}
