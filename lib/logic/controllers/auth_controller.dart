import 'package:e_commerce_app/model/facebook_model.dart';
import 'package:e_commerce_app/routes/routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthController extends GetxController {
  bool isVisibility = false;
  bool isCheckBox = false;
  FirebaseAuth auth = FirebaseAuth.instance;
  var displayUserName = ''.obs;
  var displayUserPhoto = ''.obs;
  var displayUserEmail = ''.obs;
  GoogleSignIn googleSignIn = GoogleSignIn();
  FaceBookModel? faceBookModel;
  var isSignedIn = false;
  final GetStorage authBox = GetStorage();

  User? get userProfile => auth.currentUser;

  @override
  void onInit() {
    displayUserName.value =
    (userProfile != null ? userProfile!.displayName : "")!;
    //displayUserPhoto.value = (userProfile != null ? userProfile!.photoURL : "")!;
    displayUserEmail.value = (userProfile != null ? userProfile!.email : "")!;

    super.onInit();
  }

  void visibility() {
    isVisibility = !isVisibility;
    update();
  }

  void checkBox() {
    isCheckBox = !isCheckBox;
    update();
  }

  void signUpUsingFirebase(
      {required String name,
      required String email,
      required String password}) async {
    try {
      await auth
          .createUserWithEmailAndPassword(
            email: email,
            password: password,
          )
          .then((value) => {
                displayUserName.value = name,
                auth.currentUser!.updateDisplayName(name),
              });

      update();
      Get.offNamed(Routes.mainScreen);
    } on FirebaseAuthException catch (error) {
      String title = error.code.replaceAll(RegExp('-'), ' ').capitalize!;
      String message = '';
      if (error.code == 'weak-password') {
        message = 'The password provided is too weak.';
      } else if (error.code == 'email-already-in-use') {
        message = 'The account already exists for that email.';
      } else {
        message = error.message.toString();
      }
      Get.snackbar(title, message,
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.grey.shade700,
          colorText: Colors.white);
    } catch (error) {
      Get.snackbar(
        "Error!",
        error.toString(),
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.grey.shade700,
        colorText: Colors.white,
      );
    }
  }

  void logInUsingFirebase(
      {required String email, required String password}) async {
    try {
      await auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) => displayUserName == auth.currentUser!.displayName!);
      isSignedIn = true;
      authBox.write('auth', isSignedIn);
      update();
      Get.offNamed(Routes.mainScreen);
    } on FirebaseAuthException catch (error) {
      String title = error.code.replaceAll(RegExp('-'), ' ').capitalize!;
      String message = '';
      if (error.code == 'user-not-found') {
        message = 'No user found for that email.';
      } else if (error.code == 'wrong-password') {
        message = 'Wrong password provided for that user.';
      } else {
        error.message.toString();
      }
      Get.snackbar(title, message,
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.grey.shade700,
          colorText: Colors.white);
    } catch (error) {
      Get.snackbar(
        "Error!",
        error.toString(),
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.grey.shade700,
        colorText: Colors.white,
      );
    }
  }

  void googleSignUpApp() async {
    try {
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
      displayUserName.value = googleUser!.displayName!;
      displayUserPhoto.value = googleUser.photoUrl!;
      displayUserEmail.value = googleUser.email;

      GoogleSignInAuthentication googleSignInAuthentication =
      await googleUser.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        idToken: googleSignInAuthentication.idToken,
        accessToken: googleSignInAuthentication.accessToken,
      );

      await auth.signInWithCredential(credential);


      isSignedIn = true;
      authBox.write('auth', isSignedIn);
      update();
      Get.offNamed(Routes.mainScreen);
    } catch (error) {
      Get.snackbar(
        "Error!",
        error.toString(),
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.grey.shade700,
        colorText: Colors.white,
      );
    }
  }

  void faceBookSignUpApp() async {
    final LoginResult loginResult = await FacebookAuth.instance.login();
    // final accesToken = loginResult.accessToken!.token;
    // final credential = FacebookAuthProvider.credential(accesToken);
    // await auth.signInWithCredential(credential);

    if (loginResult.status == LoginStatus.success) {
      final data = await FacebookAuth.instance.getUserData();
      faceBookModel = FaceBookModel.fromJson(data);
      // displayUserPhoto.value = faceBookModel!.faceBookPhotoModel!.url!;
      // displayUserEmail.value = faceBookModel!.email!;
      // displayUserName.value = faceBookModel!.name!;
      isSignedIn = true;
      authBox.write("auth", isSignedIn);
      update();
      Get.offNamed(Routes.mainScreen);
    }
  }

  void resetPassword(String email) async {
    try {
      await auth.sendPasswordResetEmail(email: email);
      update();
      Get.back();
    } on FirebaseAuthException catch (error) {
      String title = error.code.replaceAll(RegExp('-'), ' ').capitalize!;
      String message = '';
      if (error.code == 'user-not-found') {
        message = 'No user found for that email.';
      } else {
        error.message.toString();
      }
      Get.snackbar(title, message,
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.grey.shade700,
          colorText: Colors.white);
    } catch (error) {
      Get.snackbar(
        "Error!",
        error.toString(),
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.grey.shade700,
        colorText: Colors.white,
      );
    }
  }

  void signOutFromApp() async {
    try{
      await auth.signOut();
      await googleSignIn.signOut();
      await FacebookAuth.i.logOut();
      displayUserName.value = '';
      displayUserPhoto.value = '';
      isSignedIn = false;
      authBox.remove('auth');
      update();
      Get.offAllNamed(Routes.welcomeScreen);
    }catch(error){
      Get.snackbar(
        "Error!",
        error.toString(),
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.grey.shade700,
        colorText: Colors.white,
      );
    }
  }
}
