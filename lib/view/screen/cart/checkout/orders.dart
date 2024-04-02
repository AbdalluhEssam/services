import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/constant/color.dart';
import '../../../../core/constant/routes.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: AppColor.primaryColor,
        elevation: 0,
        title: Text("orders".tr),
        centerTitle: true,
        backgroundColor: AppColor.backgroundColor,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: ListView(children: [
          CardHome(
              text: "Order",
              iconData: "assets/images/glu.png",
              onTap: () {
                Get.toNamed(AppRoute.orderProduct);
              }),
          CardHome(
              text: 'Services',
              iconData: "assets/images/glus.png",
              onTap: () {
                Get.toNamed(AppRoute.orderGlus);
              }),
        ]),
      ),
    );
  }
}

class CardHome extends StatelessWidget {
  final String iconData;
  final String text;
  final void Function()? onTap;
  const CardHome({
    Key? key,
    required this.iconData,
    required this.text,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return InkWell(
      onTap: onTap,
      child: Card(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18.0),
        ),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Image.asset(
                iconData,
                fit: BoxFit.contain,
                // width: size.width,
                height: size.width * 0.4,
                // fit: BoxFit.cover,
                // color: AppColor.primaryColor.withOpacity(0.8),
              ),
              // const Spacer(),
              Text(
                text,
                style: TextStyle(
                    fontSize: size.width * 0.05, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
