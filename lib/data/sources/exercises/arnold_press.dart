const Map<String, dynamic> arnoldPress = {
  "pk": "3bc232a6-36f1-4322-948c-61c0df58cb15",
  "name": "Arnold Press",
  "muscleGroups": ["Shoulders"],
  "primaryMuscles": ["posterior deltoid", "lateral deltoid"],
  "secondaryMuscles": [],
  "variations": {
    "seated": {
      "excludedVariations": ["standing"],
    },
    "standing": {
      "excludedVariations": ["seated"],
    },
    "single-arm": {"excludedVariations": []},
    "alternating": {"excludedVariations": []},
    "dumbbell": {
      "excludedVariations": ["cable"],
    },
    "cable": {
      "excludedVariations": ["dumbbell"],
    },
  },
};
