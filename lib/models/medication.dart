class Medication {
  final String name;
  final String frequency;
  final String startTime;
  final String duration;

  Medication({
    required this.name,
    required this.frequency,
    required this.startTime,
    required this.duration,
  });

  Map<String, String> toMap() => {
    'name': name,
    'frequency': frequency,
    'startTime': startTime,
    'duration': duration,
  };

  factory Medication.fromMap(Map<String, dynamic> map) => Medication(
    name: map['name'],
    frequency: map['frequency'],
    startTime: map['startTime'],
    duration: map['duration'],
  );
}
