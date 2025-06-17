import 'package:flutter/material.dart';
import 'AddMedicationScreen.dart';
import 'ConfigScreenState.dart';
import 'login_screen.dart';

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
        title: Text('MediAlert'),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed:
                () => Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => LoginScreen()),
                ),
          ),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.all(8),
        children: [
          Text(
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
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () async {
              final resultado = await Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => AddMedicationScreen()),
              );
              if (resultado != null) {
                setState(() => medicamentos.add(resultado));
              }
            },
            child: Text('Añadir Medicamento'),
          ),
          SizedBox(height: 8),
          ElevatedButton(
            onPressed:
                () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => ConfigScreen()),
                ),
            child: Text('Configuración'),
          ),
        ],
      ),
    );
  }
}
