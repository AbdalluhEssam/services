// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:get/get.dart';
// import 'package:gluse_family/core/constant/color.dart';
// import '../../../../controller/cart/checkout_controller.dart';
// import '../../../../core/functions/validinput.dart';
// import '../../../widget/checkout/customformcheckout.dart';
//
// class StepperCheckOut extends StatefulWidget {
//   const StepperCheckOut({Key? key}) : super(key: key);
//
//   @override
//   State<StepperCheckOut> createState() => _StepperCheckOutState();
// }
//
// class _StepperCheckOutState extends State<StepperCheckOut> {
//   CheckOutControllerImp controller = Get.put(CheckOutControllerImp());
//   static int x = 0;
//   static bool a = false;
//
//   void next() {
//     setState(() {
//       if (x + 1 != listStepper.length) {
//         tap(x++);
//         a = true;
//       } else {
//          Get.back();
//       }
//     });
//   }
//
//   void back() {
//     setState(() {
//       if (x != 0) {
//         x--;
//         a = false;
//       } else {
//         Get.back();
//       }
//     });
//   }
//
//   void tap(int y) {
//     setState(() {
//       a = true;
//     });
//   }
//
//   List<Step> listStepper = [
//     Step(
//       title: const Text("اختر طريقة الدفع"),
//       subtitle: const Text("welcome"),
//       isActive:a,
//       state: StepState.indexed,
//       content: Padding(
//         padding: const EdgeInsets.only(left: 38),
//         child: Container(
//           alignment: Alignment.centerRight,
//           height: 250,
//           width: 300,
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(20),
//             color: AppColor.primaryColor,
//           ),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.spaceAround,
//             mainAxisSize: MainAxisSize.min,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               const Text("اختر طريقة الدفع", textAlign: TextAlign.end),
//               const SizedBox(
//                 height: 5,
//               ),
//               Container(
//                 padding: const EdgeInsets.symmetric(horizontal: 5),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceAround,
//                   children: [
//                     InkWell(
//                       onTap: () {
//                         Fluttertoast.showToast(
//                             msg: "Soon !",
//                             toastLength: Toast.LENGTH_SHORT,
//                             gravity: ToastGravity.BOTTOM,
//                             timeInSecForIosWeb: 1,
//                             backgroundColor: AppColor.primaryColor,
//                             textColor: Colors.white,
//                             fontSize: 16.0);
//                       },
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         children: [
//                           Image.asset(
//                             "assets/images/credit.png",
//                             width: 100,
//                             height: 100,
//                             alignment: Alignment.center,
//                           ),
//                           const SizedBox(
//                             height: 15,
//                           ),
//                           const Text("الدفع الالكترونى"),
//                         ],
//                       ),
//                     ),
//                     InkWell(
//                       onTap: () {},
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         children: [
//                           Image.asset(
//                             "assets/images/cash.png",
//                             width: 100,
//                             height: 100,
//                             alignment: Alignment.center,
//                           ),
//                           const SizedBox(
//                             height: 15,
//                           ),
//                           const Text("عند الاستلام"),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     ),
//     Step(
//       title: const Text("Address"),
//       subtitle: const Text("welcome"),
//       isActive: a,
//       state: StepState.indexed,
//       content: Container(
//           height: 190,
//           padding: const EdgeInsets.symmetric(horizontal: 20),
//           child: GetBuilder<CheckOutControllerImp>(
//             builder: (controller) => Form(
//               key: controller.formstate,
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   CustomFormCheckOut(
//                     isNamber: false,
//                     valid: (val) {
//                       return validInput(val!, 5, 255, "address");
//                     },
//                     mycontroller: controller.address,
//                     label: "Address",
//                     hintText: "Governorate - District - Architecture",
//                     iconData: Icons.location_on_outlined,
//                   ),
//                   CustomFormCheckOut(
//                     isNamber: true,
//                     valid: (val) {
//                       return validInput(val!, 5, 255, "phone");
//                     },
//                     mycontroller: controller.address,
//                     label: "Phone",
//                     hintText: "Phone",
//                     iconData: Icons.phone,
//                   ),
//                 ],
//               ),
//             ),
//           )),
//     ),
//     Step(
//       title: const Text("Confirm"),
//       subtitle: const Text("welcome"),
//       isActive: a,
//       state: StepState.indexed,
//       content:  Container(
//         padding: const EdgeInsets.symmetric(horizontal: 20),
//         child: Column(
//           children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: const [
//                     Text("سعر المنتج : "),
//                     Text("التوصيل : "),
//                     Text("عدد المنتجات : "),
//                     Text("Total : "),
//                   ],
//                 ),
//                 Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: const [
//                     Text("27 EG"),
//                     Text("30 EG"),
//                     Text("3"),
//                     Text("500 EG"),
//                   ],
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     ),
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         foregroundColor: AppColor.primaryColor,
//         elevation: 0,
//         title: Text("checkout".tr),
//         centerTitle: true,
//         backgroundColor: AppColor.backgroundColor,
//       ),
//       body: Container(
//         margin: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
//         child: Stepper(
//           steps: listStepper,
//           currentStep: x,
//           type: StepperType.vertical,
//           onStepTapped: tap,
//           elevation: 100,
//           margin: const EdgeInsets.all(20),
//           onStepContinue: next,
//           onStepCancel: back,
//         ),
//       )
//     );
//   }
// }
