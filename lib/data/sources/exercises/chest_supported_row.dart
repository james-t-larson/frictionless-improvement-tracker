const Map<String, dynamic> chestSupportedRow = {
  "pk": "f8a71b8e-9c0d-4f52-e3a8-0b5d6f9e2c74",
  "name": "Chest-Supported Row",
  "muscleGroups": ["Back"],
  "primaryMuscles": ["latissimus dorsi", "posterior deltoid"],
  "secondaryMuscles": ["biceps brachii", "trapezius", "wrist flexors"],
  "variations": {
    "single-arm": {
      "excludedVariations": [
        "alternating",
        "barbell"
      ],
    },
    "alternating": {
      "excludedVariations": [
        "barbell",
        "single-arm"
      ],
    },
    "wide-grip": {
      "excludedVariations": [
        "close-grip",
        "neutral-grip",
        "underhand-grip"
      ],
    },
    "close-grip": {
      "excludedVariations": [
        "neutral-grip",
        "underhand-grip",
        "wide-grip"
      ],
    },
    "neutral-grip": {
      "excludedVariations": [
        "barbell",
        "close-grip",
        "underhand-grip",
        "wide-grip"
      ],
    },
    "underhand-grip": {
      "excludedVariations": [
        "close-grip",
        "neutral-grip",
        "wide-grip"
      ],
    },
    "prone": {
      "excludedVariations": [
        "incline"
      ],
    },
    "incline": {
      "excludedVariations": [
        "prone"
      ],
    },
    "dumbbell": {
      "excludedVariations": [
        "barbell",
        "cable",
        "machine"
      ],
    },
    "barbell": {
      "excludedVariations": [
        "alternating",
        "cable",
        "dumbbell",
        "machine",
        "neutral-grip",
        "single-arm"
      ],
    },
    "machine": {
      "excludedVariations": [
        "barbell",
        "cable",
        "dumbbell"
      ],
    },
    "cable": {
      "excludedVariations": [
        "barbell",
        "dumbbell",
        "machine"
      ],
    },
  },
};
