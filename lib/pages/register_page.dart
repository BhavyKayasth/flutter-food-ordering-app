import 'package:flutter/material.dart';
import 'package:fooddelivery/services/auth/auth_service.dart';

import '../component/my_button.dart';
import '../component/my_textfield.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({
    super.key,
    required this.onTap,
  });
  final void Function()? onTap;

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}


class _RegisterPageState extends State<RegisterPage> {
  // text editing controllers
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  void register() async {
    //get auth service
    final authService = AuthService();

    // check if password math -> create user
    if (passwordController.text == confirmPasswordController.text) {
      // try creating user
      try {
        await authService.signUpWithEmailPassword(emailController.text, passwordController.text);
      }

      // display any errors
      catch (e) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text(e.toString(),),
          ),
        );
      }
    }

    // // if password don't match -> show error
    else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text("Password don't match!"),
        ),
      );
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //logo
            Image.asset(
              'lib/images/login page logo.png',
              width: 100,
              height: 100,
              fit: BoxFit.cover,
            ),

            const SizedBox(height: 25,),

            //message, app slogan
            Text(
              "Let's create an account for you",
              style: TextStyle(
                fontSize: 16,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
            ),

            const SizedBox(height: 25,),

            //email text field
            MyTextfield(
                controller: emailController,
                hintText: 'Email',
                obscureText: false
            ),

            const SizedBox(height: 10,),

            //password text field
            MyTextfield(
                controller: passwordController,
                hintText: 'Password',
                obscureText: true
            ),

            const SizedBox(height: 10,),

            //confirmPassword text field
            MyTextfield(
                controller: confirmPasswordController,
                hintText: 'Confirm password',
                obscureText: true
            ),

            const SizedBox(height: 25,),

            //sign in button
            MyButton(
              text: 'Sign In',
              onTap: register,
            ),

            const SizedBox(height: 25,),

            //already have a account? Login here
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'already have a account?',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ),
                ),
                const SizedBox(width: 4,),
                GestureDetector(
                  onTap: widget.onTap,
                  child: Text(
                    'Login now',
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.inversePrimary,
                        fontWeight: FontWeight.bold
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
