import 'dart:convert';

import 'named_variation.dart';

class Movement {
  final String? id;
  final String name;
  final List<String> primaryMuscles;
  final List<String> secondaryMuscles;
  final List<String> muscleGroups;
  final Map<String, List<String>> variations;
  final List<NamedVariation> namedVariations;

  Movement({
    this.id,
    required this.name,
    this.primaryMuscles = const [],
    this.secondaryMuscles = const [],
    this.muscleGroups = const [],
    this.variations = const {},
    this.namedVariations = const [],
  });

  String? get muscleGroup => primaryMuscles.isNotEmpty ? primaryMuscles.first : null;

  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'pk': id,
      'name': name,
      'primaryMuscles': primaryMuscles,
      'secondaryMuscles': secondaryMuscles,
      'muscleGroups': muscleGroups,
      'variations': variations.map((key, value) => MapEntry(key, {'excludedVariations': value})),
      if (namedVariations.isNotEmpty)
        'namedVariations': namedVariations.map((nv) => nv.toJson()).toList(),
    };
  }

  factory Movement.fromJson(Map<String, dynamic> json) {
    return Movement(
      id: json['pk'] as String?,
      name: json['name'] ?? '',
      primaryMuscles: List<String>.from(json['primaryMuscles'] ?? []),
      secondaryMuscles: List<String>.from(json['secondaryMuscles'] ?? []),
      muscleGroups: List<String>.from(json['muscleGroups'] ?? []),
      variations: (json['variations'] as Map?)?.map(
            (key, value) => MapEntry(key.toString(), List<String>.from((value as Map)['excludedVariations'] as Iterable)),
          ) ??
          {},
      namedVariations: (json['namedVariations'] as List?)
              ?.map((nv) => NamedVariation.fromJson(Map<String, dynamic>.from(nv as Map)))
              .toList() ??
          [],
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
    Map<String, List<String>>? variations,
    List<NamedVariation>? namedVariations,
  }) {
    return Movement(
      id: id ?? this.id,
      name: name ?? this.name,
      primaryMuscles: primaryMuscles ?? this.primaryMuscles,
      secondaryMuscles: secondaryMuscles ?? this.secondaryMuscles,
      muscleGroups: muscleGroups ?? this.muscleGroups,
      variations: variations ?? this.variations,
      namedVariations: namedVariations ?? this.namedVariations,
    );
  }

  /// Finds the named variation that best describes [selectedVariations]:
  /// the one whose keys are all selected, preferring the most specific match.
  NamedVariation? resolveNamedVariation(List<String> selectedVariations) {
    NamedVariation? best;
    for (final nv in namedVariations) {
      if (nv.matches(selectedVariations)) {
        if (best == null || nv.variationKeys.length > best.variationKeys.length) {
          best = nv;
        }
      }
    }
    return best;
  }
}

