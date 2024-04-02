import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome_icons.dart';
import 'package:get/get.dart';
import 'package:services/core/constant/color.dart';
import 'package:services/view/screen/home/personinformation.dart';
import 'package:url_launcher/url_launcher_string.dart';
import '../../../../controller/home/glus/gllusevent_controller.dart';
import '../../../../core/functions/validinput.dart';
import '../../../widget/home/custotextfiledglus.dart';

class GlusEventOrder extends StatelessWidget {
  const GlusEventOrder({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GlusEventControllerImp controller = Get.put(GlusEventControllerImp());
    return Scaffold(
        appBar: AppBar(
          title: const Text("اطلب الايفنت الخاص بيك",
              style: TextStyle(fontSize: 18), textAlign: TextAlign.center),
        ),
        backgroundColor: AppColor.bg,
        bottomNavigationBar: Container(
          width: double.infinity,
          // color: Colors.brown[200],
          margin: const EdgeInsets.symmetric(horizontal: 90, vertical: 10),
          child: MaterialButton(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            color: AppColor.kSecondaryColor,
            onPressed: () {
              if (controller.formState.currentState!.validate()) {
                controller.addOrder();
              }
            },
            textColor: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Text("addservice".tr), const Icon(Icons.add)],
            ),
          ),
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: AppColor.kBackgroundColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CachedNetworkImage(
                    imageUrl:"https://scontent.fcai19-7.fna.fbcdn.net/v/t39.30808-6/386195577_222305960844300_8361922917310652352_n.jpg?_nc_cat=107&ccb=1-7&_nc_sid=5f2048&_nc_ohc=MxP0WoxEgWgAX9GTIgo&_nc_ht=scontent.fcai19-7.fna&oh=00_AfBCYcbGX4-3V7Vf4waC-CQg9IyYGU26PfTqJRXxd0rOBg&oe=6561F04C",
                    fit: BoxFit.cover,
                    width: Get.width,
                    height: Get.width * 0.75,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 20),
                    child: Text(
                      "اختر نوع الحفل".tr,
                      // style: Theme.of(context).textTheme.headline1,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Form(
                      key: controller.formState,
                      child: Padding(
                          padding:
                          const EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            children: [
                              CustomFormGlus(
                                  hinttext: "نوع الحفل".tr,
                                  iconData: Icons.event,
                                  label: "نوع الحفل".tr,
                                  valid: (val) {
                                    return validInput(
                                        val!, 1, 40, "serviceType");
                                  },
                                  mycontroller: controller.serviceType),
                              const SizedBox(
                                height: 20,
                              ),
                              CustomFormGlus(
                                  hinttext: "مكان الحفل".tr,
                                  iconData: Icons.calculate_outlined,
                                  label: "مكان الحفل".tr,
                                  valid: (val) {
                                    return validInput(val!, 1, 40, "data");
                                  },
                                  mycontroller: controller.data),
                              const SizedBox(
                                height: 20,
                              ),
                              CustomFormGlus(
                                  hinttext: "الحد الاقصى لمبلغ الحفل".tr,
                                  iconData: Icons.price_change_outlined,
                                  label: "الحد الاقصى لمبلغ الحفل".tr,
                                  valid: (val) {
                                    return validInput(val!, 1, 40, "hour");
                                  },
                                  mycontroller: controller.hour),
                              const SizedBox(
                                height: 20,
                              ),
                            ],
                          ))),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: CustomFormGlus(
                        hinttext: "note".tr,
                        iconData: Icons.note,
                        label: "note".tr,
                        number: false,
                        valid: (val) {
                          return validInput(val!, 0, 1000, "note");
                        },
                        mycontroller: controller.clientNote),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: Text(
                      "سوف يتم تحديد السعر من خلال خدمة العملاء عند تاكيد المكالمة",
                      style: TextStyle(
                        fontSize: 14,
                        // fontWeight: FontWeight.w600,
                        color: AppColor.black,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("callus".tr),
                        const SizedBox(
                          width: 20,
                        ),
                        controller.myServices.sharedPreferences
                            .getString("lang") ==
                            "en"
                            ? const Icon(Icons.keyboard_double_arrow_right)
                            : const Icon(
                            Icons.keyboard_double_arrow_left_outlined),
                        const SizedBox(
                          width: 20,
                        ),
                        buildMedia(
                            icon: FontAwesome.whatsapp,
                            text: "Whatsapp",
                            onPressed: () {
                              whatsapp();
                              controller.update();
                            }),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            )
          ],
        ),));
  }
}

class ColorDot extends StatelessWidget {
  const ColorDot({
    Key? key,
    required this.fillColor,
    required this.isSelected,
  }) : super(key: key);

  final Color fillColor;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20 / 2.5),
      padding: const EdgeInsets.all(3),
      height: 24,
      width: 24,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
            color: isSelected ? AppColor.kTextLightColor : Colors.transparent),
      ),
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: fillColor,
        ),
      ),
    );
  }
}

class ProductImage extends StatelessWidget {
  const ProductImage({
    Key? key,
    required this.size,
    required this.image,
  }) : super(key: key);

  final Size size;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      height: size.width * 0.8,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            height: size.width * 0.7,
            width: size.width * 0.7,
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
          ),
          Positioned(
              top: 80,
              child: Image.network(
                image,
                height: size.width * 0.5,
                width: size.width * 0.5,
                fit: BoxFit.cover,
              ))
        ],
      ),
    );
  }
}

whatsapp() async {
  const url = "whatsapp://send?phone=+2001153626061";
  await launchUrlString(url);
}
