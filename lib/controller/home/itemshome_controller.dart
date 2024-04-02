import 'package:get/get.dart';
import 'package:services/core/services/services.dart';
import '../../../core/class/statusrequest.dart';
import '../../core/functions/handlingdatacontroller.dart';
import '../../data/datasource/remote/homedata.dart';

abstract class ItemsHomeController extends GetxController {
  initialData();
  getData();
}

class ItemsHomeControllerImp extends ItemsHomeController {
  MyServices myServices = Get.find();
  HomeData homeData = HomeData(Get.find());

  late StatusRequest statusRequest;

  List services = [];
  List categories = [];
  List items = [];

  String? username;
  String? nameItems;
  String? imageItems;
  int? priceItems;
  int? idUser;
  int? idItems;

  @override
  initialData() {
    username = myServices.sharedPreferences.getString("username");
    idUser = myServices.sharedPreferences.getInt("id");
  }

  @override
  void onInit() {
    idItems = Get.arguments['id'];
    nameItems = Get.arguments['name'];
    imageItems = Get.arguments['image'];
    priceItems = Get.arguments['price'];
    initialData();
    super.onInit();
  }

  @override
  getData() async {
    update();
  }
}
