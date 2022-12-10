import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Login Page'),
            ElevatedButton(
              onPressed: () {
                context.router.pushNamed('/home');
              },
              child: const Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
