import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:services/controller/home/home_controller.dart';
import 'package:services/core/class/handlingdataview.dart';
import 'package:services/core/functions/translatedordatabase.dart';
import 'package:services/view/screen/home/searchscreen.dart';
import 'package:services/view/screen/home/topselling.dart';
import 'package:services/view/widget/home/customtitlehome.dart';
import 'package:url_launcher/url_launcher_string.dart';
import '../../../core/constant/color.dart';
import '../../../core/constant/routes.dart';
import '../../../likeapi.dart';
import '../../widget/home/listseviceshome.dart';

int? currentIndex = 0;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Get.put(HomeControllerImp());
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColor.backgroundColor,
          elevation: 0,
          titleSpacing: 0,
          toolbarHeight: 80,
          automaticallyImplyLeading: false,
          centerTitle: false,
          title: const Text("Cleany"),
          leading: IconButton(onPressed: () {
            
          }, icon: const Icon(Icons.menu)),
          actions: [
            IconButton(
              onPressed: () {
                Get.toNamed(AppRoute.notificationScreen);
              },
              icon: const Icon(
                Icons.notifications_active_outlined,
                size: 30,
              ),
            ),
            IconButton(
              onPressed: () {
                // Get.toNamed(AppRoute.notificationScreen);
              },
              icon: const Icon(
                Icons.shopping_cart_outlined,
                size: 30,
              ),
            ),
          ],
        ),
        body: GetBuilder<HomeControllerImp>(
            builder: (controller) => HandlingDataView(
                statusRequest: controller.statusRequest,
                widget: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: ListView(
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        physics: const BouncingScrollPhysics(),
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          CarouselSlider(
                              items: controller.banner.map((imageUrl) {
                                return GestureDetector(
                                  onTap: () {
                                    if (imageUrl['link'] != null) {
                                      webSite(imageUrl['link']);
                                    }
                                  },
                                  child: Container(
                                    clipBehavior: Clip.hardEdge,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(10.0)),
                                    child: CachedNetworkImage(
                                        imageUrl:
                                            "${AppLink.imageBanner}/${imageUrl['banner_image']}",
                                        width: double.infinity,
                                        fit: BoxFit.cover),
                                  ),
                                );
                              }).toList(),
                              options: CarouselOptions(
                                viewportFraction: 0.92,
                                aspectRatio: 2.0,
                                initialPage: 2,
                                height: Get.height * 0.24,
                                enableInfiniteScroll: true,
                                reverse: false,
                                autoPlay: true,
                                autoPlayInterval: const Duration(seconds: 3),
                                autoPlayAnimationDuration:
                                    const Duration(milliseconds: 800),
                                autoPlayCurve: Curves.fastOutSlowIn,
                                enlargeCenterPage: true,
                                scrollDirection: Axis.horizontal,
                                onPageChanged: (index, _) {
                                  setState(() {
                                    currentIndex = index;
                                  });
                                },
                              )),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: controller.banner.map((url) {
                              int index =
                                  controller.banner.lastIndexOf(url).toInt();
                              // print(index);
                              return AnimatedContainer(
                                duration: const Duration(seconds: 1),
                                width: currentIndex == index ? 20 : 5,
                                height: 5,
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 2.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: currentIndex == index
                                      ? Colors.amber
                                      : Colors.blue,
                                ),
                              );
                            }).toList(),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Container(
                            height: 50,
                            margin: const EdgeInsets.symmetric(horizontal: 20),
                            child: TextFormField(
                              textAlignVertical: TextAlignVertical.center,
                              onTap: () {
                                showSearch(
                                    context: context, delegate: SearchScreen());
                              },
                              // keyboardType: TextInputType.none,
                              readOnly: true,

                              decoration: InputDecoration(
                                  isDense: true,
                                  suffixIcon: const Icon(Icons.search, size: 25),
                                  hintText: "${translateDataBase("ايحث", "Search")}",
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  filled: true,
                                  fillColor: Colors.grey[200]),
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          CustomTitleHome(title: "categories".tr),

                          const ListServicesHome(),
                          const SizedBox(
                            height: 10,
                          ),
                          CustomTitleHome(title: "${translateDataBase("الموصى بها بالنسبة لك", "Recomended for you")}"),
                          if (controller.itemsTopSelling.isNotEmpty)
                            const ItemsViewTopSelling(),

                        ])))));
  }

  webSite(url) async {
    await launchUrlString(url);
  }
}






