// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:gluse_family/controller/home/home_controller.dart';
// import 'package:gluse_family/core/constant/routes.dart';
// import 'package:gluse_family/data/model/itemsmodel.dart';
// import 'package:gluse_family/likeapi.dart';
// import '../../../core/constant/color.dart';
// import '../../../core/services/services.dart';
//
// class ListItemsHome extends GetView<HomeControllerImp> {
//   const ListItemsHome({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           foregroundColor: AppColor.primaryColor,
//           elevation: 0,
//           centerTitle: true,
//           title: Text("products".tr),
//           backgroundColor: AppColor.kBackgroundColor,
//         ),
//         body: Container(
//           margin: const EdgeInsets.symmetric(horizontal: 5),
//           child: GridView.builder(
//             itemCount: controller.items.length,
//             scrollDirection: Axis.vertical,
//             itemBuilder: (context, i) {
//               return ItemsCardHome(
//                   itemsModel: ItemsModel.fromJson(controller.items[i]));
//             },
//             gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                 crossAxisCount: 2),
//           ),
//         ));
//   }
// }
// //
// // class ItemsHome extends StatelessWidget {
// //   final ItemsModel itemsModel;
// //
// //   const ItemsHome({Key? key, required this.itemsModel}) : super(key: key);
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return InkWell(
// //         onTap: () {
// //           Get.toNamed(AppRoute.productDetails, arguments: {
// //             "id": itemsModel.itemsId,
// //             "name": itemsModel.itemsName,
// //             "image": itemsModel.itemsImage,
// //             "price": itemsModel.itemsPrice,
// //           });
// //         },
// //         child: Stack(
// //           children: [
// //             Container(
// //                 padding:
// //                     const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
// //                 margin: const EdgeInsets.symmetric(horizontal: 10),
// //                 child: Image.network(
// //                   "${AppLink.imageItems}/${itemsModel.itemsImage}",
// //                   // height: 110,
// //                   // width: 160,
// //                   fit: BoxFit.cover,
// //                 )),
// //             Container(
// //               decoration: BoxDecoration(
// //                 borderRadius: BorderRadius.circular(20),
// //                 color: AppColor.black.withOpacity(0.3),
// //               ),
// //               height: 120,
// //               width: 200,
// //             ),
// //             Positioned(
// //                 left: 10,
// //                 child: Text(
// //                   "${itemsModel.itemsName}",
// //                   style: const TextStyle(
// //                       color: Colors.white,
// //                       fontWeight: FontWeight.bold,
// //                       fontSize: 15),
// //                 )),
// //             Positioned(
// //                 right: 30,
// //                 top: 80,
// //                 child: Text(
// //                   "${itemsModel.itemsPrice} EG",
// //                   style: const TextStyle(
// //                       color: Colors.white,
// //                       fontWeight: FontWeight.bold,
// //                       fontSize: 15),
// //                 )),
// //           ],
// //         ));
// //   }
// // }
//
// class ItemsCardHome extends StatelessWidget {
//   final ItemsModel itemsModel;
//
//   const ItemsCardHome({Key? key, required this.itemsModel}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     MyServices myServices = Get.find();
//
//     return InkWell(
//       onTap: () {
//         Get.toNamed(AppRoute.productDetails, arguments: {
//           "id": itemsModel.itemsId,
//           "name": myServices.sharedPreferences.getString("lang") == "en"
//               ?itemsModel.itemsName:itemsModel.itemsNameAr,
//           "image": itemsModel.itemsImage,
//           "price": itemsModel.itemsPrice,
//           "desc":myServices.sharedPreferences.getString("lang") == "en"
//               ?itemsModel.itemsDesc:itemsModel.itemsDescAr,
//         });
//       },
//       child: Container(
//         // height: 300,
//         margin: itemsModel.itemsCat == 7 || itemsModel.itemsCat == 8
//             ? const EdgeInsets.symmetric(vertical: 0)
//             : const EdgeInsets.symmetric(horizontal: 5, vertical: 0),
//         width: 200,
//         decoration: BoxDecoration(boxShadow: [
//           BoxShadow(
//               blurRadius: 30,
//               color: AppColor.gray.withOpacity(0.2),
//               spreadRadius: 0,
//               offset: const Offset(10, 10))
//         ]),
//         child: Card(
//             elevation: 10,
//             child: Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 2),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   Image.network(
//                     "${AppLink.imageItems}/${itemsModel.itemsImage}",
//                     alignment: Alignment.center,
//                     height: 90,
//                     fit: BoxFit.cover,
//                   ),
//                   const SizedBox(
//                     height: 3,
//                   ),
//                   myServices.sharedPreferences.getString("lang") == "en" ?Text("${itemsModel.itemsName}",
//                       style: const TextStyle(fontSize: 13)):Text("${itemsModel.itemsNameAr}",
//                       style: const TextStyle(fontSize: 13)),
//                   Padding(
//                     padding:itemsModel.itemsCat == 7 || itemsModel.itemsCat == 8
//                         ? const EdgeInsets.symmetric(horizontal: 0):const EdgeInsets.symmetric(horizontal: 5),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         itemsModel.itemsCat == 7 || itemsModel.itemsCat == 8
//                             ? Text(
//                                 "priceglus".tr,
//                                 style: const TextStyle(fontSize: 9),
//                               )
//                             : Text(
//                                 "${itemsModel.itemsPrice} EG",
//                               ),
//                        GetBuilder<HomeControllerImp>(builder: (controller) =>IconButton(
//                             onPressed: () {
//                              controller.addCart("${itemsModel.itemsId}");
//                             },
//                             icon: const Icon(Icons.add_shopping_cart))
//                        )],
//                     ),
//                   )
//                 ],
//               ),
//             )),
//       ),
//     );
//   }
// }
