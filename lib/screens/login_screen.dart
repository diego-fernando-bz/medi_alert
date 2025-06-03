import 'package:flutter/material.dart';
import 'register_screen.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

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
                  onPressed: () {
                    // Lógica de inicio de sesión
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Inicio de sesión simulado")),
                    );
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
