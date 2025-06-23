import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class NotificationService {
  static final FlutterLocalNotificationsPlugin _notificationsPlugin =
      FlutterLocalNotificationsPlugin();

  static Future<void> init() async {
    tz.initializeTimeZones();

    const androidSettings = AndroidInitializationSettings(
      '@mipmap/ic_launcher',
    );

    const initSettings = InitializationSettings(android: androidSettings);

    await _notificationsPlugin.initialize(initSettings);
  }

  static Future<void> scheduleMedication({
    required int idBase,
    required String medName,
    required DateTime time,
  }) async {
    final scheduledTimeBefore = tz.TZDateTime.from(
      time.subtract(const Duration(minutes: 5)),
      tz.local,
    );

    final scheduledTimeExact = tz.TZDateTime.from(time, tz.local);

    const notificationDetails = NotificationDetails(
      android: AndroidNotificationDetails(
        'med_alert_channel',
        'Medicamentos',
        channelDescription: 'Recordatorios para medicamentos',
        importance: Importance.max,
        priority: Priority.high,
      ),
    );

    await _notificationsPlugin.zonedSchedule(
      idBase,
      'MediAlert - Recordatorio',
      'En 5 minutos debes tomar: $medName',
      scheduledTimeBefore,
      notificationDetails,
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,

      matchDateTimeComponents: DateTimeComponents.time,
    );

    await _notificationsPlugin.zonedSchedule(
      idBase + 1,
      'MediAlert - Es hora',
      '¡Toma tu medicamento: $medName!',
      scheduledTimeExact,
      notificationDetails,
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,

      matchDateTimeComponents: DateTimeComponents.time,
    );
  }
}
