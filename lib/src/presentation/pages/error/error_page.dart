import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/not_found.png',
              width: 190,
              height: 190,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 32),
            Text(
              'Sorry, your Pokedex is not found!',
              style: theme.textTheme.titleMedium,
            ),
            const SizedBox(height: 16),
            TextButton(
              onPressed: () => context.replace('/'),
              child: const Text('Go to home'),
            ),
          ],
        ),
      ),
    );
  }
}
