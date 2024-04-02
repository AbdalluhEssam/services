import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart' show Jiffy;
import '../../../../core/class/handlingdataview.dart';
import '../../../core/constant/color.dart';
import '../../controller/notification_controller.dart';

class NotificationScreen extends GetView<NotificationControllerImp> {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(NotificationControllerImp());
    return Scaffold(
        appBar: AppBar(
          title: const Text("Notification"),
          centerTitle: true,
        ),
        body: GetBuilder<NotificationControllerImp>(
          builder: (controller) => HandlingDataViewNotification(
              statusRequest: controller.statusRequest,
              widget: ListView.separated(
                itemCount: controller.notification.length,
                padding: const EdgeInsets.all(20),
                itemBuilder: (context, index) {
                  return Container(
                      decoration: BoxDecoration(
                          color: AppColor.backgroundColor,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: const [
                            BoxShadow(
                                color: AppColor.primaryColor, blurRadius: 5)
                          ]),
                      child: GestureDetector(
                        onTap: () {
                          Get.toNamed("${controller.notification[index].pagename}");
                        },
                        child: Card(
                            child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 10),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 2,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                        "${controller.notification[index].notificationTitle}",
                                        style: const TextStyle(
                                            fontSize: 16,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold)),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                        "${controller.notification[index].notificationBody}",
                                        style: const TextStyle(
                                            fontSize: 12, color: AppColor.black)),
                                  ],
                                ),
                              ),
                              Text(
                                  Jiffy.parse("${DateTime.parse(controller.notification[index].createAt!)}")
                                      .fromNow(),
                                  style: const TextStyle(fontSize: 9, color: AppColor.gray))
                            ],
                          ),
                        )),
                      ));
                },
                separatorBuilder: (BuildContext context, int index) =>
                    const SizedBox(height: 15),
              )),
        ));
  }
}
