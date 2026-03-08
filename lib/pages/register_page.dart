import 'package:chatapp/auth/auth_service.dart';
import 'package:chatapp/components/my_button.dart';
import 'package:flutter/material.dart';
import 'package:chatapp/components/my_text_field.dart';


class RegisterPage extends StatelessWidget {

  final void Function()? onTap;

  void register(BuildContext context) {
    // if passwords match -> create user
    if(_pwController.text == _confirmPwController.text) {
      try{
        final _auth = AuthService();
        _auth.signUpWithEmailPassword(_emailController.text, _pwController.text);
      } catch (e) {
        showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text(e.toString()),
            ),
        );
      }
    }
    // if passwords don't match -> show the error
    else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text("Passwords don't match!"),
        ),
      );
    }
  }

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _pwController = TextEditingController();
  final TextEditingController _confirmPwController = TextEditingController();


  RegisterPage({super.key, required this.onTap});

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
              "Let's create an account for you!",
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

            MyTextField(hint1: 'Confirm Password', obscureText: true, controller: _confirmPwController,),

            const SizedBox(height: 10),


            //sign up/in button
            MyButton(text: 'Register', onTap: () => register(context),),

            const SizedBox(height: 24),

            // Already have an account? Sign in
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Already have an account? ", style: TextStyle(color: Theme.of(context).colorScheme.primary),),
                GestureDetector(
                  onTap: onTap,
                  child: Text(
                    "Sign in",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
