import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:services/core/constant/color.dart';
import 'package:services/core/functions/translatedordatabase.dart';
import '../../../controller/home/categoriespro_controller.dart';
import '../../../core/class/handlingdataview.dart';
import '../../../core/constant/routes.dart';
import '../../../core/functions/validinput.dart';
import '../../../data/model/itemsmodel.dart';
import '../../../likeapi.dart';
import '../../widget/alert_dialog.dart';
import '../../widget/auth/customtextformauth.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(CategoriesProControllerImp());
    return Scaffold(
        appBar: AppBar(
          title: Text(translateDataBase("مقدم الخدمة", "Service provider")),
        ),
        floatingActionButton: GetBuilder<CategoriesProControllerImp>(
          builder: (controller) => Visibility(
            visible:
                controller.myServices.sharedPreferences.getString("admin") ==
                    "1",
            child: FloatingActionButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return Dialog(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        elevation: 0,
                        backgroundColor: Colors.transparent,
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: SingleChildScrollView(
                            child: Padding(
                              padding: const EdgeInsets.all(12),
                              child: Form(
                                key: controller.formState,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    // Padding(
                                    //   padding: const EdgeInsets.all(16.0),
                                    //   child: Text(
                                    //     '${translateDataBase("إضافة موظف", "Add Employee")}',
                                    //     style: TextStyle(
                                    //       fontSize: 20,
                                    //       fontWeight: FontWeight.bold,
                                    //     ),
                                    //   ),
                                    // ),
                                    GetBuilder<CategoriesProControllerImp>(
                                      builder: (controller) => InkWell(
                                        onTap: () {
                                          controller.imgGlr();
                                          controller.update();
                                        },
                                        child: Container(
                                          clipBehavior:
                                              Clip.antiAliasWithSaveLayer,
                                          decoration: const BoxDecoration(
                                            color: Colors.grey,
                                            shape: BoxShape.circle,
                                          ),
                                          width: 150,
                                          height: 150,
                                          child: Center(
                                            child: controller.myFile == null
                                                ? const Icon(
                                                    Icons.add_a_photo_outlined)
                                                : Image.file(
                                                    controller.myFile!,
                                                    fit: BoxFit.cover,
                                                  ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 16),
                                    CustomFormAdd(
                                      isNamber: false,
                                      valid: (val) {
                                        return validInput(
                                            val!, 3, 1000, "name");
                                      },
                                      mycontroller: controller.name,
                                      label:
                                          "${translateDataBase("الاسم بالانجليزى", "Name in English")}",
                                      hinttext:
                                          "${translateDataBase("الاسم بالانجليزى", "Name in English")}",
                                      iconData: Icons.drive_file_rename_outline,
                                    ),
                                    // Add more TextFormField widgets for other fields like phone, etc.
                                    const SizedBox(height: 8),
                                    CustomFormAdd(
                                      isNamber: false,
                                      valid: (val) {
                                        return validInput(
                                            val!, 3, 1000, "name");
                                      },
                                      mycontroller: controller.nameAr,
                                      label:
                                          "${translateDataBase("الاسم بالعربي", "Name in Arabic")}",
                                      hinttext:
                                          "${translateDataBase("الاسم بالعربي", "Name in Arabic")}",
                                      iconData: Icons.drive_file_rename_outline,
                                    ),
                                    const SizedBox(height: 8),
                                    CustomFormAdd(
                                      isNamber: false,
                                      valid: (val) {
                                        return validInput(
                                            val!, 3, 10000, "Desc");
                                      },
                                      mycontroller: controller.itemsDesc,
                                      label:
                                          "${translateDataBase("الوصف بالانجليزى", "Description in English")}",
                                      hinttext:
                                          "${translateDataBase("الوصف بالانجليزى", "Description in English")}",
                                      iconData: Icons.drive_file_rename_outline,
                                    ),
                                    const SizedBox(height: 8),
                                    CustomFormAdd(
                                      isNamber: false,
                                      valid: (val) {
                                        return validInput(
                                            val!, 3, 10000, "Desc");
                                      },
                                      mycontroller: controller.itemsDescAr,
                                      label:
                                          "${translateDataBase("الوصف بالعربي", "Description in Arabic")}",
                                      hinttext:
                                          "${translateDataBase("الوصف بالعربي", "Description in Arabic")}",
                                      iconData: Icons.drive_file_rename_outline,
                                    ),
                                    // Add more TextFormField widgets for other fields like phone, etc.
                                    const SizedBox(height: 8),
                                    CustomFormAdd(
                                      isNamber: true,
                                      valid: (val) {
                                        return validInput(
                                            val!, 1, 10000, "count");
                                      },
                                      mycontroller: controller.itemsDescount,
                                      label:
                                          "${translateDataBase("نسبة الخصم", "discount percentage")}",
                                      hinttext:
                                          "${translateDataBase("نسبة الخصم", "discount percentage")}",
                                      iconData: Icons.numbers,
                                    ),
                                    // Add more TextFormField widgets for other fields like phone, etc.
                                    GetBuilder<CategoriesProControllerImp>(
                                      builder: (controller) => ListTile(
                                          title: Text(
                                              "${translateDataBase("اظهار للجميع", "Show to everyone")}"),
                                          trailing: Switch(
                                            value: controller.itemsActive,
                                            onChanged: (value) {
                                              controller.toggleActive();
                                            },
                                          )),
                                    ),
                                    const SizedBox(height: 16),
                                    Row(
                                      children: [
                                        ElevatedButton(
                                          onPressed: () {
                                            // Add your logic to save employee data
                                            controller.addData();
                                          },
                                          child: Text(
                                              '${translateDataBase("اضافة", "Add")}'),
                                        ),
                                        const SizedBox(
                                          width: 12,
                                        ),
                                        ElevatedButton(
                                          onPressed: () {
                                            // Add your logic to save employee data
                                            Get.back();
                                          },
                                          child: Text(
                                              '${translateDataBase("الغاء", "Cancel")}'),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    });
              },
              child: const Icon(
                Icons.add_a_photo_outlined,
                color: Colors.white,
              ),
            ),
          ),
        ),
        body: GetBuilder<CategoriesProControllerImp>(
            builder: (controller) => HandlingDataView(
                statusRequest: controller.statusRequest,
                widget: const ListProCat())));
  }
}

class ListProCat extends GetView<CategoriesProControllerImp> {
  const ListProCat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView.separated(
          itemCount: controller.items.length,
          itemBuilder: (context, i) {
            return ListProCatCart(
                itemsModel: ItemsModel.fromJson(controller.items[i]));
          },
          separatorBuilder: (BuildContext context, int index) => const SizedBox(
            height: 15,
          ),
        ),
      ),
    );
  }
}

class ListProCatCart extends StatelessWidget {
  final ItemsModel itemsModel;

  const ListProCatCart({Key? key, required this.itemsModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CategoriesProControllerImp controller =
        Get.put(CategoriesProControllerImp());
    return InkWell(
      onTap: () {
        Get.toNamed(AppRoute.productDetails, arguments: {
          "itemsModel": itemsModel,
        });
      },
      child: Card(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          color: AppColor.secoundColorBack,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Stack(
                children: [
                  CachedNetworkImage(
                    imageUrl: "${AppLink.imageItems}/${itemsModel.itemsImage}",
                    fit: BoxFit.cover,
                    width: Get.width * 0.5,
                    // width: Get.width,
                  ),
                  Visibility(
                      visible: controller.myServices.sharedPreferences
                              .getString("admin") ==
                          "1",
                      child: CircleAvatar(
                        child: FloatingActionButton(
                            shape: const CircleBorder(),
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (context) => buildAlertDialog(
                                  context: context,
                                  text: 'هل تريد حدف المنتج',
                                  content: Text(
                                      "اسم المنتج : ${itemsModel.itemsNameAr}"),
                                  textButton: 'تاكيد الحذف',
                                  onPressed: () {
                                    controller.deleteData(
                                        itemsModel.itemsId.toString(),
                                        itemsModel.itemsImage.toString());
                                    Get.back();
                                    Get.appUpdate();
                                    Get.forceAppUpdate();
                                  },
                                ),
                              );
                            },
                            child: const Icon(
                              Icons.delete_outline,
                              color: Colors.white,
                            )),
                      ))
                ],
              ),
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${translateDataBase(itemsModel.itemsNameAr, itemsModel.itemsName)}",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            "${translateDataBase(itemsModel.categoriesNameAr, itemsModel.categoriesName)}",
                            style: TextStyle(
                                fontSize: 12,
                                height: 1,
                                color: AppColor.primaryColor.withOpacity(0.8)),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      OutlinedButton(
                          style: const ButtonStyle(
                              backgroundColor: MaterialStatePropertyAll(
                                  AppColor.primaryColor),
                              side: MaterialStatePropertyAll(BorderSide.none)),
                          onPressed: () {
                            // controller.addCart("${itemsModel.itemsId}");
                          },
                          child: Text(
                            translateDataBase("احجز", "Booking"),
                            style: const TextStyle(
                                color: AppColor.backgroundColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          ))
                    ],
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
