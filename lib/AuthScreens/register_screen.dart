import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mobile_flutter_healthier/components/MyButton.dart';
import 'package:mobile_flutter_healthier/components/MyTextField.dart';
import 'package:mobile_flutter_healthier/components/SquareTile.dart';

import '../services/auth_services.dart';

// rgb(40, 40, 40) - Grey background
// rgb(1, 174, 92) - Main theme green

class RegisterScreen extends StatefulWidget {
  final Function()? onTap;
  const RegisterScreen({super.key, required this.onTap});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  void singUserUp() async{
    // Loading circle
    showDialog(context: context, builder: (context) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    },);

    try {
      if (passwordController.text == confirmPasswordController.text) {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: emailController.text,
            password: passwordController.text
        );
      } else {
        errorMessage("Hasła nie są takie same");
      }
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
  final confirmPasswordController = TextEditingController();

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
                const SizedBox(height: 5),
                const Image(
                  width: 200,
                  height: 200,
                  image: AssetImage('assets/GreenLogo.png'),
                ),

                const SizedBox(height: 15),
                MyTextField(
                  controller: emailController,
                  hintText: 'Email',
                  obscureText: false,
                ),

                const SizedBox(height: 10),
                MyTextField(
                  controller: passwordController,
                  hintText: 'Hasło',
                  obscureText: true,
                ),

                const SizedBox(height: 10),
                MyTextField(
                  controller: confirmPasswordController,
                  hintText: 'Powtórz hasło',
                  obscureText: true,
                ),

                const SizedBox(height: 30),
                MyButton(
                  message: "Zarejestruj",
                  onTap: singUserUp,
                ),

                const SizedBox(height: 35),
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

                const SizedBox(height: 35),

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

                const SizedBox(height: 35),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Masz już konto?",
                      style: TextStyle(
                        color: Colors.white60,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 10),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: const Text(
                        "Zaloguj się teraz!",
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
