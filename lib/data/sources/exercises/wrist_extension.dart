const Map<String, dynamic> wristExtension = {
  "pk": "c7d60e7b-8f9a-4c41-b2d7-9e4a5c8b1f63",
  "name": "Wrist Extension",
  "muscleGroups": ["Arms"],
  "primaryMuscles": ["wrist extensors"],
  "secondaryMuscles": [],
  "variations": {
    "single-arm": {
      "excludedVariations": [
        "EZ-bar",
        "pronated",
        "reverse wrist curl",
        "seated",
        "standing",
      ],
    },
    "seated": {
      "excludedVariations": [
        "EZ-bar",
        "pronated",
        "reverse wrist curl",
        "single-arm",
        "standing",
      ],
    },
    "standing": {
      "excludedVariations": [
        "EZ-bar",
        "pronated",
        "reverse wrist curl",
        "seated",
        "single-arm",
      ],
    },
    "EZ-bar": {
      "excludedVariations": [
        "pronated",
        "reverse wrist curl",
        "seated",
        "single-arm",
        "standing",
      ],
    },
    "reverse wrist curl": {
      "excludedVariations": [
        "EZ-bar",
        "pronated",
        "seated",
        "single-arm",
        "standing",
      ],
    },
    "pronated": {
      "excludedVariations": [
        "EZ-bar",
        "reverse wrist curl",
        "seated",
        "single-arm",
        "standing",
      ],
    },
    "barbell": {
      "excludedVariations": ["band", "cable", "dumbbell"],
    },
    "dumbbell": {
      "excludedVariations": ["band", "barbell", "cable"],
    },
    "cable": {
      "excludedVariations": ["band", "barbell", "dumbbell"],
    },
    "band": {
      "excludedVariations": ["barbell", "cable", "dumbbell"],
    },
  },
};
