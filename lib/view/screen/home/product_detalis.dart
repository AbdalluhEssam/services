import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:services/core/constant/color.dart';
import 'package:services/core/constant/routes.dart';
import 'package:services/core/functions/translatedordatabase.dart';
import '../../../controller/home/productdetalis_controller.dart';
import '../../../core/functions/validinput.dart';
import '../../../likeapi.dart';
import '../../widget/auth/customtextformauth.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ProductDetailsControllerImp());
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: [SystemUiOverlay.bottom]);
    return Scaffold(
        backgroundColor: AppColor.kBackgroundColor,
        bottomNavigationBar: GetBuilder<ProductDetailsControllerImp>(
          builder: (controller) => Container(
            width: double.infinity,
            // color: Colors.brown[200],
            margin: const EdgeInsets.symmetric(horizontal: 70, vertical: 18),
            child: MaterialButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50.0)),
              padding: const EdgeInsets.all(15),
              color: AppColor.primaryColor,
              onPressed: () {
                // controller.addCart(controller.itemsModel.itemsId.toString());
                Get.toNamed(AppRoute.checkOutGlus,arguments: {
                  "itemsModel" : controller.itemsModel,
                  "focusDate" : controller.focusDate,
                  "timeHour" : controller.timeHour.text,
                  "note" : controller.note.text,
                });
              },
              textColor: Colors.white,
              child: Text(
                translateDataBase("احجز الان", "Book now"),
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ),
          ),
        ),
        body: GetBuilder<ProductDetailsControllerImp>(
            builder: (controller) => SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(
                            alignment: AlignmentDirectional.topStart,
                            children: [
                              CachedNetworkImage(
                                imageUrl:
                                    "${AppLink.imageItems}/${controller.itemsModel.itemsImage}",
                                alignment: Alignment.center,
                                width: Get.width,
                                fit: BoxFit.cover,
                              ),
                              PositionedDirectional(
                                start: 10,
                                top: 20,
                                child: IconButton(
                                    onPressed: () {
                                      Get.back();
                                    },
                                    icon: const Icon(
                                      Icons.arrow_back_ios_new,
                                      color: AppColor.primaryColor,
                                      size: 30,
                                    )),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 20 / 2, horizontal: 15),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "${translateDataBase(controller.itemsModel.itemsNameAr, controller.itemsModel.itemsName)}",
                                  style: Theme.of(context).textTheme.headline6,
                                ),
                                Text(
                                  translateDataBase(
                                      controller.itemsModel.categoriesNameAr,
                                      controller.itemsModel.categoriesName),
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color:
                                        AppColor.primaryColor.withOpacity(0.8),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                      const Divider(
                        height: 1,
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 10),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        child: Text(
                          translateDataBase(controller.itemsModel.itemsDescAr,
                              controller.itemsModel.itemsDesc),
                          style: const TextStyle(
                            color: AppColor.black,
                            fontSize: 15,
                          ),
                          textAlign: TextAlign.start,
                        ),
                      ),
                      const Divider(
                        height: 1,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      EasyInfiniteDateTimeLine(
                        locale: "${translateDataBase("ar", "en_US")}",
                        controller: controller.controller,
                        firstDate: DateTime(2024),
                        focusDate: controller.focusDate,
                        lastDate: DateTime(2030, 12, 31),
                        activeColor: AppColor.primaryColor,
                        onDateChange: (selectedDate) {
                          controller.focusDate = selectedDate;
                          controller.update();
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CustomFormAuthDate(
                          color: AppColor.black.withOpacity(0.1),
                          hinttext: "Booking time",
                          label: translateDataBase("وقت الحجز", "Booking time"),
                          iconData: Icons.watch_later_outlined,
                          mycontroller: controller.timeHour,
                          valid: (val) {
                            return validInput(val!, 5, 500, "Booking time");
                          },
                          onTapFull: () async {
                            TimeOfDay? pickedTime = await showTimePicker(
                              context: context,
                              initialTime: TimeOfDay.now(),
                              builder: (context, child) {
                                return Theme(
                                  data: ThemeData(
                                    useMaterial3: true,
                                    primaryColor: AppColor.backgroundColor,
                                  ),
                                  child: child!,
                                );
                              },
                            );
                            if (pickedTime != null) {
                              DateTime parsedTime = DateTime(
                                  DateTime.now().year,
                                  DateTime.now().month,
                                  DateTime.now().day,
                                  pickedTime.hour,
                                  pickedTime.minute);
                              String formattedTime =
                                  DateFormat.jm().format(parsedTime);
                              controller.timeHour.text = formattedTime;
                              controller.update();
                            } else {
                              log("Time is not selected");
                            }
                          },
                          isNamber: false,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CustomFormAuth(
                              hinttext:
                                  "${translateDataBase("اكتب تفاصيل طلبك", "Write your details")}",
                              label:
                                  "${translateDataBase("اكتب تفاصيل طلبك", "Write your details")}",
                              iconData: Icons.note_alt_outlined,
                              mycontroller: controller.note,
                              valid: (val) {
                                return validInput(
                                    val!, 5, 10000, "Write your details");
                              },
                              isNamber: false))
                    ],
                  ),
                )));
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
      clipBehavior: Clip.antiAliasWithSaveLayer,
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
