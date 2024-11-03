import 'package:flutter/material.dart';
import 'views/home_page.dart';
import 'views/profile_page.dart';
import 'views/spash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bus Booking App',
      home: SplashScreen(), // Ganti HomePage dengan SplashScreen
      routes: {
        '/profile': (context) => ProfilePage(), // Routing ke halaman profil
      },
    );
  }
}
