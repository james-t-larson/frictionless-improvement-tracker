import 'dart:convert';
import 'static_exercise_data.dart';

class ExerciseDataSource {
  Future<List<dynamic>> getExercises() async {
    return jsonDecode(staticExerciseJson);
  }
}
