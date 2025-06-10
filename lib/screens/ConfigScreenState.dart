import 'package:flutter/material.dart';

class ConfigScreen extends StatefulWidget {
  const ConfigScreen({super.key});

  @override
  State<ConfigScreen> createState() => _ConfigScreenState();
}

class _ConfigScreenState extends State<ConfigScreen> {
  bool notificationsEnabled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Configuración'),
        backgroundColor: Color(0xFFE3F2FD),
        elevation: 0,
      ),
      body: Container(
        color: Color(0xFFF8F0FA),
        child: ListView(
          padding: EdgeInsets.all(16),
          children: [
            // Bloque para Notificaciones
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Card(
                color: Color(0xFFE3F2FD),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: SwitchListTile(
                  title: Text(
                    'Notificaciones',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  value: notificationsEnabled,
                  onChanged:
                      (value) => setState(() => notificationsEnabled = value),
                  activeColor: Color(0xFF4FC3F7),
                  inactiveThumbColor: Color(0xFFB0BEC5),
                  inactiveTrackColor: Color(0xFFCFD8DC),
                ),
              ),
            ),

            // Bloque para Selección de Sonidos
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Card(
                color: Color(0xFFE3F2FD),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: ListTile(
                  title: Text(
                    'Selección de sonidos',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    size: 16.0,
                    color: Color(0xFF64B5F6),
                  ),
                  onTap: () {
                    print('Navegar a selección de sonidos');
                  },
                ),
              ),
            ),

            // Bloque para Preferencias de Repetición
            Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: Card(
                color: Color(0xFFE3F2FD),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: ListTile(
                  title: Text(
                    'Preferencias de repetición',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    size: 16.0,
                    color: Color(0xFF64B5F6),
                  ),
                  onTap: () {
                    print('Navegar a preferencias de repetición');
                  },
                ),
              ),
            ),

            // Botón Guardar
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Configuración guardada')),
                );
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF81D4FA),
                foregroundColor: Colors.white,
                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                textStyle: TextStyle(fontSize: 16),
              ),
              child: Text('Guardar'),
            ),
          ],
        ),
      ),
    );
  }
}
