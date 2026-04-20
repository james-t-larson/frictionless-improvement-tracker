class WorkoutLog {
  final String id;
  final int timestamp;
  final String movementId;
  final String equipment;
  final double weight;
  final int reps;
  final bool painFelt;
  
  // Joined data
  final String? movementName;

  WorkoutLog({
    required this.id,
    required this.timestamp,
    required this.movementId,
    required this.equipment,
    required this.weight,
    required this.reps,
    required this.painFelt,
    this.movementName,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'timestamp': timestamp,
      'movement_id': movementId,
      'equipment': equipment,
      'weight': weight,
      'reps': reps,
      'pain_felt': painFelt ? 1 : 0,
    };
  }

  factory WorkoutLog.fromMap(Map<String, dynamic> map) {
    return WorkoutLog(
      id: map['id'] as String,
      timestamp: map['timestamp'] as int,
      movementId: map['movement_id'] as String,
      equipment: map['equipment'] as String,
      weight: (map['weight'] as num).toDouble(),
      reps: map['reps'] as int,
      painFelt: (map['pain_felt'] as int) == 1,
      movementName: map['movement_name'] as String?,
    );
  }
}
