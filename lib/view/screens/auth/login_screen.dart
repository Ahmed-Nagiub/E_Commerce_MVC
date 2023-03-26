import 'package:e_commerce_app/logic/controllers/auth_controller.dart';
import 'package:e_commerce_app/routes/routes.dart';
import 'package:e_commerce_app/utils/my_string.dart';
import 'package:e_commerce_app/utils/theme.dart';
import 'package:e_commerce_app/view/widgets/auth/auth_button.dart';
import 'package:e_commerce_app/view/widgets/auth/auth_text_form_field.dart';
import 'package:e_commerce_app/view/widgets/container_under.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../widgets/text_utils.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  final formKey = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final controller = Get.find<AuthController>();


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: Container(),
          backgroundColor: Get.isDarkMode ? Colors.white : darkGreyClr,
          elevation: 0.0,
        ),
        backgroundColor: Get.isDarkMode ? Colors.white : darkGreyClr,
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
                          children:  [
                            TextUtils(
                              fontSize: 28,
                              fontWeight: FontWeight.w500,
                              text: "LOG",
                              color: Get.isDarkMode ? mainColor : pinkClr,
                              underLine: TextDecoration.none,
                            ),
                            SizedBox(width: 3,),
                            TextUtils(
                              fontSize: 28,
                              fontWeight: FontWeight.w500,
                              text: "IN",
                              color: Get.isDarkMode ? Colors.black : Colors.white,
                              underLine: TextDecoration.none,
                            ),
                          ],
                        ),
                        SizedBox(height: 50,),
                        AuthTextFormField(
                          controller: emailController,
                          obscureText: false,
                          validation: (value){
                            if(!RegExp(validationEmail).hasMatch(value)){
                              return 'Invalid Email';
                            }else{
                              return null;
                            }
                          },
                          prefixIcon: Get.isDarkMode ?Image.asset('assets/images/email.png'):
                          Icon(Icons.mail,color: pinkClr,size: 30),
                          suffixIcon: Text(""),
                          hintText: "Email",
                          keyboardType: TextInputType.emailAddress,
                        ),
                        SizedBox(height: 20,),
                        GetBuilder<AuthController>(
                          builder: (_){
                            return AuthTextFormField(
                              controller: passwordController,
                              obscureText: controller.isVisibility ? false : true,
                              validation: (value){
                                if(value.toString().length < 6){
                                  return 'Password should be longer or equal to 6 characters';
                                }else{
                                  return null;
                                }
                              },
                              prefixIcon: Get.isDarkMode ? Image.asset('assets/images/lock.png'):
                              Icon(Icons.lock,color: pinkClr,size: 30,),
                              suffixIcon: IconButton(
                                icon: controller.isVisibility ?
                                const Icon(Icons.visibility_off,color: Colors.black,):
                                const Icon(Icons.visibility,color: Colors.black,),
                                onPressed: () {
                                  controller.visibility();
                                } ,),
                              hintText: "Password",
                              keyboardType: TextInputType.text,
                            );
                          },
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(onPressed: (){
                            Get.toNamed(Routes.forgotPasswordScreen);
                          },
                              child: TextUtils(
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                                text: "Forgot Password?",
                                color:Get.isDarkMode ? Colors.black : Colors.white ,
                                underLine: TextDecoration.none,
                              ),
                          ),
                        ),
                        SizedBox(height: 50,),
                        GetBuilder<AuthController>(builder: (_){
                          return AuthButton(
                            onPressed: (){
                              if(formKey.currentState!.validate()){
                                String email = emailController.text.trim();
                                String password = passwordController.text;
                                controller.logInUsingFirebase(email: email, password: password);
                              }
                            },
                            text: "LOG IN",
                          );
                        }),
                        SizedBox(height: 20,),
                        TextUtils(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          text: "OR",
                          color: Get.isDarkMode ? Colors.black : Colors.white,
                          underLine: TextDecoration.none,
                        ),
                        SizedBox(height: 50,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: (){
                                controller.faceBookSignUpApp();
                              },
                              child: Image.asset("assets/images/facebook.png"),
                            ),
                            SizedBox(width: 15,),
                            GetBuilder<AuthController>(builder: (_){
                              return InkWell(
                                onTap: (){
                                  controller.googleSignUpApp();
                                },
                                child: Image.asset("assets/images/google.png"),
                              );
                            }),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              ContainerUnder(
                onPressed: () {
                  Get.offNamed(Routes.sinUpScreen);
                },
                text: "Don't have an Account? ",
                textType: "Sign Up",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
