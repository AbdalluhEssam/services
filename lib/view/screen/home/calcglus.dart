import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome_icons.dart';
import 'package:get/get.dart';
import 'package:services/core/class/handlingdataview.dart';
import 'package:services/core/constant/color.dart';
import 'package:services/core/constant/routes.dart';
import 'package:services/core/functions/translatedordatabase.dart';
import 'package:services/view/screen/home/personinformation.dart';
import 'package:url_launcher/url_launcher_string.dart';
import '../../../controller/home/glus/calcglusditeles_controller.dart';
import '../../../core/functions/validinput.dart';
import '../../../core/services/services.dart';
import '../../../likeapi.dart';
import '../../widget/home/custotextfiledglus.dart';

class CalcGlusDetails extends StatelessWidget {
  const CalcGlusDetails({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MyServices myServices = Get.find();

    CalcGlusDetailsControllerImp controller =
        Get.put(CalcGlusDetailsControllerImp());
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: Text("${controller.nameProduct}",
              style: const TextStyle(fontSize: 18),
              textAlign: TextAlign.center),
        ),
        backgroundColor: AppColor.bg,
        body: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
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
                            imageUrl:
                                "${AppLink.imageItems}/${controller.imageProduct}",
                            fit: BoxFit.cover,
                            alignment: Alignment.topCenter,
                            width: size.width,
                            height: size.width / 1.1,
                          ),

