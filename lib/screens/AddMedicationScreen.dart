import 'package:flutter/material.dart';

class AddMedicationScreen extends StatefulWidget {
  @override
  _AddMedicationScreenState createState() => _AddMedicationScreenState();
}

class _AddMedicationScreenState extends State<AddMedicationScreen> {
  final _formKey = GlobalKey<FormState>();
  String nombre = '';
  TimeOfDay? horaInicio;
  Duration? frecuencia;
  DateTime? fechaFin;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Registrar Medicamento')),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: EdgeInsets.all(16),
          children: [
            TextFormField(
              decoration: InputDecoration(labelText: 'Nombre del Medicamento'),
              validator: (value) => value!.isEmpty ? 'Campo obligatorio' : null,
              onSaved: (value) => nombre = value!,
            ),
            SizedBox(height: 16),
            ListTile(
              title: Text(
                'Hora de inicio: ${horaInicio?.format(context) ?? 'No seleccionada'}',
              ),
              trailing: Icon(Icons.access_time),
              onTap: () async {
                final picked = await showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.now(),
                );
                if (picked != null) setState(() => horaInicio = picked);
              },
            ),
            ListTile(
              title: Text(
                'Frecuencia: ${frecuencia != null ? frecuencia!.inHours.toString() + ' hrs' : 'No seleccionada'}',
              ),
              trailing: Icon(Icons.timer),
              onTap: () async {
                final picked = await showTimePicker(
                  context: context,
                  initialTime: TimeOfDay(hour: 8, minute: 0),
                );
                if (picked != null) {
                  setState(() {
                    frecuencia = Duration(
                      hours: picked.hour,
                      minutes: picked.minute,
                    );
                  });
                }
              },
            ),
            ListTile(
              title: Text(
                'Fecha de fin: ${fechaFin != null ? fechaFin!.toLocal().toString().split(' ')[0] : 'No seleccionada'}',
              ),
              trailing: Icon(Icons.date_range),
              onTap: () async {
                final picked = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime.now(),
                  lastDate: DateTime.now().add(Duration(days: 365)),
                );
                if (picked != null) setState(() => fechaFin = picked);
              },
            ),
            SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  final medicamento = {
                    'nombre': nombre,
                    'horaInicio': horaInicio,
                    'frecuencia': frecuencia,
                    'fechaFin': fechaFin,
                  };
                  Navigator.pop(context, medicamento);
                }
              },
              child: Text('Guardar'),
            ),
          ],
        ),
      ),
    );
  }
}
