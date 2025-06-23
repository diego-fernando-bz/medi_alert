import 'package:flutter/material.dart';
import 'package:medi_alert/screens/add_medication_screen.dart';
import 'package:medi_alert/screens/config_screen.dart';
import 'package:medi_alert/screens/login_screen.dart'; // Solo si tienes login

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Map<String, dynamic>> medicamentos = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MediAlert'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => LoginScreen()),
              );
            },
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(8),
        children: [
          const Text(
            'Próxima toma:',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          ...medicamentos.map(
            (med) => Card(
              child: ListTile(
                title: Text(med['nombre']),
                subtitle: Text(
                  'Inicio: ${med['horaInicio'].format(context)} - Frecuencia: ${med['frecuencia'].inHours}h',
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () async {
              final resultado = await Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const AddMedicationScreen()),
              );
              if (resultado != null) {
                setState(() => medicamentos.add(resultado));
              }
            },
            child: const Text('Añadir Medicamento'),
          ),
          const SizedBox(height: 8),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => ConfigScreen()),
              );
            },
            child: const Text('Configuración'),
          ),
        ],
      ),
    );
  }
}
