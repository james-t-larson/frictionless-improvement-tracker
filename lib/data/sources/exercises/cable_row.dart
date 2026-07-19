const Map<String, dynamic> cableRow = {
  "pk": "a9b82c9f-0d1e-4a63-f4b9-1c6e7a0f3d85",
  "name": "Cable Row",
  "muscleGroups": ["Back"],
  "primaryMuscles": ["latissimus dorsi", "posterior deltoid"],
  "secondaryMuscles": [
    "biceps brachii",
    "trapezius",
    "erector spinae",
    "wrist flexors",
  ],
  "variations": {
    "seated": {
      "excludedVariations": [
        "half-kneeling",
        "kneeling",
        "split-stance",
        "standing",
      ],
    },
    "standing": {
      "excludedVariations": [
        "half-kneeling",
        "kneeling",
        "seated",
      ],
    },
    "single-arm": {
      "excludedVariations": [
        "close-grip",
        "wide-grip",
      ],
    },
    "wide-grip": {
      "excludedVariations": [
        "close-grip",
        "rope",
        "single-arm",
      ],
    },
    "close-grip": {
      "excludedVariations": [
        "single-arm",
        "wide-grip",
      ],
    },
    "neutral-grip": {
      "excludedVariations": [
        "overhand",
        "underhand",
      ],
    },
    "kneeling": {
      "excludedVariations": [
        "half-kneeling",
        "seated",
        "split-stance",
        "standing",
      ],
    },
    "half-kneeling": {
      "excludedVariations": [
        "kneeling",
        "seated",
        "split-stance",
        "standing",
      ],
    },
    "split-stance": {
      "excludedVariations": [
        "half-kneeling",
        "kneeling",
        "seated",
      ],
    },
    "overhand": {
      "excludedVariations": [
        "neutral-grip",
        "underhand",
      ],
    },
    "underhand": {
      "excludedVariations": [
        "neutral-grip",
        "overhand",
        "rope",
      ],
    },
    "rope": {
      "excludedVariations": [
        "underhand",
        "wide-grip",
      ],
    },
  },
  "namedVariations": [
    {
      "name": "Seated Cable Row",
      "variations": ["seated"],
    },
  ],
};
