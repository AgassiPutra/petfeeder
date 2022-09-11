import 'package:flutter/material.dart';
import 'package:petfeeder/screens/dashboard.dart';
import 'package:petfeeder/screens/dataesp32.dart';
import 'package:petfeeder/screens/datajam.dart';
import 'package:petfeeder/screens/profil.dart';
import 'package:petfeeder/util/const.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BottomNav extends StatelessWidget {
  const BottomNav({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: Constants.appName,
      home: const NavBar(),
    );
  }
}

class NavBar extends StatefulWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  late SharedPreferences sharedPreferences;
  int _selectedNavbar = 0;
  final List<Widget> _children = [
    Dashboard(),
    DataJam(),
    DataEsp(),
    ProfileScreen(),
  ];

  void changeSelectedNavBar(int index) {
    setState(() {
      _selectedNavbar = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_selectedNavbar],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        onTap: changeSelectedNavBar,
        currentIndex: _selectedNavbar,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.graphic_eq_sharp),
            label: 'Grafik',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.lock_clock),
            label: 'Data Jam',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.memory),
            label: 'Data ESP32',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.emoji_people),
            label: 'Profil',
          ),
        ],
      ),
    );
  }
}
