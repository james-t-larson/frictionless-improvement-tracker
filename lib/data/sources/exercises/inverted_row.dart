const Map<String, dynamic> invertedRow = {
  "pk": "d6e59f6c-7a8b-4d30-c1e6-8f3b4d7c0a52",
  "name": "Inverted Row",
  "muscleGroups": ["Back"],
  "primaryMuscles": ["latissimus dorsi", "posterior deltoid"],
  "secondaryMuscles": ["biceps brachii", "trapezius", "wrist flexors"],
  "variations": {
    "bodyweight": {
      "excludedVariations": [
        "weighted"
      ],
    },
    "weighted": {
      "excludedVariations": [
        "bodyweight"
      ],
    },
    "wide-grip": {
      "excludedVariations": [
        "close-grip",
        "single-arm"
      ],
    },
    "close-grip": {
      "excludedVariations": [
        "single-arm",
        "wide-grip"
      ],
    },
    "single-arm": {
      "excludedVariations": [
        "close-grip",
        "wide-grip"
      ],
    },
    "underhand": {
      "excludedVariations": [
        "neutral",
        "overhand"
      ],
    },
    "overhand": {
      "excludedVariations": [
        "neutral",
        "underhand"
      ],
    },
    "neutral": {
      "excludedVariations": [
        "barbell",
        "overhand",
        "underhand"
      ],
    },
    "feet-elevated": {
      "excludedVariations": [
        "bent-knee"
      ],
    },
    "bent-knee": {
      "excludedVariations": [
        "feet-elevated"
      ],
    },
    "suspension trainer": {
      "excludedVariations": [
        "barbell",
        "rings"
      ],
    },
    "barbell": {
      "excludedVariations": [
        "neutral",
        "rings",
        "suspension trainer"
      ],
    },
    "rings": {
      "excludedVariations": [
        "barbell",
        "suspension trainer"
      ],
    },
  },
};
