import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:food_delivery/pages/favorites_page.dart';
import 'package:food_delivery/pages/home_page.dart';
import 'package:food_delivery/pages/account_page.dart';

class BottomNavBarPage extends StatefulWidget {
  const BottomNavBarPage({super.key});

  @override
  State<BottomNavBarPage> createState() => _BottomNavBarPageState();
}

class _BottomNavBarPageState extends State<BottomNavBarPage>with WidgetsBindingObserver {
  int selectedindex = 0;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }
  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    debugPrint(state.toString());
    
  }

  List<Widget> bodyOptions = const [HomePage(), FavoritesPage(), AccountPage()];

  void onitemtapped(int newindex) {
    setState(() {
      selectedindex = newindex;
    });
    debugPrint('the new index is $newindex');
  }

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    final PreferredSizeWidget? appBar;
    if (Platform.isAndroid) {
      appBar = AppBar(title: Center(child: const Text("Foodak")));
    } else if (Platform.isIOS) {
      appBar = CupertinoNavigationBar(
        middle: Center(child: const Text("Foodak")),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      );
    } else {
      appBar = null;
    }

    return Scaffold(
      drawer: const Drawer(child: Center(child: Text("Iam in the drawer!"))),
      appBar: AppBar(
        title: Center(
          child: const Text(
            "Foodak         ",
            style: TextStyle(
              fontFamily: 'OpenSans',
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),

      body: SafeArea(child: bodyOptions[selectedindex]),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorite',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Account'),
        ],
        currentIndex: selectedindex,
        selectedItemColor: Colors.deepOrange,
        onTap: onitemtapped,
      ),
    );
  }
}
