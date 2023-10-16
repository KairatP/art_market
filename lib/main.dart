import 'package:art_market/constance/colors.dart';
import 'package:art_market/router/router.dart';
import 'package:art_market/router/router_structure.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

bool showHomePage = true;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences preferences = await SharedPreferences.getInstance();
  showHomePage = preferences.getBool('On_Boardingg') ?? true;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: AppColors.mainColor),
      onGenerateRoute: MetaRouter.onGenerateRoute,
      initialRoute:
          showHomePage ? RouterStructure.welcome : RouterStructure.tabBar,
    );
  }
}
