import 'package:noflix/models/models.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_font_icons/flutter_font_icons.dart';
import 'screens.dart';

class NavScreen extends StatefulWidget {
  _NavScreenState createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {
  final List<Widget> _screens = [
    const HomeScreen(key:  PageStorageKey("home screen")),
    ComingSoonScreen(key: const PageStorageKey("comingsoon screen")),
    SearchScreen(key: const PageStorageKey("search screen")),
    DownloadScreen(key: const PageStorageKey("download screen")),

    // Scaffold(),
  ];

  final Map<String, IconData> _icons = const {
    'Home': AntDesign.home,
    'Coming Soon': AntDesign.playcircleo,
    'Search': AntDesign.search1,
    'Downloads': AntDesign.download,
    // 'More': AntDesign.menu,
  };

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AppBarModel(),
        ),
      ],
      child: Scaffold(
        body: _screens[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.black,
          type: BottomNavigationBarType.fixed,
          items: _icons
              .map((title, icon) => MapEntry(
                  title,
                  BottomNavigationBarItem(
                    icon: Icon(icon, size: 30.0),
                    label: title,
                  )))
              .values
              .toList(),
          currentIndex: _currentIndex,
          selectedItemColor: Colors.white,
          selectedFontSize: 11.0,
          unselectedItemColor: Colors.grey,
          unselectedFontSize: 11.0,
          onTap: (int index) => setState(() => _currentIndex = index),
        ),
      ),
    );
  }
}
