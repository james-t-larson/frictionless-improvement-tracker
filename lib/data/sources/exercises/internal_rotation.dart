const Map<String, dynamic> internalRotation = {
  "pk": "f2a15b2e-3c4d-4f96-e7a2-4b9e0f3a6b18",
  "name": "Internal Rotation",
  "muscleGroups": ["Shoulders"],
  "primaryMuscles": ["subscapularis"],
  "secondaryMuscles": ["anterior deltoid"],
  "variations": {
    "standing": {
      "excludedVariations": [
        "dumbbell",
        "lying",
        "prone",
        "seated",
        "side-lying",
      ],
    },
    "seated": {
      "excludedVariations": [
        "dumbbell",
        "lying",
        "prone",
        "side-lying",
        "standing",
      ],
    },
    "single-arm": {
      "excludedVariations": [],
    },
    "lying": {
      "excludedVariations": [
        "prone",
        "seated",
        "side-lying",
        "standing",
      ],
    },
    "90-degree abduction": {
      "excludedVariations": [
        "side-lying",
      ],
    },
    "side-lying": {
      "excludedVariations": [
        "90-degree abduction",
        "lying",
        "prone",
        "seated",
        "standing",
      ],
    },
    "prone": {
      "excludedVariations": [
        "lying",
        "seated",
        "side-lying",
        "standing",
      ],
    },
    "cable": {
      "excludedVariations": ["band", "dumbbell"],
    },
    "band": {
      "excludedVariations": ["cable", "dumbbell"],
    },
    "dumbbell": {
      "excludedVariations": [
        "band",
        "cable",
        "seated",
        "standing",
      ],
    },
  },
};
