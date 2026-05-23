const Map<String, dynamic> facePull = {
  "pk": "6bc882f1-29e7-44c0-99b4-a36a4c91fc08",
  "name": "Face Pull",
  "slug": "face-pull",
  "muscleGroups": ["Shoulders", "Back"],
  "primaryMuscles": ["infraspinatus", "trapezius", "posterior deltoid"],
  "secondaryMuscles": ["lateral deltoid", "wrist extensors"],
  "variations": {
    "single-arm": {
      "excludedVariations": [
        "chest-level",
        "high-pulley",
        "kneeling",
        "low-pulley",
        "pronated",
        "seated",
      ],
    },
    "high-pulley": {
      "excludedVariations": [
        "chest-level",
        "kneeling",
        "low-pulley",
        "pronated",
        "seated",
        "single-arm",
      ],
    },
    "low-pulley": {
      "excludedVariations": [
        "chest-level",
        "high-pulley",
        "kneeling",
        "pronated",
        "seated",
        "single-arm",
      ],
    },
    "kneeling": {
      "excludedVariations": [
        "chest-level",
        "high-pulley",
        "low-pulley",
        "pronated",
        "seated",
        "single-arm",
      ],
    },
    "seated": {
      "excludedVariations": [
        "chest-level",
        "high-pulley",
        "kneeling",
        "low-pulley",
        "pronated",
        "single-arm",
      ],
    },
    "chest-level": {
      "excludedVariations": [
        "high-pulley",
        "kneeling",
        "low-pulley",
        "pronated",
        "seated",
        "single-arm",
      ],
    },
    "pronated": {
      "excludedVariations": [
        "chest-level",
        "high-pulley",
        "kneeling",
        "low-pulley",
        "seated",
        "single-arm",
      ],
    },
    "cable": {
      "excludedVariations": ["band", "rope", "supinated"],
    },
    "band": {
      "excludedVariations": ["cable", "rope", "supinated"],
    },
    "rope": {
      "excludedVariations": ["band", "cable", "supinated"],
    },
    "supinated": {
      "excludedVariations": ["band", "cable", "rope"],
    },
  },
};
