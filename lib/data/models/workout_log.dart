import 'dart:convert';

class WorkoutLog {
  final int? id;
  final String movementId;
  final double weight;
  final int reps;
  final int timestamp; // Unix timestamp
  final bool painFelt;
  final List<String> variations;
  
  // Denormalized data
  final String? movementName;
  final String? muscleGroupName;

  WorkoutLog({
    this.id,
    required this.movementId,
    required this.weight,
    required this.reps,
    required this.timestamp,
    this.painFelt = false,
    this.variations = const [],
    this.movementName,
    this.muscleGroupName,
  });

  Map<String, dynamic> toJson() {
    return {
      'movementId': movementId,
      'weight': weight,
      'reps': reps,
      'timestamp': timestamp,
      'painFelt': painFelt,
      'variations': variations,
      if (movementName != null) 'movementName': movementName,
      if (muscleGroupName != null) 'muscleGroupName': muscleGroupName,
    };
  }

  factory WorkoutLog.fromJson(Map<String, dynamic> json, {int? id}) {
    return WorkoutLog(
      id: id,
      movementId: json['movementId'] as String,
      weight: (json['weight'] as num).toDouble(),
      reps: json['reps'] as int,
      timestamp: json['timestamp'] as int,
      painFelt: json['painFelt'] as bool? ?? false,
      variations: List<String>.from(json['variations'] ?? []),
      movementName: json['movementName'] as String?,
      muscleGroupName: json['muscleGroupName'] as String?,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      if (id != null) 'id': id,
      'data': jsonEncode(toJson()),
    };
  }

  factory WorkoutLog.fromMap(Map<String, dynamic> map) {
    final data = jsonDecode(map['data'] as String);
    return WorkoutLog.fromJson(data, id: map['id'] as int?);
  }

  /// Variations worth showing under the title: when [movementName] is a named
  /// variation like "Romanian Deadlift", the consumed keys ("romanian") are
  /// already part of the title and would be redundant.
  List<String> get displayVariations {
    final name = movementName?.toLowerCase();
    if (name == null) return variations;
    return variations.where((v) => !name.contains(v.toLowerCase())).toList();
  }

  WorkoutLog copyWith({
    int? id,
    String? movementId,
    double? weight,
    int? reps,
    DateTime? timestamp,
    bool? painFelt,
    List<String>? variations,
    String? movementName,
    String? muscleGroupName,
  }) {
    return WorkoutLog(
      id: id ?? this.id,
      movementId: movementId ?? this.movementId,
      weight: weight ?? this.weight,
      reps: reps ?? this.reps,
      timestamp: timestamp != null ? timestamp.millisecondsSinceEpoch : this.timestamp,
      painFelt: painFelt ?? this.painFelt,
      variations: variations ?? this.variations,
      movementName: movementName ?? this.movementName,
      muscleGroupName: muscleGroupName ?? this.muscleGroupName,
    );
  }
}
