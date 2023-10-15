import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mobile_flutter_healthier/components/MyButton.dart';
import 'package:mobile_flutter_healthier/components/MyTextField.dart';
import 'package:mobile_flutter_healthier/components/SquareTile.dart';

// rgb(40, 40, 40) - Grey background
// rgb(1, 174, 92) - Main theme green

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

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
      // Wrong mail
      if(e.code == 'user-not-found') {
        wrongEmailMessage();
      }

      // Wrong password
      else if(e.code == 'wrong-password') {
        wrongPasswordMessage();
      }
    }
  }

  void wrongEmailMessage() {
    showDialog(
        context: context,
        builder: (context) {
          return const AlertDialog(
            title: Text("Zły email"),
          );
        }
    );
  }

  void wrongPasswordMessage() {
    showDialog(
        context: context,
        builder: (context) {
          return const AlertDialog(
            title: Text("Złe hasło"),
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

              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 5, 25.0, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: const [
                    Text(
                      "Zapomniałem hasła",
                      style: TextStyle(color: Colors.white60, fontSize: 16),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),
              MyButton(
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
                children: const [
                  SquareTile(imagePath: "assets/google.png"),
                  SizedBox(width: 30),
                  SquareTile(imagePath: "assets/apple.png"),
                ],
              ),

              const SizedBox(height: 50),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    "Nie masz konta?",
                    style: TextStyle(
                      color: Colors.white60,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 10),
                  Text(
                    "Załóż je teraz!",
                    style: TextStyle(
                      color: Color.fromRGBO(70, 70, 230, 1),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
          ],),
        ),
      ),
    );
  }
}
