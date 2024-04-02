import 'dart:developer';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:services/core/constant/color.dart';
import 'package:services/view/screen/cart/cartview.dart';
import 'package:services/view/screen/home/home.dart';
import 'package:services/view/screen/home/personinformation.dart';
import 'binding.dart';
import 'controller/cart/cardview_controller.dart';
import 'controller/home/home_controller.dart';
import 'core/class/handlingdataview.dart';
import 'core/functions/alertextiapp.dart';
import 'core/localization/changelocal.dart';
import 'core/localization/translation.dart';
import 'core/services/services.dart';
import 'firebase_options.dart';
import 'routes.dart';

// Future<void> _backgroundHandler(RemoteMessage message) async {
//   await Firebase.initializeApp();
//   log("Message from background : ${message.notification?.body}");
// }

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // FirebaseMessaging.onBackgroundMessage(_backgroundHandler);
  // await initFcm();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  // FirebaseMessaging.onMessageOpenedApp.listen((event) {
  //   Get.toNamed(event.data['pagename']);
  // });
  await initialServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    LocaleController controller = Get.put(LocaleController());
    return GetMaterialApp(
      translations: MyTranslation(),
      debugShowCheckedModeBanner: false,
      title: 'Glus Family',
      locale: controller.language,
      theme: controller.appTheme,
      initialBinding: MyBinding(),
      // home: const Language(),
      getPages: routes,
      // routes: routes,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void _changeItem(int value) {
    setState(() {
      _currentIndex = value;
    });
  }

  int _currentIndex = 0;
  final Set<Widget> _widgetOptions = <Widget>{
    const HomePage(),
    // const CartView(),
    const PersonInformation(),
  };

  @override
  Widget build(BuildContext context) {
    Get.put(HomeControllerImp());
    // Get.put(CardViewControllerImp());
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
      ),
      body: WillPopScope(
          onWillPop: alertExitApp,
          child: GetBuilder<HomeControllerImp>(
              builder: (controller) => HandlingDataView(
                    statusRequest: controller.statusRequest,
                    widget: _widgetOptions.elementAt(_currentIndex),
                  ))),
      bottomNavigationBar: CurvedNavigationBar(
        height: 60,
        buttonBackgroundColor: AppColor.primaryColor,
        backgroundColor: AppColor.backgroundColor,
        items: [
          const Icon(Icons.home),
          // Stack(
          //   clipBehavior: Clip.none,
          //   children: [
          //     const Icon(Icons.shopping_cart),
          //     Positioned(
          //         bottom: 13,
          //         left: 13,
          //         child: Container(
          //             alignment: Alignment.center,
          //             padding: const EdgeInsets.only(bottom: 5),
          //             width: 15,
          //             decoration: const BoxDecoration(
          //                 shape: BoxShape.circle, color: AppColor.primaryColor),
          //             child: GetBuilder<CardViewControllerImp>(
          //               init: Get.put(CardViewControllerImp()),
          //               builder: (controller) =>
          //                   Text("${controller.cart.length}"),
          //             ))),
          //   ],
          // ),
          const Icon(Icons.person),
        ],
        index: _currentIndex,
        onTap: _changeItem,
      ),
    );
  }
}

