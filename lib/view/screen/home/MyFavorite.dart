import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/home/myFavorite_controller.dart';
import '../../../core/class/handlingdataview.dart';
import '../../../core/constant/color.dart';
import '../../widget/home/myfevorite.dart';

class MyFavorite extends StatelessWidget {
  const MyFavorite({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(MyFavoriteControllerImp());
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Favorite"),
        centerTitle: true,
        foregroundColor: AppColor.primaryColor,
        backgroundColor: AppColor.black,
        elevation: 0,
      ),
      backgroundColor: AppColor.black,
      body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: GetBuilder<MyFavoriteControllerImp>(
            builder: (controller) => ListView(
              children: [
                const SizedBox(
                  height: 20,
                ),
                HandlingDataViewNot(
                    statusRequest: controller.statusRequest,
                    widget: GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: controller.favorite.length,
                      itemBuilder: (context, index) {
                        return CustomFavoriteItems(
                          itemsModel: controller.favorite[index],
                        );
                      },
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2, childAspectRatio: 0.65),
                    ))
              ],
            ),
          )),
    );
  }
}
