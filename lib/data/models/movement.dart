class Movement {
  final int? id;
  final String name;
  final List<String> primaryMuscles;
  final List<String> secondaryMuscles;
  final List<String> workoutGroups;

  Movement({
    this.id,
    required this.name,
    this.primaryMuscles = const [],
    this.secondaryMuscles = const [],
    this.workoutGroups = const [],
  });

  // Getter for backward compatibility or simple display
  String? get muscleGroup => primaryMuscles.isNotEmpty ? primaryMuscles.first : null;

  Map<String, dynamic> toMap() {
    return {
      if (id != null) 'id': id,
      'name': name,
    };
  }

  factory Movement.fromMap(Map<String, dynamic> map) {
    return Movement(
      id: map['id'] as int?,
      name: map['name'] as String,
      // Note: muscle groups and workout groups are loaded via joins in the repository
      primaryMuscles: [],
      secondaryMuscles: [],
      workoutGroups: [],
    );
  }

  factory Movement.fromJson(Map<String, dynamic> json) {
    return Movement(
      name: json['name'] ?? '',
      primaryMuscles: List<String>.from(json['primaryMuscles'] ?? []),
      secondaryMuscles: List<String>.from(json['secondaryMuscles'] ?? []),
      workoutGroups: List<String>.from(json['workoutGroups'] ?? []),
    );
  }
}

