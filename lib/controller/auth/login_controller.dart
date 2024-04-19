import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:services/core/constant/color.dart';
import 'package:services/core/constant/routes.dart';
import 'package:services/data/datasource/remote/auth/login.dart';
import '../../core/class/statusrequest.dart';
import '../../core/functions/handlingdatacontroller.dart';
import '../../core/services/services.dart';

abstract class LoginController extends GetxController {
  login();

  goToSignUp();

  goToForgetPassword();
}

class LoginControllerImp extends LoginController {
  LoginData loginData = LoginData(Get.find());
  Map user = {};
  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  late TextEditingController email;
  late TextEditingController password;

  RegExp emailRegex = RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$');
  bool isValidEmail = false;

  StatusRequest statusRequest = StatusRequest.none;

  bool isShowPassword = true;
  MyServices myServices = Get.find();

  showPassword() {
    isShowPassword = isShowPassword == true ? false : true;
    update();
  }

  loginFacebook() {
    // await FacebookAuth.instance.login(
    //   permissions: ["public_profile","email"]).then((value) => FacebookAuth.instance.getUserData().then((userData) async{
    //     user = userData;
    // }));
    // // await FacebookAuth.instance.webAndDesktopInitialize(
    // //   appId: "1082283402438136",
    // //   cookie: true,
    // //   xfbml: true,
    // //   version: "v15.0",
    // // );
  }

  @override
  login() async {
    if (formstate.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await loginData.postData(
          password.text.trim(), email.text.trimLeft().trimRight());
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          if (response['data']['users_approve'] == "1") {
            myServices.sharedPreferences.setString("id", response['data']['users_id'].toString());
            myServices.sharedPreferences.setString("admin", response['data']['admin'].toString());
            myServices.sharedPreferences
                .setString("username", response['data']['users_name']);
            myServices.sharedPreferences
                .setString("email", response['data']['users_email']);
            myServices.sharedPreferences
                .setString("phone", response['data']['users_phone']);
            myServices.sharedPreferences.setString("step", "2");

            Get.snackbar(
                "${myServices.sharedPreferences.getString("username")} ",
                "signupmass".tr,
                icon: const Icon(Icons.account_circle_rounded),
                barBlur: 2,
                margin: EdgeInsets.zero,
                backgroundColor: AppColor.primaryColor.withOpacity(0.4),
                isDismissible: true,
                duration: const Duration(seconds: 3),
                colorText: AppColor.black,
                borderRadius: 0);
          } else {
            Get.offNamed(AppRoute.verfiyCodeSignUp, arguments: {
              "email": email.text,
            });
          }
        } else {
          Get.defaultDialog(
              title: "Warning", middleText: " Email Or Password Not Correct");
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    } else {}
  }

  @override
  goToSignUp() {
    Get.offNamed(AppRoute.signup);
  }

  @override
  void onInit() {
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  goToForgetPassword() {
    Get.toNamed(AppRoute.forgetPassword);
  }
}


// class GoogleSignInController with ChangeNotifier {
//   final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: [
//     'email',
//     'https://www.googleapis.com/auth/contacts.readonly',
//   ]);
//
//   GoogleSignInAccount? googleAccount;
//
//   Future<void> login() async {
//     try {
//       googleAccount = await _googleSignIn.signIn();
//       if (googleAccount == null) {
//         // User canceled the sign-in process
//         return;
//       }
//
//       final GoogleSignInAuthentication auth = await googleAccount!.authentication;
//
//       // TODO: Add your logic to handle authentication data (e.g., send to backend)
//
//       notifyListeners();
//     } catch (error) {
//       // Handle the sign-in error
//       print('Google Sign-In Error: $error');
//       // You may want to show an error message to the user
//     }
//   }
//
//   Future<void> logout() async {
//     await _googleSignIn.signOut();
//     googleAccount = null;
//     notifyListeners();
//   }
// }

