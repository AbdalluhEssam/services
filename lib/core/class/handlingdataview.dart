import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:services/core/class/statusrequest.dart';
import 'package:services/core/constant/imageassets.dart';
import 'package:services/core/functions/translatedordatabase.dart';
import 'package:lottie/lottie.dart';

class HandlingDataView extends StatelessWidget {
  final StatusRequest statusRequest;
  final Widget widget;

  const HandlingDataView({
    Key? key,
    required this.statusRequest,
    required this.widget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return statusRequest == StatusRequest.loading
        ? Center(
            child:
                Lottie.asset(AppImageAssets.loading, width: 250, height: 250),
          )
        : statusRequest == StatusRequest.offlineFailure
            ? Center(
                child: Lottie.asset(AppImageAssets.offline,
                    width: 250, height: 250),
              )
            : statusRequest == StatusRequest.serverFailure
                ? Center(
                    child: Lottie.asset(AppImageAssets.server,
                        width: 250, height: 250),
                  )
                : statusRequest == StatusRequest.failure
                    ? Center(
                        child: Lottie.asset(AppImageAssets.notData,
                            width: 250, height: 250),
                      )
                    : widget;
  }
}

class HandlingDataViewNot extends StatelessWidget {
  final StatusRequest statusRequest;
  final Widget widget;

  const HandlingDataViewNot({
    Key? key,
    required this.statusRequest,
    required this.widget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return statusRequest == StatusRequest.loading
        ? Center(
            child:
                Lottie.asset(AppImageAssets.loading, width: 250, height: 250),
          )
        : statusRequest == StatusRequest.offlineFailure
            ? Center(
                child: Lottie.asset(AppImageAssets.offline,
                    width: 250, height: 250),
              )
            : statusRequest == StatusRequest.serverFailure
                ? Center(
                    child: Lottie.asset(AppImageAssets.server,
                        width: 250, height: 250),
                  )
                : statusRequest == StatusRequest.failure
                    ? Center(
                        child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Lottie.asset(
                            "assets/lottie/empty.json",
                            // width: 300,
                            // height: 300,
                            alignment: Alignment.center,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text("cart".tr),

                        ],
                      ))
                    : widget;
  }
}
class HandlingDataViewNotification extends StatelessWidget {
  final StatusRequest statusRequest;
  final Widget widget;

  const HandlingDataViewNotification({
    Key? key,
    required this.statusRequest,
    required this.widget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return statusRequest == StatusRequest.loading
        ? Center(
            child:
                Lottie.asset(AppImageAssets.loading, width: 250, height: 250),
          )
        : statusRequest == StatusRequest.offlineFailure
            ? Center(
                child: Lottie.asset(AppImageAssets.offline,
                    width: 250, height: 250),
              )
            : statusRequest == StatusRequest.serverFailure
                ? Center(
                    child: Lottie.asset(AppImageAssets.server,
                        width: 250, height: 250),
                  )
                : statusRequest == StatusRequest.failure
                    ? Center(
                        child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Lottie.asset(
                            "assets/lottie/empty.json",
                            // width: 300,
                            // height: 300,
                            alignment: Alignment.center,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text("${translateDataBase("لا توجد اشعارات", "No notifications")}".tr),

                        ],
                      ))
                    : widget;
  }
}

class HandlingDataRequest extends StatelessWidget {
  final StatusRequest statusRequest;
  final Widget widget;

  const HandlingDataRequest({
    Key? key,
    required this.statusRequest,
    required this.widget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return statusRequest == StatusRequest.loading
        ? Center(
            child:
                Lottie.asset(AppImageAssets.loading, width: 250, height: 250),
          )
        : statusRequest == StatusRequest.offlineFailure
            ? Center(
                child: Lottie.asset(AppImageAssets.offline,
                    width: 250, height: 250),
              )
            : statusRequest == StatusRequest.serverFailure
                ? Center(
                    child: Lottie.asset(AppImageAssets.server,
                        width: 250, height: 250),
                  )
                : widget;
  }
}

class HandlingDataViewAddress extends StatelessWidget {
  final StatusRequest statusRequest;
  final Widget widget;

  const HandlingDataViewAddress({
    Key? key,
    required this.statusRequest,
    required this.widget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return statusRequest == StatusRequest.loading
        ? Center(
      child:
      Lottie.asset(AppImageAssets.loading, width: 250, height: 250),
    )
        : statusRequest == StatusRequest.offlineFailure
        ? Center(
      child: Lottie.asset(AppImageAssets.offline,
          width: 250, height: 250),
    )
        : statusRequest == StatusRequest.serverFailure
        ? Center(
      child: Lottie.asset(AppImageAssets.server,
          width: 250, height: 250),
    )
        : statusRequest == StatusRequest.failure
        ? Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Lottie.asset(
            "assets/lottie/empty.json",
            width: Get.width * 0.8,
          ),
          const SizedBox(
            height: 30,
          ),
          const Text("لا يوجد عناوين"),
        ],
      ),
    )
        : widget;
  }
}