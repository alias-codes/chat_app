import 'package:chatapp/components/my_button.dart';
import 'package:flutter/material.dart';
import 'package:chatapp/components/my_text_field.dart';

class LoginPage extends StatelessWidget {

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _pwController = TextEditingController();


  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //logo
            Icon(Icons.message, size: 60, color: Theme
                .of(context)
                .colorScheme
                .primary,),

            //login or sign up text
            Text(
              'Welcome!',
              style: TextStyle(
                  color: Theme
                      .of(context)
                      .colorScheme
                      .primary,
                  fontSize: 20
              ),
            ),

            //email placeholder
            MyTextField(hint1: 'Email',
              obscureText: false,
              controller: _emailController,),

            // password placeholder
            MyTextField(
              hint1: 'Password', obscureText: true, controller: _pwController,),

            //sign up/in button
            MyButton(text: 'Sign in'),

          ],
        ),
      ),
    );
  }
}
