import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mobile_flutter_healthier/components/MyButton.dart';
import 'package:mobile_flutter_healthier/components/MyTextField.dart';
import 'package:mobile_flutter_healthier/components/SquareTile.dart';
import 'package:mobile_flutter_healthier/services/auth_services.dart';

import 'forgot_password_screen.dart';

// rgb(40, 40, 40) - Grey background
// rgb(1, 174, 92) - Main theme green

class LoginScreen extends StatefulWidget {
  final Function()? onTap;
  const LoginScreen({super.key, required this.onTap});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  void singInUser() async{
    // Loading circle
    showDialog(context: context, builder: (context) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    },);

    // Try sing in
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text
      );
      Navigator.pop(context);
    } on FirebaseAuthException catch(e) {

      Navigator.pop(context);

      errorMessage(e.code);
    }
  }

  void errorMessage(String message) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: Colors.deepOrange,
            title: Center(
              child: Text(
                message,
                style: const TextStyle(color: Colors.white),
              ),
            ),
          );
        }
    );
  }

  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(40, 40, 40, 1),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 10),
                const Image(
                  width: 200,
                  height: 200,
                  image: AssetImage('assets/GreenLogo.png'),
                ),

                const SizedBox(height: 20),
                MyTextField(
                  controller: emailController,
                  hintText: 'Email',
                  obscureText: false,
                ),

                const SizedBox(height: 15),
                MyTextField(
                  controller: passwordController,
                  hintText: 'Hasło',
                  obscureText: true,
                ),

                const SizedBox(height: 5),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 5, 25.0, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () => {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return ForgotPasswordPage();
                          }))
                        },
                        child: const Text(
                          "Zapomniałem hasła",
                          style: TextStyle(
                              color: Color.fromRGBO(146, 146, 146, 0.8),
                              fontWeight: FontWeight.bold,
                              fontSize: 17
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 30),
                MyButton(
                  message: "Zaloguj",
                  onTap: singInUser,
                ),

                const SizedBox(height: 50),
                Row(
                  children: const [
                    Expanded(
                      child: Divider(
                        thickness: 0.7,
                        color: Colors.white70,
                      ),
                    ),

                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        "Albo użyj",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 16
                        ),
                      ),
                    ),

                    Expanded(
                      child: Divider(
                        thickness: 0.7,
                        color: Colors.white70,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 50),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SquareTile(
                      imagePath: "assets/google.png",
                      onTap: () => AuthService().signInWithGoogle(),
                    ),
                    const SizedBox(width: 30),
                    SquareTile(
                      imagePath: "assets/apple.png",
                      onTap: () {},
                    ),
                  ],
                ),

                const SizedBox(height: 50),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Nie masz konta?",
                      style: TextStyle(
                        color: Colors.white60,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 10),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: const Text(
                        "Załóż je teraz!",
                        style: TextStyle(
                          color: Color.fromRGBO(70, 70, 230, 1),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
            ],),
          ),
        ),
      ),
    );
  }
}