                          const SizedBox(
                            height: 10,
                          ),
                          Center(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: Text(
                                "${controller.nameProduct}",
                                style: Theme.of(context).textTheme.titleLarge,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 20),
                            child: Text(
                              "calc".tr,
                              // style: Theme.of(context).textTheme.headline1,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          controller.glusProductModel.typesId! == '3'
                              ? Form(
                                  key: controller.formstate,
                                  child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20),
                                      child: Column(
                                        children: [
                                          CustomFormGlus(
                                              hinttext: "res".tr,
                                              iconData:
                                                  Icons.calculate_outlined,
                                              label: "res".tr,
                                              valid: (val) {
                                                return validInput(
                                                    val!, 1, 40, "countr");
                                              },
                                              mycontroller: controller.countR),
                                          const SizedBox(
                                            height: 20,
                                          ),
                                          CustomFormGlus(
                                              hinttext: "room".tr,
                                              iconData:
                                                  Icons.calculate_outlined,
                                              label: "room".tr,
                                              valid: (val) {
                                                return validInput(
                                                    val!, 1, 40, "count");
                                              },
                                              mycontroller:
                                                  controller.countRoom),
                                          const SizedBox(
                                            height: 20,
                                          ),
                                          CustomFormGlus(
                                              hinttext: "kitchen".tr,
                                              iconData:
                                                  Icons.calculate_outlined,
                                              label: "kitchen".tr,
                                              valid: (val) {
                                                return validInput(
                                                    val!, 1, 40, "countK");
                                              },
                                              mycontroller: controller.countK),
                                          const SizedBox(
                                            height: 20,
                                          ),
                                          CustomFormGlus(
                                              hinttext: "bathroom".tr,
                                              iconData:
                                                  Icons.calculate_outlined,
                                              label: "bathroom".tr,
                                              valid: (val) {
                                                return validInput(
                                                    val!, 1, 40, "countB");
                                              },
                                              mycontroller: controller.countB),
                                          const SizedBox(
                                            height: 20,
                                          ),
                                          CustomFormGlus(
                                              hinttext: "balconies".tr,
                                              iconData:
                                                  Icons.calculate_outlined,
                                              label: "balconies".tr,
                                              valid: (val) {
                                                return validInput(val!, 1, 40,
                                                    "countBalcony");
                                              },
                                              mycontroller:
                                                  controller.countBalcony),
                                        ],
                                      )))
                              : Center(
                                  child: Text(
                                      "تبدا من سعر  : ${controller.total} ج "),
                                ),
                          // Padding(
                          //     padding: const EdgeInsets.symmetric(horizontal: 20),
                          //     child: controller.fin == null
                          //         ? const Text("")
                          //         : Row(
                          //             crossAxisAlignment: CrossAxisAlignment.end,
                          //             mainAxisAlignment: MainAxisAlignment.end,
                          //             children: [
                          //               Text(
                          //                 myServices.sharedPreferences
                          //                             .getString("lang") ==
                          //                         "en"
                          //                     ? "Price ${controller.finel} EG (approx)"
                          //                     : " السعر ${controller.finel} جنية (تقريباً)",
                          //                 style: const TextStyle(
                          //                   fontSize: 20,
                          //                   fontWeight: FontWeight.w600,
                          //                   color: AppColor.black,
                          //                 ),
                          //               ),
                          //             ],
                          //           )),
                          // const SizedBox(
                          //   height: 20,
                          // ),

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
                                mycontroller: controller.note),
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
                          // SizedBox(
                          //   height: controller.fin == null ? 0 : 20,
                          // ),
                          GetBuilder<CalcGlusDetailsControllerImp>(
                            builder: (controller) => HandlingDataViewNot(
                                statusRequest: controller.statusRequest,
                                widget: Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 5),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        "اضاقات : ",
                                        style: TextStyle(
                                          fontSize: 16,
                                          // fontWeight: FontWeight.w600,
                                          color: AppColor.bg,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                      ListView.builder(
                                        shrinkWrap: true,
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        itemCount: controller.additions.length,
                                        itemBuilder: (context, index) =>
                                            CheckboxListTile(
                                          title: Text(controller
                                              .additions[index].name!),
                                          value: controller.isCheckedList
                                              .contains(controller
                                                  .additions[index].name),
                                          onChanged: (value) {
                                            controller.updateCheckboxState(
                                                controller
                                                    .additions[index].name!);
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                )),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                // MaterialButton(
                                //   shape: RoundedRectangleBorder(
                                //       borderRadius: BorderRadius.circular(50.0)),
                                //   padding: EdgeInsets.symmetric(
                                //       horizontal: size.width * 0.2),
                                //   color: AppColor.kSecondaryColor,
                                //   onPressed: () {
                                //     controller.fin = double.parse(
                                //         controller.countRoom.text.trim());
                                //     controller.k =
                                //         double.parse(controller.countK.text.trim());
                                //     controller.b =
                                //         double.parse(controller.countB.text.trim());
                                //     controller.r =
                                //         double.parse(controller.countR.text.trim());
                                //     controller.balcony = double.parse(
                                //         controller.countBalcony.text.trim());
                                //     controller.finel = ((controller.fin! *
                                //                 controller.priceProduct!
                                //                     .toDouble()) +
                                //             (controller.k! *
                                //                 controller.priceK!.toDouble()) +
                                //             (controller.b! *
                                //                 controller.priceB!.toDouble()) +
                                //             (controller.r! *
                                //                 controller.priceR!.toDouble())) +
                                //         (controller.balcony! *
                                //             controller.priceBalcony!.toDouble());
                                //     setState(() {});
                                //   },
                                //   textColor: Colors.white,
                                //   child: Text("calcbut".tr),
                                // )
                                Text("callus".tr),
                                const SizedBox(
                                  width: 20,
                                ),
                                myServices.sharedPreferences
                                            .getString("lang") ==
                                        "en"
                                    ? const Icon(
                                        Icons.keyboard_double_arrow_right)
                                    : const Icon(Icons
                                        .keyboard_double_arrow_left_outlined),
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
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Text(
                        translateDataBase(
                            "تفاصيل الباقة : ", "Package details : "),
                        style: const TextStyle(
                          color: AppColor.primaryColor,
                          fontSize: 25,
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 10),
                      child: Text(
                        controller.descProduct,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const SizedBox(
                      height: 20,
                    )
                  ],
                ),
              ),
            ),
            Container(
              width: double.infinity,
              // color: Colors.brown[200],
              margin: const EdgeInsets.symmetric(horizontal: 90, vertical: 10),
              child: MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50)),
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                color: AppColor.kSecondaryColor,
                onPressed: () {
                  if (controller.glusProductModel.typesId! == '3') {
                    if (controller.formstate.currentState!.validate()) {
                      Get.toNamed(AppRoute.checkOutGlus, arguments: {
                        "room": controller.glusProductModel.typesId! == '3'
                            ? controller.countRoom.text
                            : 0,
                        "total": controller.total,
                        "countk": controller.glusProductModel.typesId! == '3'
                            ? controller.countK.text
                            : 0,
                        "countb": controller.glusProductModel.typesId! == '3'
                            ? controller.countB.text
                            : 0,
                        "countr": controller.glusProductModel.typesId! == '3'
                            ? controller.countR.text
                            : 0,
                        "countbalcony":
                            controller.glusProductModel.typesId! == '3'
                                ? controller.countBalcony.text
                                : 0,
                        "note": controller.note.text,
                        "id": controller.idProduct,
                        "typesId": controller.glusProductModel.typesId,
                      });
                    }
                  } else {
                    Get.toNamed(AppRoute.checkOutGlus, arguments: {
                      "room": controller.glusProductModel.typesId! == '3'
                          ? controller.countRoom.text
                          : "0",
                      "total": controller.total,
                      "countk": controller.glusProductModel.typesId! == '3'
                          ? controller.countK.text
                          : "0",
                      "countb": controller.glusProductModel.typesId! == '3'
                          ? controller.countB.text
                          : "0",
                      "countr": controller.glusProductModel.typesId! == '3'
                          ? controller.countR.text
                          : "0",
                      "countbalcony":
                          controller.glusProductModel.typesId! == '3'
                              ? controller.countBalcony.text
                              : "0",
                      "note": controller.note.text,
                      "id": controller.idProduct,
                      "typesId": controller.glusProductModel.typesId,
                    });
                  }
                },
                textColor: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [Text("addservice".tr), const Icon(Icons.add)],
                ),
              ),
            )
          ],
        ));
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
