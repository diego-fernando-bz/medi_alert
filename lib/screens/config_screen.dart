import 'package:flutter/material.dart';

class ConfigScreen extends StatelessWidget {
  const ConfigScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Configuración')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          ListTile(
            leading: Icon(Icons.volume_up),
            title: Text('Sonido de notificación'),
            subtitle: Text('Usar sonido por defecto'),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.repeat),
            title: Text('Repetición'),
            subtitle: Text('Cada 8 horas (por defecto)'),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.info),
            title: Text('Acerca de MediAlert'),
            subtitle: Text('Versión 1.0.0'),
          ),
        ],
      ),
    );
  }
}
