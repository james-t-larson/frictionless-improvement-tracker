const Map<String, dynamic> frontDeltRaise = {
  "pk": "861b30bb-f1d1-4904-acd7-570ccaff52ee",
  "name": "Front Delt Raise",
  "muscleGroups": ["Shoulders"],
  "primaryMuscles": ["anterior deltoid"],
  "secondaryMuscles": [
    "lateral deltoid",
    "pectoralis major",
    "trapezius",
    "serratus anterior"
  ],
  "variations": {
    "single-arm": {
      "excludedVariations": ["alternating", "barbell", "plate"],
    },
    "alternating": {
      "excludedVariations": ["single-arm", "barbell", "machine", "plate"],
    },
    "incline": {
      "excludedVariations": ["prone", "seated"],
    },
    "prone": {
      "excludedVariations": ["incline", "seated"],
    },
    "seated": {
      "excludedVariations": ["incline", "prone"],
    },
    "dumbbell": {
      "excludedVariations": ["band", "barbell", "cable", "machine", "plate"],
    },
    "cable": {
      "excludedVariations": ["band", "barbell", "dumbbell", "machine", "plate"],
    },
    "machine": {
      "excludedVariations": ["alternating", "band", "barbell", "cable", "dumbbell", "plate"],
    },
    "barbell": {
      "excludedVariations": ["alternating", "band", "cable", "dumbbell", "machine", "plate", "single-arm"],
    },
    "plate": {
      "excludedVariations": ["alternating", "band", "barbell", "cable", "dumbbell", "machine", "single-arm"],
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
