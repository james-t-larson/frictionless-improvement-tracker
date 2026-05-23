const Map<String, dynamic> rearDeltFly = {
  "pk": "162433b9-39f3-4e3e-aad6-81736d44c1cf",
  "name": "Rear Delt Fly",
  "alternativeNames": ["Rear Delt Raise"],
  "muscleGroups": ["Shoulders", "Back"],
  "primaryMuscles": ["posterior deltoid", "trapezius"],
  "secondaryMuscles": [
    "wrist flexors",
    "infraspinatus",
    "lateral deltoid",
    "latissimus dorsi",
  ],
  "variations": {
    "single-arm": {
      "excludedVariations": [
        "bent-over",
        "lying",
        "reverse pec deck",
        "seated",
      ],
    },
    "bent-over": {
      "excludedVariations": [
        "lying",
        "reverse pec deck",
        "seated",
        "single-arm",
      ],
    },
    "seated": {
      "excludedVariations": [
        "bent-over",
        "lying",
        "reverse pec deck",
        "single-arm",
      ],
    },
    "reverse pec deck": {
      "excludedVariations": ["bent-over", "lying", "seated", "single-arm"],
    },
    "lying": {
      "excludedVariations": [
        "bent-over",
        "reverse pec deck",
        "seated",
        "single-arm",
      ],
    },
    "dumbbell": {
      "excludedVariations": ["band", "cable", "incline bench", "machine"],
    },
    "cable": {
      "excludedVariations": ["band", "dumbbell", "incline bench", "machine"],
    },
    "machine": {
      "excludedVariations": ["band", "cable", "dumbbell", "incline bench"],
    },
    "incline bench": {
      "excludedVariations": ["band", "cable", "dumbbell", "machine"],
    },
    "band": {
      "excludedVariations": ["cable", "dumbbell", "incline bench", "machine"],
    },
  },
};
