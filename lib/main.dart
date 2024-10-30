import 'package:flutter/material.dart';
import 'package:booking_bus/views/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Arrowspeed - Bus Booking',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: HomePage(), // Halaman utama
    );
  }
}
