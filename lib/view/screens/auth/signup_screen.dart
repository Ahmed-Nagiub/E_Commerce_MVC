import 'package:e_commerce_app/logic/controllers/auth_controller.dart';
import 'package:e_commerce_app/utils/my_string.dart';
import 'package:e_commerce_app/utils/theme.dart';
import 'package:e_commerce_app/view/widgets/auth/auth_button.dart';
import 'package:e_commerce_app/view/widgets/auth/auth_text_form_field.dart';
import 'package:e_commerce_app/view/widgets/auth/check_widget.dart';
import 'package:e_commerce_app/view/widgets/container_under.dart';
import 'package:e_commerce_app/view/widgets/text_utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../routes/routes.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);

  final formKey = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: AppBar(
          leading: Container(),
          backgroundColor: Get.isDarkMode ? darkGreyClr : Colors.white,
          elevation: 0.0,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                height: MediaQuery.of(context).size.height / 1.3,
                child: Padding(
                  padding: EdgeInsets.only(top: 40, left: 25, right: 25),
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            TextUtils(
                              fontSize: 28,
                              fontWeight: FontWeight.w500,
                              text: "SIGN",
                              color: Get.isDarkMode ? pinkClr : mainColor,
                              underLine: TextDecoration.none,
                            ),
                            SizedBox(
                              width: 3,
                            ),
                            TextUtils(
                              fontSize: 28,
                              fontWeight: FontWeight.w500,
                              text: "UP",
                              color:
                                  Get.isDarkMode ? Colors.white : Colors.black,
                              underLine: TextDecoration.none,
                            ),
                          ],
                        ),
                        SizedBox(height: 50),
                        AuthTextFormField(
                          controller: nameController,
                          obscureText: false,
                          validation: (value) {
                            if (value.toString().length <= 2 ||
                                !RegExp(validationName).hasMatch(value)) {
                              return 'Enter valid Name';
                            } else {
                              return null;
                            }
                          },
                          prefixIcon: Get.isDarkMode
                              ? Icon(Icons.person, color: pinkClr, size: 30)
                              : Image.asset('assets/images/user.png'),
                          suffixIcon: Text(""),
                          hintText: "User Name",
                          keyboardType: TextInputType.text,
                        ),
                        SizedBox(height: 20),
                        AuthTextFormField(
                          controller: emailController,
                          obscureText: false,
                          validation: (value) {
                            if (!RegExp(validationEmail).hasMatch(value)) {
                              return 'Invalid Email';
                            } else {
                              return null;
                            }
                          },
                          prefixIcon: Get.isDarkMode
                              ? Icon(Icons.mail, color: pinkClr, size: 30)
                              : Image.asset('assets/images/email.png'),
                          suffixIcon: Text(""),
                          hintText: "Email",
                          keyboardType: TextInputType.emailAddress,
                        ),
                        SizedBox(height: 20),
                        GetBuilder<AuthController>(
                          builder: (_) {
                            return AuthTextFormField(
                              controller: passwordController,
                              obscureText:
                                  controller.isVisibility ? false : true,
                              validation: (value) {
                                if (value.toString().length < 6) {
                                  return 'Password should be longer or equal to 6 characters';
                                } else {
                                  return null;
                                }
                              },
                              prefixIcon: Get.isDarkMode
                                  ? Icon(Icons.lock, color: pinkClr, size: 30)
                                  : Image.asset('assets/images/lock.png'),
                              suffixIcon: IconButton(
                                icon: controller.isVisibility
                                    ? const Icon(
                                        Icons.visibility_off,
                                        color: Colors.black,
                                      )
                                    : const Icon(
                                        Icons.visibility,
                                        color: Colors.black,
                                      ),
                                onPressed: () {
                                  controller.visibility();
                                },
                              ),
                              hintText: "Password",
                              keyboardType: TextInputType.text,
                            );
                          },
                        ),
                        SizedBox(height: 20),
                        CheckWidget(),
                        SizedBox(height: 50),
                        GetBuilder<AuthController>(
                          builder: (_) {
                            return AuthButton(
                              onPressed: () async {
                                if (controller.isCheckBox == false) {
                                  Get.snackbar(
                                    "Check Box",
                                    'Please, Accept terms & condition',
                                    snackPosition: SnackPosition.TOP,
                                    backgroundColor: Colors.grey.shade700,
                                    colorText: Colors.white,
                                  );
                                } else if (formKey.currentState!.validate()) {
                                  String name = nameController.text.trim();
                                  String email = emailController.text.trim();
                                  String password = passwordController.text;
                                  controller.signUpUsingFirebase(
                                    name: name,
                                    email: email,
                                    password: password,
                                  );
                                }
                              },
                              text: "SIGN UP",
                            );
                          },
                        )
                      ],
                    ),
                  ),
                ),
              ),
              ContainerUnder(
                onPressed: () {
                  Get.offNamed(Routes.loginScreen);
                },
                text: "Already have an Account? ",
                textType: "Log in",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
