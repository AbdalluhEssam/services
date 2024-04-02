import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:services/controller/cart/checkout_controller.dart';
import '../../../controller/home/address/addAddress_controller.dart';
import '../../../controller/home/address/governorate_controller.dart';
import '../../../core/class/handlingdataview.dart';
import '../../../core/constant/color.dart';
import '../../../core/functions/translatedordatabase.dart';
import '../../../core/functions/validinput.dart';
import '../../widget/address/custonTextFiled.dart';

class AddressAdd extends StatelessWidget {
  const AddressAdd({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AddAddressControllerImp controller = Get.put(AddAddressControllerImp());
    return Scaffold(
        appBar: AppBar(
          title: Text("addaddress".tr),
          centerTitle: true,
        ),
        bottomNavigationBar: GetBuilder<AddAddressControllerImp>(
            builder: (controller) => Container(
                  margin:
                      const EdgeInsets.only(right: 40, left: 40, bottom: 50),
                  child: MaterialButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 60),
                    color: AppColor.primaryColor,
                    textColor: AppColor.black,
                    onPressed: () {
                      controller.addAddressData();

                    },
                    child: Text(
                      translateDataBase("حفظ العنوان", "Save Address"),
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                )),
        body: Form(
          key: controller.formState,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: ListView(
              children: [
                Text(
                  translateDataBase(
                      "عنوانك بوسطة ال GPS", "Your address by GPS"),
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      color: AppColor.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  children: [
                    GetBuilder<AddAddressControllerImp>(
                        builder: (controller) => HandlingDataViewNot(
                            statusRequest: controller.statusRequest,
                            widget: Expanded(
                              flex: 3,
                              child: Text(
                                controller.addresss.toString(),
                                style: const TextStyle(
                                    color: AppColor.black,
                                    fontWeight: FontWeight.bold),
                              ),
                            ))),
                    Expanded(
                        flex: 1,
                        child: Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: AppColor.primaryColor,
                                borderRadius: BorderRadius.circular(100),
                              ),
                              child: IconButton(
                                  onPressed: () {
                                    controller.updateLocation();
                                  },
                                  icon: const Icon(Icons.location_on_outlined)),
                            ),
                            Text("click".tr),
                          ],
                        )),
                  ],
                ),
                const SizedBox(
                  height: 40,
                ),
                const Divider(color: AppColor.primaryColor, thickness: 1),
                const SizedBox(
                  height: 40,
                ),
                CustomFormAddress(
                  cursorColor: AppColor.black,
                  isNamber: false,
                  valid: (val) {
                    return validInput(val!, 1, 255, "addressName");
                  },
                  mycontroller: controller.addressName,
                  label: translateDataBase("اسم للعنوان", "Address Name"),
                  iconData: Icons.location_on_outlined,
                  hinttext: translateDataBase("اسم ألعنوان ليذكرك لاحقا",
                      "Title name to remind you later"),
                ),
                Container(
                  color: AppColor.primaryColor.withOpacity(0.2),
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: GetBuilder<GovernorateControllerImp>(
                      init: GovernorateControllerImp(),
                      builder: (controllerImp) => DropdownButton(
                            style: const TextStyle(
                              color: AppColor.black,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                            menuMaxHeight: Get.height * 0.3,
                            isExpanded: true,

                            alignment: Alignment.center,
                            borderRadius: BorderRadius.circular(20),
                            icon: const Icon(
                              Icons.location_city,
                              color: AppColor.black,
                            ),
                            hint: Text(
                              translateDataBase(
                                  "اختر المحافظة", "Select the City"),
                              style: const TextStyle(color: AppColor.black),
                            ),
                            items: List.generate(
                                    controllerImp.governorate.length,
                                    (index) => controllerImp.governorate[index])
                                .map((e) => DropdownMenuItem(
                                      value: e['governorate_id'],
                                      child: Text(translateDataBase(
                                          e['governorate_name_ar'],
                                          e['governorate_name_en'])),
                                    ))
                                .toList(),
                            onChanged: (val) {
                              controller.cat = val;
                              controllerImp.update();
                            },
                            value: controller.cat,
                          )),
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomFormAddress(
                  cursorColor: AppColor.black,
                  isNamber: false,
                  valid: (val) {
                    return validInput(val!, 5, 255, "address");
                  },
                  mycontroller: controller.addressStreet,
                  label: "address".tr,
                  iconData: Icons.location_on_outlined,
                  hinttext: "addresshint".tr,
                ),
                // SizedBox(height: Get.height*0.1,),
              ],
            ),
          ),
        ));
  }
}
