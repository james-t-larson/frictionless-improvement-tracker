const Map<String, dynamic> lateralRaise = {
  "pk": "162433b9-39f3-4e3e-aad6-81736d44c1cf",
  "name": "Lateral Raise",
  "alternativeNames": ["Lateral Delt Fly", "Lateral Fly", "Lateral Delt Raise"],
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
      "excludedVariations": ["leaning", "lying", "partial", "seated"],
    },
    "seated": {
      "excludedVariations": ["leaning", "lying", "partial", "single-arm"],
    },
    "lying": {
      "excludedVariations": ["leaning", "partial", "seated", "single-arm"],
    },
    "leaning": {
      "excludedVariations": ["lying", "partial", "seated", "single-arm"],
    },
    "partial": {
      "excludedVariations": ["leaning", "lying", "seated", "single-arm"],
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
