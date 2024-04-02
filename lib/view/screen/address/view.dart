import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:services/view/widget/home/text_widget.dart';
import '../../../controller/home/address/address_controller.dart';
import '../../../core/class/handlingdataview.dart';
import '../../../core/constant/color.dart';
import '../../../core/constant/routes.dart';
import '../../../core/functions/translatedordatabase.dart';
import '../../../data/model/address_model.dart';

class AddressView extends StatelessWidget {
  const AddressView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(AddressControllerImp());
    return Scaffold(
        appBar: AppBar(
          title: Text("address".tr),
          centerTitle: true,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.toNamed(AppRoute.addressAdd,arguments: {
              'currentRoute' : Get.currentRoute
            });
          },
          child: const Icon(Icons.add),
        ),
        body: GetBuilder<AddressControllerImp>(
            builder: (controller) => HandlingDataViewAddress(
                  statusRequest: controller.statusRequest,
                  widget: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                    child: ListItemsSearch(listData: controller.address),
                  ),
                )));
  }
}

class ListItemsSearch extends GetView<AddressControllerImp> {
  final List<AddressModel> listData;

  const ListItemsSearch({Key? key, required this.listData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      itemCount: listData.length,
      itemBuilder: (context, index) {
        return InkWell(
          child: Container(
            decoration: BoxDecoration(
              color: AppColor.backgroundColor.withOpacity(0.2),
            ),
            margin: const EdgeInsets.symmetric(vertical: 2),
            child: Card(
              elevation: 5,
              child: Wrap(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              RowText(title: translateDataBase("اسم عنوانك : ", "Address Name : "), value: listData[index].addressName.toString(),),
                              RowText(title:  translateDataBase("المحافظة : ", "City : "), value: translateDataBase(
                                  listData[index]
                                      .governorateNameAr
                                      .toString(),
                                  listData[index]
                                      .governorateNameEn
                                      .toString()),),

                              RowText(title: translateDataBase("الشارع : ", "Street : "), value:  listData[index]
                                  .addressStreet
                                  .toString(),),
                            ],
                          ),
                        ),
                        Column(
                          children: [
                            const Icon(
                              Icons.location_on_outlined,
                              color: AppColor.primaryColor,
                            ),
                            Text(translateDataBase(" موقعك رقم ${index + 1}",
                                "Location No ${index + 1}")),
                          ],
                        ),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      showDialog<String>(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                          title: Text(translateDataBase(
                              'تأكيد الحذف', "Delete Confirmation")),
                          content: Text(translateDataBase(
                              'هل تريد الحذف', "Do you want to delete")),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () =>
                                  Navigator.pop(context, 'Cancel'),
                              child: Text(
                                  translateDataBase('الغاء', 'Cancel')),
                            ),
                            TextButton(
                              onPressed: () {
                                controller.deleteAddressData(
                                    listData[index].addressId.toString());
                                Get.back();
                              },
                              child:
                                  Text(translateDataBase('موافق', 'OK')),
                            ),
                          ],
                        ),
                      );
                    },
                    child: Container(
                      clipBehavior: Clip.none,
                      height: 30,
                      width: Get.width,
                      color: AppColor.primaryColor.withOpacity(0.5),
                      // alignment: Alignment.center,
                      child: const Icon(
                        Icons.delete,
                        color: AppColor.black,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
