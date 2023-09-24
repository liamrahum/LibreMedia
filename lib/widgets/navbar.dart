// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:off_the_hook/screens/screens.dart';
import 'package:off_the_hook/variables.dart';

class NavigationSystem extends StatefulWidget {
  const NavigationSystem({
    super.key,
  });

  @override
  State<NavigationSystem> createState() => _NavigationSystemState();
}

class _NavigationSystemState extends State<NavigationSystem> {
   static const List<Widget> _widgetOptions = <Widget>[
    Home(),
    History(),
    Settings()
  ];
  int _selectedIndex = 0;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: _widgetOptions[_selectedIndex]),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        onTap: (i) => setState(() {
          _selectedIndex = i;
        }),
        currentIndex: _selectedIndex,
        items: [
          BottomNavigationBarItem(activeIcon: SvgPicture.asset('lib/assets/icons/home-icon-filled.svg', height: 20),icon: SvgPicture.asset('lib/assets/icons/home-icon.svg', height: 20), label: "Home"),
          BottomNavigationBarItem(activeIcon: SvgPicture.asset('lib/assets/icons/history-icon-filled.svg', height: 20),icon: SvgPicture.asset('lib/assets/icons/history-icon.svg', height: 20), label: "History"),
          BottomNavigationBarItem(activeIcon: SvgPicture.asset('lib/assets/icons/settings-icon-filled.svg', height: 20),icon: SvgPicture.asset('lib/assets/icons/settings-icon.svg', height: 20), label: "Settings"),
        ],
         selectedItemColor: textColor,
        ),
    );
  }
}