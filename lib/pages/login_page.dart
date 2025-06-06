import 'package:flutter/material.dart';
import 'package:fooddelivery/component/my_button.dart';
import 'package:fooddelivery/component/my_textfield.dart';
import 'package:fooddelivery/services/auth/auth_service.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({
    super.key,
    required this.onTap,
  });
  final void Function()? onTap;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //text editing controller
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  //login method
  void login() async {
    // get instance of auth service
    final authService = AuthService();

    // try log in
    try {
      await authService.logInWithEmailPassword(emailController.text, passwordController.text);
    }

    // display any errors
    catch (e) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(e.toString()),
        ),
      );
    }
  }
  
  // forgot password
  void forgotPw() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Theme.of(context).colorScheme.surface,
        title: const Text("User tapped forgot password"),
      ),
    );
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
            // Icon(
            //   Icons.lock_open_rounded,
            //   size: 100,
            //   color: Theme.of(context).colorScheme.inversePrimary,
            // ),
            Image.asset(
              'lib/images/login page logo.png',
              width: 100,
              height: 100,
              fit: BoxFit.cover,
            ),

            const SizedBox(height: 25,),

            //message, app slogan
            Text(
              'Food Delivery App',
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

            const SizedBox(height: 25,),

            //sign in button
            MyButton(
              text: 'Log In',
              onTap: login,
            ),

            const SizedBox(height: 25,),

            //not a member? register now
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Not a member?',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ),
                ),
                const SizedBox(width: 4,),
                GestureDetector(
                  onTap: widget.onTap,
                  child: Text(
                    'Register now',
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
