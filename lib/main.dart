import 'package:flutter/material.dart';
import 'package:smart_home_app/screens/home_screen.dart';
import 'package:smart_home_app/screens/profile_page1.dart';

void main() => runApp(SmartHome());

class SmartHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/first': (context) => ProfilePage1(),
        '/second': (context) => ProfilePage1(),
        '/third': (context) => ProfilePage1(),
        '/fourth': (context) => ProfilePage1(),
      },
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

