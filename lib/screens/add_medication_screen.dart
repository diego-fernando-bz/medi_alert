import 'package:flutter/material.dart';
import 'package:medi_alert/utils/notification_service.dart';

class AddMedicationScreen extends StatefulWidget {
  const AddMedicationScreen({super.key});

  @override
  State<AddMedicationScreen> createState() => _AddMedicationScreenState();
}

class _AddMedicationScreenState extends State<AddMedicationScreen> {
  final _nameController = TextEditingController();
  TimeOfDay? _selectedTime;
  Duration _frequency = const Duration(hours: 8);
  DateTime _endDate = DateTime.now().add(const Duration(days: 2));

  Future<void> _selectTime() async {
    final picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null) setState(() => _selectedTime = picked);
  }

  Future<void> _selectEndDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: _endDate,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 30)),
    );
    if (picked != null) setState(() => _endDate = picked);
  }

  void _save() {
    final name = _nameController.text.trim();
    if (name.isEmpty || _selectedTime == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Completa todos los campos')),
      );
      return;
    }

    final now = DateTime.now();
    final startDate = DateTime(
      now.year,
      now.month,
      now.day,
      _selectedTime!.hour,
      _selectedTime!.minute,
    );

    DateTime scheduled =
        startDate.isBefore(now) ? startDate.add(_frequency) : startDate;

    int idBase = DateTime.now().millisecondsSinceEpoch;

    while (scheduled.isBefore(_endDate.add(const Duration(days: 1)))) {
      NotificationService.scheduleMedication(
        idBase: idBase,
        medName: name,
        time: scheduled,
      );
      idBase += 2; // Porque se crean 2 notificaciones por toma
      scheduled = scheduled.add(_frequency);
    }

    Navigator.pop(context, {
      'nombre': name,
      'horaInicio': _selectedTime,
      'frecuencia': _frequency,
      'fechaFin': _endDate,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Agregar Medicamento')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: 'Nombre del medicamento',
              ),
            ),
            const SizedBox(height: 16),
            ListTile(
              title: const Text('Hora de inicio'),
              subtitle: Text(
                _selectedTime?.format(context) ?? 'No seleccionada',
              ),
              trailing: const Icon(Icons.access_time),
              onTap: _selectTime,
            ),
            const SizedBox(height: 8),
            ListTile(
              title: const Text('Frecuencia'),
              subtitle: Text('${_frequency.inHours} horas'),
              trailing: const Icon(Icons.repeat),
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  builder:
                      (_) => Column(
                        mainAxisSize: MainAxisSize.min,
                        children:
                            [4, 6, 8, 12].map((hours) {
                              return ListTile(
                                title: Text('Cada $hours horas'),
                                onTap: () {
                                  setState(
                                    () => _frequency = Duration(hours: hours),
                                  );
                                  Navigator.pop(context);
                                },
                              );
                            }).toList(),
                      ),
                );
              },
            ),
            const SizedBox(height: 8),
            ListTile(
              title: const Text('Fecha fin'),
              subtitle: Text('${_endDate.toLocal()}'.split(' ')[0]),
              trailing: const Icon(Icons.calendar_today),
              onTap: _selectEndDate,
            ),
            const SizedBox(height: 24),
            ElevatedButton(onPressed: _save, child: const Text('Guardar')),
          ],
        ),
      ),
    );
  }
}
