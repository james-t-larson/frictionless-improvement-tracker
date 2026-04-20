import 'dart:convert';
import 'package:flutter/foundation.dart';
import '../models/movement.dart';
import 'static_exercise_data.dart';

class RemoteSource {
  Future<List<Movement>> fetchExercises() async {
    try {
      // Simulate a small delay for a more natural feel, though not strictly necessary
      await Future.delayed(const Duration(milliseconds: 100));
      
      final List<dynamic> data = jsonDecode(staticExerciseJson);
      return data.map((json) => Movement.fromJson(json)).toList();
    } catch (e) {
      debugPrint("Error loading static exercise data: $e");
      return [];
    }
  }
}

