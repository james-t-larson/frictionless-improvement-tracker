import 'dart:convert';

class Movement {
  final String id;
  final String name;
  final List<String> primaryMuscles;
  final List<String> secondaryMuscles;
  final List<String> steps;
  final String? notes;

  Movement({
    required this.id,
    required this.name,
    this.primaryMuscles = const [],
    this.secondaryMuscles = const [],
    this.steps = const [],
    this.notes,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'primary_muscles': jsonEncode(primaryMuscles),
      'secondary_muscles': jsonEncode(secondaryMuscles),
      'steps': jsonEncode(steps),
      'notes': notes,
    };
  }

  factory Movement.fromMap(Map<String, dynamic> map) {
    return Movement(
      id: map['id'] as String,
      name: map['name'] as String,
      primaryMuscles: List<String>.from(jsonDecode(map['primary_muscles'] ?? '[]')),
      secondaryMuscles: List<String>.from(jsonDecode(map['secondary_muscles'] ?? '[]')),
      steps: List<String>.from(jsonDecode(map['steps'] ?? '[]')),
      notes: map['notes'] as String?,
    );
  }

  factory Movement.fromJson(Map<String, dynamic> json) {
    return Movement(
      id: json['pk'] ?? '',
      name: json['name'] ?? '',
      primaryMuscles: List<String>.from(json['primaryMuscles'] ?? []),
      secondaryMuscles: List<String>.from(json['secondaryMuscles'] ?? []),
      steps: List<String>.from(json['steps'] ?? []),
      notes: json['notes'],
    );
  }
}

