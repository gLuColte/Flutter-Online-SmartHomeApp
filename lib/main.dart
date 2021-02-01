import 'package:flutter/material.dart';
import 'package:smart_home_app/screens/home_screen.dart';

void main() => runApp(SmartHome());

class SmartHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Smart Home App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.black,
        unselectedWidgetColor: Colors.grey.shade100,
        accentColor: Color(0xFF9D734D),
        scaffoldBackgroundColor: Colors.white,
      ),
      home: HomeScreen(),
    );
  }
}
