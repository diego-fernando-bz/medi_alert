import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'AddMedicationScreen.dart';
import 'ConfigScreenState.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('MediAlert')),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Bloque de "Próxima toma"
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Color(0xFFE0F7FA),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Row(
                children: [
                  Icon(Icons.access_time),
                  SizedBox(width: 8.0),
                  Text(
                    'Próxima toma 10:30 am',
                    style: TextStyle(fontSize: 16.0),
                  ),
                ],
              ),
            ),
          ),

          // Bloque para Medicamento A (Acetaminofen)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
            child: Card(
              color: Color(0xFFE3F2FD),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Acetaminofen',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4.0),
                    Container(
                      padding: EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        color: Color(0xFFE0F7FA),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Text(
                        'próxima toma en 1 hora',
                        style: TextStyle(fontSize: 14.0),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Bloque para Medicamento B (Fencafem)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
            child: Card(
              color: Color(0xFFE3F2FD),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Fencafem',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4.0),
                    Container(
                      padding: EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        color: Color(0xFFE0F7FA),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Text(
                        'próxima toma en 5 horas',
                        style: TextStyle(fontSize: 14.0),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Bloque para Medicamento C (Loratadina)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
            child: Card(
              color: Color(0xFFE3F2FD),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Loratadina',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4.0),
                    Container(
                      padding: EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        color: Color(0xFFE0F7FA),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Text(
                        'próxima toma en 16 horas',
                        style: TextStyle(fontSize: 14.0),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // El botón "Añadir Medicamento"
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AddMedicationScreen()),
              );
            },
            child: Text('Añadir Medicamento'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
            ),
          ),
          SizedBox(height: 8),
          // El botón "configuracion"
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ConfigScreen()),
              );
            },
            child: Text('Configuración'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue, // Ajusta al color de tu tema
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
            ),
          ),
        ],
      ),
    );
  }
}
