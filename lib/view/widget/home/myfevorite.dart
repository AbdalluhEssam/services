import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/constant/color.dart';
import '../../../../core/functions/translatedordatabase.dart';
import '../../../../likeapi.dart';
import '../../../controller/home/myFavorite_controller.dart';
import '../../../data/model/myfavorite_model.dart';

class CustomFavoriteItems extends GetView<MyFavoriteControllerImp> {
  final MyFavoriteModel itemsModel;

  const CustomFavoriteItems({
    Key? key,
    required this.itemsModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // controller.goToProductDetails(itemsModel);
      },
      child: Container(
        // margin:
        // const EdgeInsets.symmetric(horizontal: 2, vertical: 5),
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
              blurRadius: 10,
              color: AppColor.primaryColor.withOpacity(0.4),
              blurStyle: BlurStyle.inner,
              offset: const Offset(0, 0))
        ]),
        child: Card(
          // elevation: 3,
          color: AppColor.black.withOpacity(0.8),
          child: Padding(
            padding:
                const EdgeInsets.only(top: 0, bottom: 5, left: 10, right: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Hero(
                    tag: "${itemsModel.itemsId}",
                    child: CachedNetworkImage(
                      imageUrl:
                          "${AppLink.imageItems}/${itemsModel.itemsImage}",
                      height: Get.height * 0.18,
                      width: Get.width * 0.38,
                      // fit: BoxFit.fill,
                    )),
                Text(
                  translateDataBase(itemsModel.itemsNameAr.toString(),
                      itemsModel.itemsName.toString()),
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize:15),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Rating 3.5",
                      style: TextStyle(
                          fontSize: 12,
                          color: AppColor.backgroundColor.withOpacity(0.5)),
                      textAlign: TextAlign.center,
                    ),
                    Container(
                        alignment: Alignment.bottomCenter,
                        height: 22,
                        child: Row(
                          children: [
                            ...List.generate(
                                5,
                                (index) => Icon(
                                      Icons.star,
                                      size: 15,
                                      color: Colors.yellow.withOpacity(0.5),
                                    )),
                          ],
                        ))
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "${itemsModel.itemsPrice} EG",
                      style: const TextStyle(
                          color: AppColor.backgroundColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                    IconButton(
                        onPressed: () {
                          controller.deleteData(itemsModel.favoriteId!);
                        },
                        icon: const Icon(
                          Icons.delete,
                          color: AppColor.primaryColor,
                        ))
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
