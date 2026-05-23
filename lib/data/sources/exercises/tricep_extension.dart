const Map<String, dynamic> tricepExtension = {
  "pk": "c1d04e1b-2f3a-4c85-b6d1-3e8a9c2b5f07",
  "name": "Tricep Extension",
  "muscleGroups": ["Arms"],
  "primaryMuscles": ["triceps brachii"],
  "secondaryMuscles": [],
  "variations": {
    "EZ-bar": {
      "excludedVariations": [
        "behind-the-head",
        "kickback",
        "lying",
        "overhead",
        "seated",
        "single-arm",
        "standing",
      ],
    },
    "single-arm": {
      "excludedVariations": [
        "EZ-bar",
        "behind-the-head",
        "kickback",
        "lying",
        "overhead",
        "seated",
        "standing",
      ],
    },
    "overhead": {
      "excludedVariations": [
        "EZ-bar",
        "behind-the-head",
        "kickback",
        "lying",
        "seated",
        "single-arm",
        "standing",
      ],
    },
    "lying": {
      "excludedVariations": [
        "EZ-bar",
        "behind-the-head",
        "kickback",
        "overhead",
        "seated",
        "single-arm",
        "standing",
      ],
    },
    "seated": {
      "excludedVariations": [
        "EZ-bar",
        "behind-the-head",
        "kickback",
        "lying",
        "overhead",
        "single-arm",
        "standing",
      ],
    },
    "standing": {
      "excludedVariations": [
        "EZ-bar",
        "behind-the-head",
        "kickback",
        "lying",
        "overhead",
        "seated",
        "single-arm",
      ],
    },
    "kickback": {
      "excludedVariations": [
        "EZ-bar",
        "behind-the-head",
        "lying",
        "overhead",
        "seated",
        "single-arm",
        "standing",
      ],
    },
    "behind-the-head": {
      "excludedVariations": [
        "EZ-bar",
        "kickback",
        "lying",
        "overhead",
        "seated",
        "single-arm",
        "standing",
      ],
    },
    "cable": {
      "excludedVariations": ["band", "barbell", "dumbbell", "rope"],
    },
    "dumbbell": {
      "excludedVariations": ["band", "barbell", "cable", "rope"],
    },
    "barbell": {
      "excludedVariations": ["band", "cable", "dumbbell", "rope"],
    },
    "rope": {
      "excludedVariations": ["band", "barbell", "cable", "dumbbell"],
    },
    "band": {
      "excludedVariations": ["barbell", "cable", "dumbbell", "rope"],
    },
  },
};
