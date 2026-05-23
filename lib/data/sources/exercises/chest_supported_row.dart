const Map<String, dynamic> chestSupportedRow = {
  "pk": "f8a71b8e-9c0d-4f52-e3a8-0b5d6f9e2c74",
  "name": "Chest-Supported Row",
  "muscleGroups": ["Back"],
  "primaryMuscles": ["latissimus dorsi", "posterior deltoid"],
  "secondaryMuscles": ["biceps brachii", "trapezius", "wrist flexors"],
  "variations": {
    "single-arm": {
      "excludedVariations": [
        "close-grip",
        "incline",
        "neutral-grip",
        "prone",
        "wide-grip",
      ],
    },
    "wide-grip": {
      "excludedVariations": [
        "close-grip",
        "incline",
        "neutral-grip",
        "prone",
        "single-arm",
      ],
    },
    "close-grip": {
      "excludedVariations": [
        "incline",
        "neutral-grip",
        "prone",
        "single-arm",
        "wide-grip",
      ],
    },
    "neutral-grip": {
      "excludedVariations": [
        "close-grip",
        "incline",
        "prone",
        "single-arm",
        "wide-grip",
      ],
    },
    "prone": {
      "excludedVariations": [
        "close-grip",
        "incline",
        "neutral-grip",
        "single-arm",
        "wide-grip",
      ],
    },
    "incline": {
      "excludedVariations": [
        "close-grip",
        "neutral-grip",
        "prone",
        "single-arm",
        "wide-grip",
      ],
    },
    "dumbbell": {
      "excludedVariations": ["barbell", "cable", "machine"],
    },
    "barbell": {
      "excludedVariations": ["cable", "dumbbell", "machine"],
    },
    "machine": {
      "excludedVariations": ["barbell", "cable", "dumbbell"],
    },
    "cable": {
      "excludedVariations": ["barbell", "dumbbell", "machine"],
    },
  },
};
