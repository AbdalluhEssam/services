// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:gluse_family/core/constant/color.dart';
// import 'package:gluse_family/view/screen/home/product.dart';
// import '../../../controller/home/itemshome_controller.dart';
//
// class ProductPage extends GetView<ItemsHomeControllerImp> {
//   const ProductPage({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return Scaffold(
//         body: Container(
//             padding: const EdgeInsets.symmetric(horizontal: 15),
//             child: ListView(children: [
//               const SizedBox(
//                 width: 10,
//               ),
//               Container(
//                 margin: const EdgeInsets.only(top: 15),
//                 child: Row(
//                   children: [
//                     Container(
//                       margin: const EdgeInsets.symmetric(horizontal: 5),
//                       decoration: BoxDecoration(
//                           color: AppColor.backgroundColor,
//                           borderRadius: BorderRadius.circular(20)),
//                       width: 30,
//                       height: 60,
//                       padding: const EdgeInsets.symmetric(vertical: 8),
//                       child: IconButton(
//                         onPressed: () {
//                           Navigator.of(context).pop();
//                         },
//                         icon: const Icon(
//                           Icons.arrow_back_outlined,
//                           size: 30,
//                           color: AppColor.primaryColor,
//                         ),
//                       ),
//                     ),
//                     const SizedBox(
//                       width: 10,
//                     ),
//                     Expanded(
//                         child: TextFormField(
//                       decoration: InputDecoration(
//                           prefixIcon: IconButton(
//                               icon: const Icon(Icons.search), onPressed: () {}),
//                           hintText: "findproduct".tr,
//                           border: OutlineInputBorder(
//                             borderSide: BorderSide.none,
//                             borderRadius: BorderRadius.circular(20),
//                           ),
//                           filled: true,
//                           fillColor: Colors.grey[200]),
//                     )),
//                   ],
//                 ),
//               ),
//               const SizedBox(
//                 height: 10,
//               ),
//               SizedBox(
//                   height: size.height/1.5,
//                   child: const ProductView()),
//               const SizedBox(
//                 height: 30,
//               ),
//             ])));
//   }
// }
