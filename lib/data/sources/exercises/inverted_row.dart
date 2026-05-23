const Map<String, dynamic> invertedRow = {
  "pk": "d6e59f6c-7a8b-4d30-c1e6-8f3b4d7c0a52",
  "name": "Inverted Row",
  "muscleGroups": ["Back"],
  "primaryMuscles": ["latissimus dorsi", "posterior deltoid"],
  "secondaryMuscles": ["biceps brachii", "trapezius", "wrist flexors"],
  "variations": {
    "bodyweight": {
      "excludedVariations": [
        "close-grip",
        "feet-elevated",
        "neutral",
        "overhand",
        "pronated",
        "single-arm",
        "underhand",
        "wide-grip",
      ],
    },
    "wide-grip": {
      "excludedVariations": [
        "bodyweight",
        "close-grip",
        "feet-elevated",
        "neutral",
        "overhand",
        "pronated",
        "single-arm",
        "underhand",
      ],
    },
    "close-grip": {
      "excludedVariations": [
        "bodyweight",
        "feet-elevated",
        "neutral",
        "overhand",
        "pronated",
        "single-arm",
        "underhand",
        "wide-grip",
      ],
    },
    "underhand": {
      "excludedVariations": [
        "bodyweight",
        "close-grip",
        "feet-elevated",
        "neutral",
        "overhand",
        "pronated",
        "single-arm",
        "wide-grip",
      ],
    },
    "feet-elevated": {
      "excludedVariations": [
        "bodyweight",
        "close-grip",
        "neutral",
        "overhand",
        "pronated",
        "single-arm",
        "underhand",
        "wide-grip",
      ],
    },
    "overhand": {
      "excludedVariations": [
        "bodyweight",
        "close-grip",
        "feet-elevated",
        "neutral",
        "pronated",
        "single-arm",
        "underhand",
        "wide-grip",
      ],
    },
    "neutral": {
      "excludedVariations": [
        "bodyweight",
        "close-grip",
        "feet-elevated",
        "overhand",
        "pronated",
        "single-arm",
        "underhand",
        "wide-grip",
      ],
    },
    "pronated": {
      "excludedVariations": [
        "bodyweight",
        "close-grip",
        "feet-elevated",
        "neutral",
        "overhand",
        "single-arm",
        "underhand",
        "wide-grip",
      ],
    },
    "single-arm": {
      "excludedVariations": [
        "bodyweight",
        "close-grip",
        "feet-elevated",
        "neutral",
        "overhand",
        "pronated",
        "underhand",
        "wide-grip",
      ],
    },
    "weighted": {
      "excludedVariations": ["barbell", "rings", "suspension trainer"],
    },
    "suspension trainer": {
      "excludedVariations": ["barbell", "rings", "weighted"],
    },
    "barbell": {
      "excludedVariations": ["rings", "suspension trainer", "weighted"],
    },
    "rings": {
      "excludedVariations": ["barbell", "suspension trainer", "weighted"],
    },
  },
};
