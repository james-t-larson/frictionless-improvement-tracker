const Map<String, dynamic> rearDeltRow = {
  "pk": "e8dc87a4-79e1-4114-90a4-418a4b67359f",
  "name": "Rear Delt Row",
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
      "excludedVariations": ["close-grip", "prone", "wide-grip"],
    },
    "prone": {
      "excludedVariations": ["close-grip", "single-arm", "wide-grip"],
    },
    "wide-grip": {
      "excludedVariations": ["close-grip", "prone", "single-arm"],
    },
    "close-grip": {
      "excludedVariations": ["prone", "single-arm", "wide-grip"],
    },
    "dumbbell": {
      "excludedVariations": [
        "band",
        "barbell",
        "cable",
        "kettlebell",
        "machine",
      ],
    },
    "barbell": {
      "excludedVariations": [
        "band",
        "cable",
        "dumbbell",
        "kettlebell",
        "machine",
      ],
    },
    "cable": {
      "excludedVariations": [
        "band",
        "barbell",
        "dumbbell",
        "kettlebell",
        "machine",
      ],
    },
    "machine": {
      "excludedVariations": [
        "band",
        "barbell",
        "cable",
        "dumbbell",
        "kettlebell",
      ],
    },
    "band": {
      "excludedVariations": [
        "barbell",
        "cable",
        "dumbbell",
        "kettlebell",
        "machine",
      ],
    },
    "kettlebell": {
      "excludedVariations": ["band", "barbell", "cable", "dumbbell", "machine"],
    },
  },
};
