import 'package:flutter/material.dart';
import 'package:mobile_flutter_healthier/screens/login_screen.dart';
import 'package:mobile_flutter_healthier/screens/register_screen.dart';

class LogOrRegister extends StatefulWidget {
  const LogOrRegister({Key? key}) : super(key: key);

  @override
  State<LogOrRegister> createState() => _LogOrRegisterState();
}

class _LogOrRegisterState extends State<LogOrRegister> {
  bool showLoginPage = true;

  void togglePages() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if(showLoginPage) {
      return LoginScreen(
        onTap: togglePages,
      );
    } else {
      return RegisterScreen(
        onTap: togglePages,
      );
    }
  }
}

