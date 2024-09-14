import 'package:flutter/material.dart';
import 'package:news_app/pages/components/categories.dart';
import 'package:news_app/pages/components/notification.dart';
import 'package:news_app/pages/components/settings.dart';
import 'package:news_app/pages/home_screen.dart';
// import 'package:news_app/utils/colors.dart';

class Navbar extends StatefulWidget {
  const Navbar({super.key});

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  int _currentIndex = 0;

  List<Widget> pages = [
    const HomeScreen(),
    const Categories(),
    const NotificationPage(),
    const Settings(),
  ];
  @override
  Widget build(BuildContext context) {
    double myHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: pages.elementAt(_currentIndex),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        // backgroundColor: AppColors.bgColor,
        selectedItemColor: Color(0xffFB700),
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        onTap: ((value) {
          setState(() {
            _currentIndex = value;
          });
        }),
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_outlined,
              size: myHeight * 0.03,
            ),
            label: '',
            activeIcon: Icon(
              Icons.home,
              size: myHeight * 0.03,
              color: Color(0xffFBC700),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.category_outlined,
              size: myHeight * 0.03,
            ),
            label: '',
            activeIcon: Icon(
              Icons.category_rounded,
              size: myHeight * 0.03,
              color: Color(0xffFBC700),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.notifications_none_rounded,
              size: myHeight * 0.03,
            ),
            label: '',
            activeIcon: Icon(
              Icons.notifications,
              size: myHeight * 0.03,
              color: Color(0xffFBC700),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.settings_outlined,
              size: myHeight * 0.03,
            ),
            label: '',
            activeIcon: Icon(
              Icons.settings_rounded,
              size: myHeight * 0.03,
              color: Color(0xffFBC700),
            ),
          ),
        ],
      ),
    );
  }
}
