

import 'package:art_market/constance/colors.dart';
import 'package:art_market/dependencies/injection_container.dart';
import 'package:art_market/dependencies/login_hive.dart';
import 'package:art_market/router/router.dart';
import 'package:art_market/router/router_structure.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';





bool welcomePage = true;
void main() async {
  // setupLocator();
  await initGetIt();
  await initHive();
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences preferences = await SharedPreferences.getInstance();
  welcomePage = preferences.getBool('On_Boardingg') ?? true;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: AppColors.greyColor),
      onGenerateRoute: MetaRouter.onGenerateRoute,
      initialRoute:
          welcomePage ? RouterStructure.welcome : RouterStructure.tabBar,
    );
  }
}
