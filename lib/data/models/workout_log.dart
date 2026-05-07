import 'package:simple_gym_tracker/data/models/variation.dart';

class WorkoutLog {
  final int? id;
  final int movementId;
  final double weight;
  final int reps;
  final int timestamp; // Unix timestamp
  final bool painFelt;
  final List<Variation> variations;
  
  // Joined data
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

  Map<String, dynamic> toMap() {
    return {
      if (id != null) 'id': id,
      'movement_id': movementId,
      'weight': weight,
      'reps': reps,
      'timestamp': timestamp,
      'pain_felt': painFelt ? 1 : 0,
    };
  }

  factory WorkoutLog.fromMap(Map<String, dynamic> map, {List<Variation> variations = const []}) {
    return WorkoutLog(
      id: map['id'] as int?,
      movementId: map['movement_id'] as int,
      weight: (map['weight'] as num).toDouble(),
      reps: map['reps'] as int,
      timestamp: map['timestamp'] as int? ?? 0,
      painFelt: (map['pain_felt'] as int? ?? 0) == 1,
      movementName: map['movement_name'] as String?,
      muscleGroupName: map['muscle_group_name'] as String?,
      variations: variations,
    );
  }

  WorkoutLog copyWith({
    int? id,
    int? movementId,
    double? weight,
    int? reps,
    DateTime? timestamp,
    bool? painFelt,
    List<Variation>? variations,
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
