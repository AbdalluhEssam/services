import 'package:get/get.dart';
import 'package:services/controller/cart/cardview_controller.dart';
import 'package:services/controller/cart/checkout_controller.dart';
import 'package:services/controller/home/categoriespro_controller.dart';
import 'package:services/controller/home/home_controller.dart';
import 'package:services/controller/home/itemshome_controller.dart';
import 'package:services/core/class/crud.dart';
import 'controller/auth/signup_controller.dart';
import 'controller/cart/orderdet_controller.dart';
import 'controller/home/personinformation_controller.dart';
import 'controller/home/productdetalis_controller.dart';

class MyBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(Crud());
    Get.lazyPut(() => HomeControllerImp(), fenix: true);
    Get.lazyPut(() => SignUpControllerImp(), fenix: true);
    Get.lazyPut(() => ItemsHomeControllerImp(), fenix: true);
    Get.lazyPut(() => ProductDetailsControllerImp(), fenix: true);
    Get.lazyPut(() => PersonInfoControllerImp(), fenix: true);
    Get.lazyPut(() => CardViewControllerImp(), fenix: true);
    Get.lazyPut(() => CheckOutControllerImp());
    Get.lazyPut(() => CategoriesProControllerImp());
    Get.lazyPut(() => OrderDetViewControllerImp());
  }
}
