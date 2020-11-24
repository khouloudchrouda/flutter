import 'package:flutter/material.dart';
import 'package:prianou_app/home_page.dart';
import 'package:prianou_app/notifications_page.dart';
import 'package:prianou_app/profile_page.dart';

class MainLayoutPage extends StatefulWidget {
  @override
  _MainLayoutPageState createState() => _MainLayoutPageState();
}

class _MainLayoutPageState extends State<MainLayoutPage> {
  var _selectedIndex = 0;
  var list = [HomePage(), NotificationsPage(), ProfilePage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff79fbc8),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/logo-navbar.png',
              height: 40,
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              "Prianou",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold
              ),
            )
          ],
        ),
      ),
      body: list[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notifications',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_rounded),
            label: 'Profil',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Color(0xff79fbc8),
        unselectedItemColor: Colors.white,
        backgroundColor: Colors.black,
        onTap: _onItemTapped,
      ),
    );
  }

  _onItemTapped(int selected) {
    setState(() {
      _selectedIndex = selected;
    });
  }
}
