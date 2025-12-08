import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:food_delivery/pages/bottom_navbar.dart';
import 'package:food_delivery/pages/food_details_page.dart';

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setPreferredOrientations([
  //   DeviceOrientation.portraitUp,
  //   DeviceOrientation.portraitDown,
  // ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return Platform.isAndroid
        ? MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Foodak - Food Delivery',
            theme: ThemeData(
              primarySwatch: Colors.deepOrange,
              useMaterial3: false,
              scaffoldBackgroundColor: Colors.grey[100],
              appBarTheme: AppBarTheme(
                backgroundColor: Colors.grey[100],
                foregroundColor: Colors.black,
                elevation: 0,
              ),
              dividerTheme: const DividerThemeData(
                thickness: 2,
                indent: 20,
                endIndent: 20,
              ),
              listTileTheme: const ListTileThemeData(
                iconColor: Colors.deepOrange,
              ),
              fontFamily: 'OpenSans',
            ),
            routes: {
              '/': (context) => const BottomNavBarPage(),
              FoodDetailsPage.routeName: (context) => FoodDetailsPage(),
            },
          )
        : CupertinoApp(
            debugShowCheckedModeBanner: false,
            title: 'Foodak - Food Delivery',
            theme: const CupertinoThemeData(primaryColor: Colors.deepOrange),
            routes: {'/': (context) => const BottomNavBarPage()},
          );
  }
}
