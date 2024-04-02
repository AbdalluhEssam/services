import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:services/core/constant/color.dart';
import 'package:services/core/functions/alertextiapp.dart';
import 'package:services/core/functions/validinput.dart';
import 'package:services/view/widget/auth/customtextbodyauth.dart';
import '../../../controller/auth/login_controller.dart';
import '../../../core/class/handlingdataview.dart';
import '../../widget/auth/custombuttonauth.dart';
import '../../widget/auth/customtextformauth.dart';
import '../../widget/auth/customtexttitleauth.dart';
import '../../widget/auth/logoauth.dart';
import '../../widget/auth/textsignup.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(LoginControllerImp());
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColor.backgroundColor,
          title: Text(
            "signin".tr,
            style: Theme.of(context)
                .textTheme
                .displayLarge
                ?.copyWith(color: AppColor.gray),
          ),
          elevation: 0,
          centerTitle: true,
        ),
        body: WillPopScope(
            onWillPop: alertExitApp,
            child: GetBuilder<LoginControllerImp>(
                builder: (controller) => HandlingDataRequest(
                    statusRequest: controller.statusRequest,
                    widget: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 30),
                      child: Form(
                        // autovalidateMode: AutovalidateMode.onChanged,
                        key: controller.formstate,
                        child: ListView(
                          children: [
                            const SizedBox(
                              height: 10,
                            ),
                            const LogoAuth(),
                            const SizedBox(
                              height: 20,
                            ),
                            CustomTextTitleAuth(title: "welcome".tr),
                            const SizedBox(
                              height: 10,
                            ),
                            CustomTextBodyAuth(
                              textBody: "par".tr,
                            ),
                            const SizedBox(
                              height: 40,
                            ),
                            CustomFormAuth(
                              isNamber: false,
                              valid: (val) {
                                controller.update();
                                return validInput(val!, 5, 100, "email");
                              },
                              onChanged: (val) {
                                controller.formstate.currentState!.validate();
                                return null;

                                // return  EmailValidator.validate(controller.email.text);
                              },
                              mycontroller: controller.email,
                              label: "email".tr,
                              hinttext: "hintemail".tr,
                              iconData: Icons.email_outlined,
                              // mycontroller: ,
                            ),
                            GetBuilder<LoginControllerImp>(
                              builder: (controller) => CustomFormAuth(
                                isNamber: false,
                                onTap: () {
                                  controller.showPassword();
                                },
                                obscureText: controller.isShowPassword,

                                valid: (val) {
                                  return validInput(val!, 5, 40, "password");
                                },
                                onChanged: (val) {
                                  controller.formstate.currentState!.validate();
                                  return null;

                                  // return  EmailValidator.validate(controller.email.text);
                                },
                                mycontroller: controller.password,
                                label: "password".tr,
                                hinttext: "hintpass".tr,
                                iconData: Icons.lock_outline,
                                // mycontroller: ,
                              ),
                            ),
                            InkWell(
                              child: SizedBox(
                                height: 48,
                                child: Text(
                                  "forget".tr,
                                  textAlign: TextAlign.end,
                                  style: const TextStyle(color: AppColor.gray),
                                ),
                              ),
                              onTap: () {
                                controller.goToForgetPassword();
                              },
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            CustomButtonAuth(
                                text: "signin".tr,
                                onPressed: () {
                                  controller.login();
                                }),
                            const SizedBox(
                              height: 30,
                            ),
                            SizedBox(
                              height: 48,
                              child: CustomTextSignUpOrIn(
                                text1: "have".tr,
                                text2: "signup".tr,
                                onTap: () {
                                  controller.goToSignUp();
                                },
                              ),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            // Row(
                            //   crossAxisAlignment: CrossAxisAlignment.center,
                            //   mainAxisAlignment: MainAxisAlignment.center,
                            //   children: [
                            //     buildMedia(
                            //         icon: Icons.facebook,
                            //         text: "Facebook",
                            //         onPressed: () async {
                            //           await controller.loginFacebook();
                            //         }),
                            //     buildMedia(
                            //         icon: MyFlutterApp.google,
                            //         text: "Google",
                            //         onPressed: () {
                            //           GoogleSignInController().login();
                            //         }),
                            //   ],
                            // ),
                          ],
                        ),
                      ),
                    )))));
  }
}
