// import 'package:get/get.dart';
// import 'package:gluse_family/core/constant/routes.dart';
// import 'package:gluse_family/data/datasource/remote/cart_data.dart';
// import '../core/class/statusrequest.dart';
// import '../core/functions/handlingdatacontroller.dart';
// import '../core/services/services.dart';
//
// abstract class ProductDetailsController extends GetxController{
//   initialData();
//   addCart();
// }
//
// class ProductDetailsControllerImp extends ProductDetailsController {
//
//   MyServices myServices = Get.find();
//   int? card = 0;
//   CardViewData cardViewData = CardViewData(Get.find());
//   CardAddData cardAddData = CardAddData(Get.find());
//   late StatusRequest statusRequest;
//
//   List cart = [];
//   String? username;
//   String? email;
//   String? nameItems;
//   String? imageItems;
//   String? address;
//   int? priceItems;
//   int? idUser;
//   int? idItems;
//
//   @override
//   initialData() {
//     username = myServices.sharedPreferences.getString("username");
//     email = myServices.sharedPreferences.getString("email");
//     idUser = myServices.sharedPreferences.getInt("id");
//   }
//
//   @override
//   void onInit() {
//     idItems = Get.arguments['id'];
//     nameItems = Get.arguments['name'];
//     imageItems = Get.arguments['image'];
//     priceItems = Get.arguments['price'];
//     initialData();
//     super.onInit();
//   }
//
//
//   @override
//   addCart() async {
//     statusRequest = StatusRequest.loading;
//     update();
//     var response = await cardAddData.postData(
//         idUser!, idItems!, address!, priceItems!
//     );
//     statusRequest = handlingData(response);
//     if (StatusRequest.success == statusRequest) {
//       if (response['status'] == "success") {
//         Get.toNamed(AppRoute.cart);
//       } else {
//         statusRequest = StatusRequest.failure;
//       }
//     }
//     update();
//   }
//
//
// }
