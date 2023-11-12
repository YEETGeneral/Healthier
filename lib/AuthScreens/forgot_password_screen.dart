import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../components/MyTextField.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }
  
  Future passwordReset() async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: _emailController.text);
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text("Wysłano link do resetowania hasła na podanego maila!"),
            );
          }
      );
    } on FirebaseAuthException catch(e) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Text(e.message.toString()),
          );
        }
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(40, 40, 40, 1),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(2, 192, 74, 1),
        elevation: 0,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children:  [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.0),
            child: Text(
              "Wpisz swojego maila. Dostaniesz na niego wiadomość z linkiem do zmiany hasła",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color.fromRGBO(2, 170, 92, 1),
                fontSize: 20,
                fontWeight: FontWeight.bold
              ),
            ),
          ),
          const SizedBox(height: 30),
          MyTextField(
              controller: _emailController,
              hintText: "Podaj mail",
              obscureText: false
          ),

          const SizedBox(height: 20),
          MaterialButton(
            onPressed: passwordReset,
            child: Text("Resetuj hasło"),
            color: Color.fromRGBO(2, 174, 92, 1),
          ),
        ],
      ),
    );
  }
}
