import 'package:flutter/material.dart';
import 'package:petfeeder/util/const.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

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
    // Home(),
    // ListWarung(),
    // Notifikasi(),
    // ProfileScreen(),
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
        onTap: changeSelectedNavBar,
        currentIndex: _selectedNavbar,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.menu_book),
            title: Text('Grafik',
                style: TextStyle(
                    fontFamily: 'Poppins', fontWeight: FontWeight.w400)),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment),
            title: Text('Data Jam',
                style: TextStyle(
                    fontFamily: 'Poppins', fontWeight: FontWeight.w400)),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            title: Text('Data ESP32',
                style: TextStyle(
                    fontFamily: 'Poppins', fontWeight: FontWeight.w400)),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            title: Text('Profil',
                style: TextStyle(
                    fontFamily: 'Poppins', fontWeight: FontWeight.w400)),
          ),
        ],
      ),
    );
  }
}
