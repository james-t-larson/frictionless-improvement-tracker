const Map<String, dynamic> rearDeltFly = {
  "pk": "162433b9-39f3-4e3e-aad6-81736d44c1cf",
  "name": "Rear Delt Fly",
  "alternativeNames": ["Rear Delt Raise"],
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
      "excludedVariations": [],
    },
    "bent-over": {
      "excludedVariations": [
        "lying",
        "reverse pec deck",
      ],
    },
    "seated": {
      "excludedVariations": [
        "lying",
      ],
    },
    "reverse pec deck": {
      "excludedVariations": [
        "band",
        "bent-over",
        "cable",
        "dumbbell",
        "incline bench",
        "lying",
      ],
    },
    "lying": {
      "excludedVariations": [
        "bent-over",
        "reverse pec deck",
        "seated",
      ],
    },
    "dumbbell": {
      "excludedVariations": [
        "band", 
        "cable", 
        "machine", 
        "reverse pec deck",
      ],
    },
    "cable": {
      "excludedVariations": [
        "band", 
        "dumbbell", 
        "machine", 
        "reverse pec deck",
      ],
    },
    "machine": {
      "excludedVariations": [
        "band", 
        "cable", 
        "dumbbell", 
        "incline bench", 
        "reverse pec deck",
      ],
    },
    "incline bench": {
      "excludedVariations": [
        "machine", 
        "reverse pec deck",
      ],
    },
    "band": {
      "excludedVariations": [
        "cable", 
        "dumbbell", 
        "machine", 
        "reverse pec deck",
      ],
    },
  },
};
