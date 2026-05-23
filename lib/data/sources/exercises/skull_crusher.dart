const Map<String, dynamic> skullCrusher = {
  "pk": "d2e15f2c-3a4b-4d96-c7e2-4f9b0d3c6a18",
  "name": "Skull Crusher",
  "muscleGroups": ["Arms"],
  "primaryMuscles": ["triceps brachii"],
  "secondaryMuscles": [],
  "variations": {
    "EZ-bar": {
      "excludedVariations": ["floor", "neutral-grip", "single-arm"],
    },
    "single-arm": {
      "excludedVariations": ["EZ-bar", "floor", "neutral-grip"],
    },
    "floor": {
      "excludedVariations": ["EZ-bar", "neutral-grip", "single-arm"],
    },
    "neutral-grip": {
      "excludedVariations": ["EZ-bar", "floor", "single-arm"],
    },
    "barbell": {
      "excludedVariations": [
        "band",
        "cable",
        "decline bench",
        "dumbbell",
        "flat bench",
        "incline bench",
      ],
    },
    "dumbbell": {
      "excludedVariations": [
        "band",
        "barbell",
        "cable",
        "decline bench",
        "flat bench",
        "incline bench",
      ],
    },
    "cable": {
      "excludedVariations": [
        "band",
        "barbell",
        "decline bench",
        "dumbbell",
        "flat bench",
        "incline bench",
      ],
    },
    "band": {
      "excludedVariations": [
        "barbell",
        "cable",
        "decline bench",
        "dumbbell",
        "flat bench",
        "incline bench",
      ],
    },
    "flat bench": {
      "excludedVariations": [
        "band",
        "barbell",
        "cable",
        "decline bench",
        "dumbbell",
        "incline bench",
      ],
    },
    "incline bench": {
      "excludedVariations": [
        "band",
        "barbell",
        "cable",
        "decline bench",
        "dumbbell",
        "flat bench",
      ],
    },
    "decline bench": {
      "excludedVariations": [
        "band",
        "barbell",
        "cable",
        "dumbbell",
        "flat bench",
        "incline bench",
      ],
    },
  },
};
