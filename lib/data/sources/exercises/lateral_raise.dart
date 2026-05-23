const Map<String, dynamic> lateralRaise = {
  "pk": "12d21baa-3b60-414a-bf91-eb0e11e9c56e",
  "name": "Lateral Raise",
  "alternativeNames": ["Lateral Delt Fly", "Lateral Fly", "Lateral Delt Raise"],
  "muscleGroups": ["Shoulders"],
  "primaryMuscles": ["lateral deltoid"],
  "secondaryMuscles": [
    "anterior deltoid",
    "trapezius",
    "supraspinatus"
  ],
  "variations": {
    "single-arm": {
      "excludedVariations": [],
    },
    "seated": {
      "excludedVariations": ["leaning", "lying"],
    },
    "lying": {
      "excludedVariations": ["leaning", "seated", "machine"],
    },
    "leaning": {
      "excludedVariations": ["lying", "seated", "machine"],
    },
    "partial": {
      "excludedVariations": ["lying"],
    },
    "dumbbell": {
      "excludedVariations": [
        "band",
        "behind-the-back cable",
        "cable",
        "kettlebell",
        "machine",
      ],
    },
    "cable": {
      "excludedVariations": [
        "band",
        "behind-the-back cable",
        "dumbbell",
        "kettlebell",
        "machine",
      ],
    },
    "machine": {
      "excludedVariations": [
        "band",
        "behind-the-back cable",
        "cable",
        "dumbbell",
        "kettlebell",
        "leaning",
        "lying",
      ],
    },
    "band": {
      "excludedVariations": [
        "behind-the-back cable",
        "cable",
        "dumbbell",
        "kettlebell",
        "machine",
      ],
    },
    "behind-the-back cable": {
      "excludedVariations": [
        "band",
        "cable",
        "dumbbell",
        "kettlebell",
        "machine",
      ],
    },
    "kettlebell": {
      "excludedVariations": [
        "band",
        "behind-the-back cable",
        "cable",
        "dumbbell",
        "machine",
      ],
    },
  },
};
