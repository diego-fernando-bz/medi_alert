import 'package:flutter/material.dart';

class AddMedicationScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registrar Medicamento'),
        backgroundColor: Color(
          0xFFE3F2FD,
        ), // Color de la AppBar similar a los bloques
        elevation: 0, // Sin sombra para un look más plano
      ),
      body: Container(
        color: Color(
          0xFFF8F0FA,
        ), // Color de fondo general del body, un lila muy claro
        child: Form(
          key: _formKey,
          child: ListView(
            padding: EdgeInsets.all(16),
            children: [
              // Campo de Medicamento
              _buildStyledTextFormField(
                labelText: 'Nombre del Medicamento',
                hintText: 'Ej. Acetaminofen',
              ),
              SizedBox(height: 16), // Espacio entre campos
              // Campo de Frecuencia
              _buildStyledTextFormField(
                labelText: 'Frecuencia de toma',
                hintText: 'Ej. Cada 8 horas, Diario',
                keyboardType:
                    TextInputType
                        .text, // Puede ser texto o número, dependiendo de la implementación
              ),
              SizedBox(height: 16),

              // Campo de Hora de inicio
              _buildStyledTextFormField(
                labelText: 'Hora de inicio',
                hintText: 'Ej. 09:00 AM',
                keyboardType:
                    TextInputType.datetime, // Para sugerir formato de hora
              ),
              SizedBox(height: 16),

              // Campo de Duración
              _buildStyledTextFormField(
                labelText: 'Duración del tratamiento',
                hintText: 'Ej. 7 días, Hasta que termine',
                keyboardType: TextInputType.text, // Puede ser texto o número
              ),
              SizedBox(height: 24), // Más espacio antes de los botones

              Row(
                mainAxisAlignment:
                    MainAxisAlignment.spaceEvenly, // Distribuye los botones
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          // Lógica para guardar el medicamento
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Medicamento guardado'),
                            ),
                          );
                          Navigator.pop(
                            context,
                          ); // Volver a la pantalla anterior
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF81D4FA), // Un azul claro
                        foregroundColor: Colors.white, // Color del texto
                        padding: EdgeInsets.symmetric(
                          vertical: 12,
                          horizontal: 20,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            10,
                          ), // Bordes redondeados
                        ),
                        textStyle: TextStyle(fontSize: 16),
                      ),
                      child: Text('Guardar'),
                    ),
                  ),
                  SizedBox(width: 16), // Espacio entre los botones
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () => Navigator.pop(context),
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(
                          color: Color(0xFF81D4FA),
                        ), // Borde azul claro
                        foregroundColor: Color(0xFF81D4FA), // Color del texto
                        padding: EdgeInsets.symmetric(
                          vertical: 12,
                          horizontal: 20,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            10,
                          ), // Bordes redondeados
                        ),
                        textStyle: TextStyle(fontSize: 16),
                      ),
                      child: Text('Cancelar'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Método auxiliar para construir TextFormField con estilo
  Widget _buildStyledTextFormField({
    required String labelText,
    String? hintText,
    TextInputType? keyboardType,
  }) {
    return TextFormField(
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        filled: true, // Habilita el color de fondo
        fillColor: Color(
          0xFFE3F2FD,
        ), // Color de fondo del campo (similar al de los bloques)
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10), // Bordes redondeados
          borderSide:
              BorderSide.none, // Eliminar el borde visible si no lo quieres
        ),
        enabledBorder: OutlineInputBorder(
          // Borde cuando el campo está habilitado
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none, // Sin borde
        ),
        focusedBorder: OutlineInputBorder(
          // Borde cuando el campo está enfocado
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: Color(0xFF4FC3F7),
            width: 2,
          ), // Un borde azul más fuerte al enfocar
        ),
        contentPadding: EdgeInsets.symmetric(
          vertical: 14,
          horizontal: 16,
        ), // Padding interno
      ),
    );
  }
}
