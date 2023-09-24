import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: [
        BottomNavigationBarItem( icon: Icon(Icons.home_outlined), activeIcon: Icon(Icons.home), label: "Home"),
        BottomNavigationBarItem(icon: Icon(Icons.history_outlined), activeIcon: Icon(Icons.history), label: "History"),
        BottomNavigationBarItem(icon: Icon(Icons.settings_outlined),activeIcon: Icon(Icons.settings), label: "Settings")
      ]);
  }
}