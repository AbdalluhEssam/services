import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:services/core/constant/color.dart';
import 'package:services/view/screen/booking/checkout/orderglus.dart';
import 'package:services/view/screen/home/home.dart';
import 'package:services/view/screen/home/personinformation.dart';
import 'binding.dart';
import 'controller/home/home_controller.dart';
import 'core/class/handlingdataview.dart';
import 'core/functions/alertextiapp.dart';
import 'core/localization/changelocal.dart';
import 'core/localization/translation.dart';
import 'core/services/services.dart';
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
      title: 'Service',
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
    const BookingView(),
    const PersonInformation(),
  };

  @override
  Widget build(BuildContext context) {
    Get.put(HomeControllerImp());
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
        items: const [
          Icon(Icons.home),
          Icon(Icons.history),
          Icon(Icons.person),
        ],
        index: _currentIndex,
        onTap: _changeItem,
      ),
    );
  }
}
