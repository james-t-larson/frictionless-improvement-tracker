const Map<String, dynamic> facePull = {
  "pk": "6bc882f1-29e7-44c0-99b4-a36a4c91fc08",
  "name": "Face Pull",
  "slug": "face-pull",
  "muscleGroups": ["Shoulders", "Back"],
  "primaryMuscles": ["infraspinatus", "trapezius", "posterior deltoid"],
  "secondaryMuscles": ["lateral deltoid", "wrist extensors"],
  "variations": {
    "single-arm": {
      "excludedVariations": ["dual-rope"],
    },
    "high-pulley": {
      "excludedVariations": ["chest-level", "low-pulley", "suspension"],
    },
    "low-pulley": {
      "excludedVariations": ["chest-level", "high-pulley", "suspension"],
    },
    "kneeling": {
      "excludedVariations": ["seated", "suspension"],
    },
    "seated": {
      "excludedVariations": ["kneeling", "suspension"],
    },
    "chest-level": {
      "excludedVariations": ["high-pulley", "low-pulley", "suspension"],
    },
    "pronated": {
      "excludedVariations": ["supinated"],
    },
    "supinated": {
      "excludedVariations": ["pronated"],
    },
    "cable": {
      "excludedVariations": ["band", "suspension"],
    },
    "band": {
      "excludedVariations": ["cable", "dual-rope", "rope", "suspension"],
    },
    "rope": {
      "excludedVariations": ["band", "dual-rope", "suspension"],
    },
    "dual-rope": {
      "excludedVariations": ["band", "rope", "single-arm", "suspension"],
    },
    "suspension": {
      "excludedVariations": [
        "band",
        "cable",
        "chest-level",
        "dual-rope",
        "high-pulley",
        "kneeling",
        "low-pulley",
        "rope",
        "seated"
      ],
    },
  },
};
