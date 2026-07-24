import 'package:flutter_test/flutter_test.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:simple_gym_tracker/core/database/database_helper.dart';
import 'package:simple_gym_tracker/data/models/movement.dart';
import 'package:simple_gym_tracker/data/models/workout_log.dart';
import 'package:simple_gym_tracker/data/repositories/workout_repository.dart';

void main() {
  sqfliteFfiInit();
  databaseFactory = databaseFactoryFfi;

  late Database db;
  late WorkoutRepository repository;

  setUp(() async {
    db = await DatabaseHelper.initTestDb();
    repository = WorkoutRepository(db);
  });

  tearDown(() async {
    await db.close();
  });

  Future<void> saveLog({
    required String movementId,
    required double weight,
    required int reps,
    required int timestamp,
    List<String> variations = const [],
  }) async {
    await repository.saveWorkoutLog(WorkoutLog(
      movementId: movementId,
      weight: weight,
      reps: reps,
      timestamp: timestamp,
      variations: variations,
    ));
  }

  Future<void> saveMovement({
    required String id,
    required String name,
    List<String> muscleGroups = const [],
    List<String> primaryMuscles = const [],
  }) async {
    final movement = Movement(
      id: id,
      name: name,
      muscleGroups: muscleGroups,
      primaryMuscles: primaryMuscles,
    );
    await db.insert('movements', movement.toMap());
  }

  group('getLastPerformance', () {
    test('returns null when there are no logs for the movement', () async {
      final result = await repository.getLastPerformance('deadlift');
      expect(result, isNull);
    });

    test('without a variations filter, returns the most recent log regardless of variation', () async {
      await saveLog(movementId: 'deadlift', weight: 135, reps: 5, timestamp: 1, variations: const ['romanian']);
      await saveLog(movementId: 'deadlift', weight: 225, reps: 5, timestamp: 2, variations: const []);

      final result = await repository.getLastPerformance('deadlift');
      expect(result?.weight, 225);
    });

    test('with a variations filter, prefers the most recent log matching that exact combo', () async {
      // Plain deadlift logged most recently...
      await saveLog(movementId: 'deadlift', weight: 225, reps: 5, timestamp: 3, variations: const []);
      // ...but an older romanian deadlift log exists too.
      await saveLog(movementId: 'deadlift', weight: 135, reps: 8, timestamp: 1, variations: const ['romanian']);
      await saveLog(movementId: 'deadlift', weight: 145, reps: 8, timestamp: 2, variations: const ['romanian']);

      final result = await repository.getLastPerformance('deadlift', variations: const ['romanian']);

      // Should match the most recent romanian log (145), not the more recent
      // plain deadlift (225) and not the oldest romanian log (135).
      expect(result?.weight, 145);
    });

    test('variation matching is order-independent', () async {
      await saveLog(movementId: 'row', weight: 100, reps: 8, timestamp: 1, variations: const ['barbell', 'underhand']);

      final result = await repository.getLastPerformance('row', variations: const ['underhand', 'barbell']);

      expect(result?.weight, 100);
    });

    test('falls back to the movement\'s overall last performance when no log matches the variation combo', () async {
      await saveLog(movementId: 'deadlift', weight: 225, reps: 5, timestamp: 1, variations: const []);

      final result = await repository.getLastPerformance('deadlift', variations: const ['romanian']);

      expect(result?.weight, 225);
    });

    test('does not match a superset or subset of the requested variations', () async {
      await saveLog(movementId: 'squat', weight: 200, reps: 5, timestamp: 1, variations: const ['barbell']);
      await saveLog(movementId: 'squat', weight: 50, reps: 12, timestamp: 2, variations: const ['barbell', 'front']);

      final result = await repository.getLastPerformance('squat', variations: const ['barbell']);

      expect(result?.weight, 200);
    });
  });

  group('getSetCountsByMuscleLast7Days', () {
    final now = DateTime.now().millisecondsSinceEpoch;
    final eightDaysAgo = DateTime.now().subtract(const Duration(days: 8)).millisecondsSinceEpoch;

    test('groups sets by primary muscle group then by individual primary muscle', () async {
      await saveMovement(
        id: 'overhead-press',
        name: 'Overhead Press',
        muscleGroups: const ['Shoulders'],
        primaryMuscles: const ['anterior deltoid', 'lateral deltoid'],
      );
      await saveMovement(
        id: 'rear-delt-fly',
        name: 'Rear Delt Fly',
        muscleGroups: const ['Shoulders'],
        primaryMuscles: const ['posterior deltoid'],
      );

      await saveLog(movementId: 'overhead-press', weight: 95, reps: 8, timestamp: now);
      await saveLog(movementId: 'rear-delt-fly', weight: 15, reps: 12, timestamp: now);
      await saveLog(movementId: 'rear-delt-fly', weight: 15, reps: 12, timestamp: now);

      final result = await repository.getSetCountsByMuscleLast7Days();

      expect(result['Shoulders'], {
        'Front Delts': 1,
        'Side Delts': 1,
        'Rear Delts': 2,
      });
    });

    test('excludes sets older than 7 days', () async {
      await saveMovement(
        id: 'lat-pulldown',
        name: 'Lat Pulldown',
        muscleGroups: const ['Back'],
        primaryMuscles: const ['latissimus dorsi'],
      );

      await saveLog(movementId: 'lat-pulldown', weight: 120, reps: 8, timestamp: eightDaysAgo);

      final result = await repository.getSetCountsByMuscleLast7Days();

      expect(result['Back'], isNull);
    });

    test('merges muscles that share the same display name, like the rotator cuff', () async {
      await saveMovement(
        id: 'internal-rotation',
        name: 'Internal Rotation',
        muscleGroups: const ['Shoulders'],
        primaryMuscles: const ['subscapularis'],
      );
      await saveMovement(
        id: 'external-rotation',
        name: 'Cable External Rotation',
        muscleGroups: const ['Shoulders'],
        primaryMuscles: const ['infraspinatus'],
      );

      await saveLog(movementId: 'internal-rotation', weight: 10, reps: 12, timestamp: now);
      await saveLog(movementId: 'external-rotation', weight: 10, reps: 12, timestamp: now);

      final result = await repository.getSetCountsByMuscleLast7Days();

      expect(result['Shoulders'], {'Rotator Cuff': 2});
    });
  });
}
