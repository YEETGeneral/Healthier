import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mobile_flutter_healthier/screens/home_screen.dart';
import 'package:mobile_flutter_healthier/screens/login_screen.dart';

import 'login_or_register_screen.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if(snapshot.hasData) {
            return HomeScreen();
          } else {
            return LogOrRegisterPage();
          }
        },
      ),
    );
  }
}
