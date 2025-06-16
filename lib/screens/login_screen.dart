import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'register_screen.dart';
import 'home_screen.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<bool> validateLogin(String email, String password) async {
    final prefs = await SharedPreferences.getInstance();
    final savedEmail = prefs.getString('saved_email');
    final savedPassword = prefs.getString('saved_password');

    return (email == savedEmail && password == savedPassword);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text(
                  "MediAlert",
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 32),
                TextField(
                  controller: emailController,
                  decoration: InputDecoration(labelText: 'Correo electrónico'),
                ),
                SizedBox(height: 16),
                TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(labelText: 'Contraseña'),
                ),
                SizedBox(height: 24),
                ElevatedButton(
                  onPressed: () async {
                    final email = emailController.text.trim();
                    final password = passwordController.text.trim();

                    if (email.isEmpty || password.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("Por favor, completa todos los campos"),
                        ),
                      );
                    } else {
                      final isValid = await validateLogin(email, password);
                      if (isValid) {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (_) => HomeScreen()),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text("Correo o contraseña incorrectos"),
                          ),
                        );
                      }
                    }
                  },
                  child: Text("Iniciar Sesión"),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => RegisterScreen()),
                    );
                  },
                  child: Text("¿No tienes cuenta? Regístrate"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
