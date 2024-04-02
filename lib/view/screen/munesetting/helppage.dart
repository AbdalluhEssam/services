import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:services/core/constant/color.dart';
import 'package:url_launcher/url_launcher.dart';

class HelpPage extends StatelessWidget {
  const HelpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColor.backgroundColor,
        foregroundColor: AppColor.primaryColor,
        centerTitle: true,
        title: Text("help".tr),
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  color: AppColor.primaryColor,
                  height: 2,
                  width: 300,
                  margin: const EdgeInsets.symmetric(vertical: 10),
                ),
                Card(
                  margin: const EdgeInsets.all(8),
                  child: buildMenuItem(
                      icon: Icons.phone_outlined,
                      text: "ph011".tr,
                      onClicked: () {
                        calling();
                      }),
                ),
                Container(
                  color: AppColor.primaryColor,
                  height: 2,
                  width: 300,
                  margin: const EdgeInsets.symmetric(vertical: 10),
                ),
                Card(
                  margin: const EdgeInsets.all(8),
                  child: buildMenuItem(
                      icon: Icons.mail,
                      text: "info@sg-egypt.com",
                      onClicked: () {
                        sentMail();
                      }),
                ),
                Container(
                  color: AppColor.primaryColor,
                  height: 2,
                  width: 300,
                  margin: const EdgeInsets.symmetric(vertical: 10),
                ),
                const SizedBox(
                  height: 280,
                ),
                Container(
                  padding: const EdgeInsets.only(top: 50),
                  child: const Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [Text("Glu's Family | ©2022")],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  calling() async {
    const url = 'tel:01148400177';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not lanuch $url';
    }
  }

  sentMail() async {
    String? encodeQueryParameters(Map<String, String> params) {
      return params.entries
          .map((MapEntry<String, String> e) =>
              '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
          .join('&');
    }

// ···
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: 'info@sg-egypt.com',
      query: encodeQueryParameters(<String, String>{
        'subject': 'Welcome To glu',
      }),
    );
    launchUrl(emailLaunchUri);
  }
}

Widget buildMenuItem({
  required String text,
  required IconData icon,
  VoidCallback? onClicked,
}) {
  const color = AppColor.primaryColor;
  const hoverColor = AppColor.black;
  return ListTile(
    leading: Icon(
      icon,
      color: color,
    ),
    title: Text(
      text,
      style: const TextStyle(color: hoverColor),
    ),
    hoverColor: hoverColor,
    onTap: onClicked,
  );
}
