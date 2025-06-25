import 'package:flutter/material.dart';
import 'package:flutter_pokemon_clean_architecture/src/config/utils/constants.dart';
import 'package:go_router/go_router.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(kDefaultPadding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _usernameController,
              decoration: const InputDecoration(labelText: 'Nombre de usuario'),
            ),
            const SizedBox(height: kDefaultPadding),
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(labelText: 'Contraseña'),
              obscureText: true,
            ),
            const SizedBox(height: kDefaultPadding),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () => context.go('/reset-password'),
                child: const Text('Restablecer contraseña'),
              ),
            ),
            const SizedBox(height: kDefaultPadding),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () => context.go('/'),
                    child: const Text('Iniciar sesión'),
                  ),
                ),
                const SizedBox(width: kDefaultPadding),
                IconButton(
                  icon: const Icon(Icons.fingerprint),
                  onPressed: () => _fingerprintLogin(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _fingerprintLogin() {
    // Código para iniciar sesión con huella
  }
}
