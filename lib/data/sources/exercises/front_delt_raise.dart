const Map<String, dynamic> frontDeltRaise = {
  "pk": "e8dc87a4-79e1-4114-90a4-418a4b67359f",
  "name": "Front Delt Raise",
  "alternativeNames": ["Front Delt Fly"],
  "muscleGroups": ["Shoulders"],
  "primaryMuscles": ["posterior deltoid", "trapezius"],
  "secondaryMuscles": [
    "wrist flexors",
    "infraspinatus",
    "lateral deltoid",
    "latissimus dorsi",
  ],
  "variations": {
    "single-arm": {
      "excludedVariations": ["incline", "prone", "seated"],
    },
    "incline": {
      "excludedVariations": ["prone", "seated", "single-arm"],
    },
    "prone": {
      "excludedVariations": ["incline", "seated", "single-arm"],
    },
    "seated": {
      "excludedVariations": ["incline", "prone", "single-arm"],
    },
    "dumbbell": {
      "excludedVariations": ["band", "barbell", "cable", "machine", "plate"],
    },
    "cable": {
      "excludedVariations": ["band", "barbell", "dumbbell", "machine", "plate"],
    },
    "machine": {
      "excludedVariations": ["band", "barbell", "cable", "dumbbell", "plate"],
    },
    "barbell": {
      "excludedVariations": ["band", "cable", "dumbbell", "machine", "plate"],
    },
    "plate": {
      "excludedVariations": ["band", "barbell", "cable", "dumbbell", "machine"],
    },
    "band": {
      "excludedVariations": [
        "barbell",
        "cable",
        "dumbbell",
        "machine",
        "plate",
      ],
    },
  },
};
