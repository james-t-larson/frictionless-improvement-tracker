import 'dart:convert';

class Movement {
  final String? id;
  final String name;
  final List<String> primaryMuscles;
  final List<String> secondaryMuscles;
  final List<String> muscleGroups;
  final List<String> movementVariations;
  final List<String> equipment;

  Movement({
    this.id,
    required this.name,
    this.primaryMuscles = const [],
    this.secondaryMuscles = const [],
    this.muscleGroups = const [],
    this.movementVariations = const [],
    this.equipment = const [],
  });

  String? get muscleGroup => primaryMuscles.isNotEmpty ? primaryMuscles.first : null;

  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'pk': id,
      'name': name,
      'primaryMuscles': primaryMuscles,
      'secondaryMuscles': secondaryMuscles,
      'muscleGroups': muscleGroups,
      'movementVariations': movementVariations,
      'equipment': equipment,
    };
  }

  factory Movement.fromJson(Map<String, dynamic> json) {
    return Movement(
      id: json['pk'] as String?,
      name: json['name'] ?? '',
      primaryMuscles: List<String>.from(json['primaryMuscles'] ?? []),
      secondaryMuscles: List<String>.from(json['secondaryMuscles'] ?? []),
      muscleGroups: List<String>.from(json['muscleGroups'] ?? []),
      movementVariations: List<String>.from(json['movementVariations'] ?? []),
      equipment: List<String>.from(json['equipment'] ?? []),
    );
  }

  factory Movement.fromMap(Map<String, dynamic> map) {
    final data = jsonDecode(map['data'] as String);
    return Movement.fromJson(data).copyWith(id: map['id'] as String?);
  }

  Map<String, dynamic> toMap() {
    return {
      if (id != null) 'id': id,
      'data': jsonEncode(toJson()),
    };
  }

  Movement copyWith({
    String? id,
    String? name,
    List<String>? primaryMuscles,
    List<String>? secondaryMuscles,
    List<String>? muscleGroups,
    List<String>? movementVariations,
    List<String>? equipment,
  }) {
    return Movement(
      id: id ?? this.id,
      name: name ?? this.name,
      primaryMuscles: primaryMuscles ?? this.primaryMuscles,
      secondaryMuscles: secondaryMuscles ?? this.secondaryMuscles,
      muscleGroups: muscleGroups ?? this.muscleGroups,
      movementVariations: movementVariations ?? this.movementVariations,
      equipment: equipment ?? this.equipment,
    );
  }
}

