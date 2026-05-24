const Map<String, dynamic> skullCrusher = {
  "pk": "d2e15f2c-3a4b-4d96-c7e2-4f9b0d3c6a18",
  "name": "Skull Crusher",
  "muscleGroups": ["Arms"],
  "primaryMuscles": ["triceps brachii"],
  "secondaryMuscles": [],
  "variations": {
    "EZ-bar": {
      "excludedVariations": ["barbell", "dumbbell", "cable", "band", "single-arm", "neutral-grip"],
    },
    "single-arm": {
      "excludedVariations": ["EZ-bar", "barbell"],
    },
    "floor": {
      "excludedVariations": ["flat bench", "incline bench", "decline bench"],
    },
    "neutral-grip": {
      "excludedVariations": ["EZ-bar", "barbell"],
    },
    "barbell": {
      "excludedVariations": ["EZ-bar", "dumbbell", "cable", "band", "single-arm", "neutral-grip"],
    },
    "dumbbell": {
      "excludedVariations": ["EZ-bar", "barbell", "cable", "band"],
    },
    "cable": {
      "excludedVariations": ["EZ-bar", "barbell", "dumbbell", "band"],
    },
    "band": {
      "excludedVariations": ["EZ-bar", "barbell", "dumbbell", "cable"],
    },
    "flat bench": {
      "excludedVariations": ["incline bench", "decline bench", "floor"],
    },
    "incline bench": {
      "excludedVariations": ["flat bench", "decline bench", "floor"],
    },
    "decline bench": {
      "excludedVariations": ["flat bench", "incline bench", "floor"],
    },
  },
};
