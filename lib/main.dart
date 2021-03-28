import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sqlite_demo/injector.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:sqlite_demo/modules/drink/app/ui/list_drink/list_drink_page.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupInjector();
  setupEasyLoading();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      builder: (BuildContext context, Widget child) => FlutterEasyLoading(child: child),
      title: 'Flutter Demo',
      home: ListDrinkPage(),
    );
  }
}

void setupEasyLoading() {
  EasyLoading.instance
    ..indicatorType = EasyLoadingIndicatorType.ring
    ..maskType = EasyLoadingMaskType.black
    ..loadingStyle = EasyLoadingStyle.custom
    ..backgroundColor = Colors.white
    ..indicatorColor = Colors.red
    ..progressColor = Colors.redAccent
    ..userInteractions = false
    ..textColor = Colors.black;
}
