const Map<String, dynamic> internalRotation = {
  "pk": "f2a15b2e-3c4d-4f96-e7a2-4b9e0f3a6b18",
  "name": "Internal Rotation",
  "muscleGroups": ["Shoulders"],
  "primaryMuscles": ["subscapularis"],
  "secondaryMuscles": ["anterior deltoid"],
  "variations": {
    "standing": {
      "excludedVariations": [
        "90-degree abduction",
        "lying",
        "prone",
        "seated",
        "side-lying",
        "single-arm",
      ],
    },
    "seated": {
      "excludedVariations": [
        "90-degree abduction",
        "lying",
        "prone",
        "side-lying",
        "single-arm",
        "standing",
      ],
    },
    "single-arm": {
      "excludedVariations": [
        "90-degree abduction",
        "lying",
        "prone",
        "seated",
        "side-lying",
        "standing",
      ],
    },
    "lying": {
      "excludedVariations": [
        "90-degree abduction",
        "prone",
        "seated",
        "side-lying",
        "single-arm",
        "standing",
      ],
    },
    "90-degree abduction": {
      "excludedVariations": [
        "lying",
        "prone",
        "seated",
        "side-lying",
        "single-arm",
        "standing",
      ],
    },
    "side-lying": {
      "excludedVariations": [
        "90-degree abduction",
        "lying",
        "prone",
        "seated",
        "single-arm",
        "standing",
      ],
    },
    "prone": {
      "excludedVariations": [
        "90-degree abduction",
        "lying",
        "seated",
        "side-lying",
        "single-arm",
        "standing",
      ],
    },
    "cable": {
      "excludedVariations": ["band"],
    },
    "band": {
      "excludedVariations": ["cable"],
    },
  },
};
