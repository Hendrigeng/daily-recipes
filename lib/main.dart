import 'package:flutter/material.dart';
import 'package:daily_recipes/pages/Loginpage.dart';
import 'package:daily_recipes/pages/splashscreen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:daily_recipes/services/preferences.services.dart';
import 'package:provider/provider.dart';
import 'package:daily_recipes/provider/Provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    PrefrencesService.prefs = await SharedPreferences.getInstance();

    if (PrefrencesService.prefs != null) {
      print(
          '========================= prefrences init Successfully ========================');
    }
  } catch (e) {
    print(
        '=========================Error In init Prefrences ${e}========================');
  }

  runApp( ChangeNotifierProvider(
      create: (_) => AdsProvider()..loadAdsList(),
      child:MyApp(),),);
}
class MyApp extends StatelessWidget {
 // final adsProvider = AdsProvider();
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,

      home: Splashscreen(),
    );
  }
}