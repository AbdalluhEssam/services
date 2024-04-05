import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome_icons.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:services/controller/home/personinformation_controller.dart';
import 'package:services/core/constant/color.dart';
import 'package:services/core/constant/my_flutter_app_icons.dart';
import 'package:services/core/constant/routes.dart';
import 'package:lottie/lottie.dart';
import 'package:url_launcher/url_launcher_string.dart';

class PersonInformation extends StatelessWidget {
  const PersonInformation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Get.put(PersonInfoControllerImp());
    return Scaffold(
      body: GetBuilder<PersonInfoControllerImp>(
          init: Get.put(PersonInfoControllerImp()),
          builder: (controller) => Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                child: ListView(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      alignment: Alignment.center,
                      child: Text(
                        "welcomeglus".tr,
                        style: Theme.of(context).textTheme.headline1,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      color: AppColor.primaryColor,
                      height: 2,
                      width: size.width * 0.25,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    InkWell(
                      onTap: () {},
                      child: BuildHeader(
                        name: "${controller.username}",
                        email: "${controller.email}",
                        size: size,
                        onClicked: () {},
                        // Navigator.of(context).push(MaterialPageRoute(
                        //   builder: (context) => UserPage(
                        //     name: name,
                        //     image: image,
                        //   ),
                      ),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Container(
                      color: AppColor.primaryColor,
                      height: 2,
                      width: size.width * 0.25,
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    const Divider(
                      color: Colors.white70,
                    ),
                    buildMenuItem(
                        icon: Icons.language_rounded,
                        text: "language".tr,
                        onClicked: () {
                          Get.toNamed(AppRoute.language);
                        }),
                    buildMenuItem(
                        icon: Icons.location_on_outlined,
                        text: "address".tr,
                        onClicked: () {
                          Get.toNamed(AppRoute.addressView);
                        }),
                    buildMenuItem(
                        icon: Icons.info_outline,
                        text: "about".tr,
                        onClicked: () {
                          Get.toNamed(AppRoute.aboutUs);
                        }),
                    buildMenuItem(
                        icon: Icons.help_outline,
                        text: "help".tr,
                        onClicked: () {
                          Get.toNamed(AppRoute.helpPage);
                        }),
                    const SizedBox(
                      height: 24,
                    ),
                    Container(
                      color: AppColor.primaryColor,
                      height: 2,
                      width: size.width * 0.25,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    buildMenuItem(
                        icon: Icons.exit_to_app,
                        text: "logout".tr,
                        onClicked: () {
                          controller.myServices.sharedPreferences.clear();
                          Get.offAllNamed(AppRoute.login);
                        }),
                    SizedBox(
                      width: size.width * 0.70,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          buildMedia(
                              icon: Icons.facebook,
                              text: "Facebook",
                              onPressed: () {
                                facebook();
                              }),
                          buildMedia(
                              icon: MyFlutterApp.instagram,
                              text: "Instagram",
                              onPressed: () {
                                instagram();
                              }),
                          buildMedia(
                              icon: FontAwesome.whatsapp,
                              text: "Whatsapp",
                              onPressed: () {
                                whatsapp();
                              }),
                          buildMedia(
                              icon: FontAwesome.google,
                              text: "Website",
                              onPressed: () {
                                webSite();
                              }),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    const Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [Text("Abdo Eslam | ©2024")],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              )),
    );
  }

  whatsapp() async {
    const url = "whatsapp://send?phone=+2001153626061";
    await launchUrlString(url);
  }

  facebook() async {
    const url = 'https://www.facebook.com/glusfamily';
    await launchUrlString(url);
  }

  instagram() async {
    const url = 'https://instagram.com/glus.eg?igshid=YmMyMTA2M2Y=';
    await launchUrlString(url);
  }

  webSite() async {
    const url = 'https://sg-egypt.com/glus/appointment';
    await launchUrlString(url);
  }
}

Widget buildMenuItem({
  required String text,
  required IconData icon,
  VoidCallback? onClicked,
}) {
  const color = AppColor.black;
  const hoverColor = AppColor.black;
  return ListTile(
    leading: Icon(
      icon,
      color: color,
    ),
    title: Text(
      text,
      style: const TextStyle(color: color),
    ),
    hoverColor: hoverColor,
    onTap: onClicked,
  );
}

Widget buildMedia(
    {required String text,
    required IconData icon,
    void Function()? onPressed}) {
  const color = AppColor.primaryColor;
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 10),
    child: Column(
      children: [
        IconButton(
          onPressed: onPressed,
          iconSize: 30,
          icon: Icon(
            icon,
            color: color,
          ),
        ),
        Text(
          text,
          style: const TextStyle(color: AppColor.gray, fontSize: 10),
        ),
      ],
    ),
  );
}

class BuildHeader extends StatelessWidget {
  const BuildHeader({
    Key? key,
    required this.size,
    required this.name,
    required this.email,
    required Null Function() onClicked,
  }) : super(key: key);

  final Size size;
  final String name;
  final String email;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
        child: Row(
          children: [
            const CircleAvatar(
              backgroundColor: AppColor.backgroundColor,
              radius: 24,
              child: Icon(
                Icons.person,
                color: AppColor.black,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(fontSize: 15, color: AppColor.black),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                Text(
                  email,
                  style: const TextStyle(
                    fontSize: 12,
                    color: AppColor.black,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
