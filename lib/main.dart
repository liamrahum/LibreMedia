import 'package:flutter/material.dart';
import 'variables.dart';
import 'widgets/navbar.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: appTheme,
      home: const Scaffold(
        backgroundColor: bgColor,
        body: HomePage(),
        bottomNavigationBar: BottomNavBar())
    );
  }
}


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return const Center(
        child: Text("asdada")
      
    );
  }
}