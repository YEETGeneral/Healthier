import 'package:flutter/material.dart';
import 'package:mobile_flutter_healthier/screens/home_screen.dart';
import 'package:mobile_flutter_healthier/screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}


