import 'package:flutter/material.dart';
import 'package:mobile_flutter_healthier/screens/login_screen.dart';
import 'package:mobile_flutter_healthier/screens/register_screen.dart';

class LogOrRegisterPage extends StatefulWidget {
  const LogOrRegisterPage({Key? key}) : super(key: key);

  @override
  State<LogOrRegisterPage> createState() => _LogOrRegisterPageState();
}

class _LogOrRegisterPageState extends State<LogOrRegisterPage> {
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

