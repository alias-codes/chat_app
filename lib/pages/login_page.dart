import 'package:chatapp/components/my_button.dart';
import 'package:flutter/material.dart';
import 'package:chatapp/components/my_text_field.dart';

class LoginPage extends StatelessWidget {

  final void Function()? onTap ;

  // login method
  void login() {

  }


  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _pwController = TextEditingController();


  LoginPage({super.key, required this.onTap});

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
            MyTextField(hint1: 'Password', obscureText: true, controller: _pwController,),

            const SizedBox(height: 10),

            //sign up/in button
              MyButton(text: 'Sign in', onTap: login,),

            const SizedBox(height: 24),
            // not a member? Register now
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Not a member? ", style: TextStyle(color: Theme.of(context).colorScheme.primary),),
                GestureDetector(
                  onTap: onTap,
                  child: Text(
                    "Register now",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                )
              ],
            )

          ],
        ),
      ),
    );
  }
}
