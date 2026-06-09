const Map<String, dynamic> rearDeltRow = {
  "pk": "e8dc87a4-79e1-4114-90a4-418a4b67359e",
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
      "excludedVariations": ["prone", "wide-grip", "barbell"],
    },
    "prone": {
      "excludedVariations": ["single-arm"],
    },
    "wide-grip": {
      "excludedVariations": ["single-arm", "dumbbell", "kettlebell"],
    },
    "dumbbell": {
      "excludedVariations": [
        "band",
        "barbell",
        "cable",
        "kettlebell",
        "machine",
        "wide-grip",
      ],
    },
    "barbell": {
      "excludedVariations": [
        "band",
        "cable",
        "dumbbell",
        "kettlebell",
        "machine",
        "single-arm",
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
      "excludedVariations": [
        "band",
        "barbell",
        "cable",
        "dumbbell",
        "machine",
        "wide-grip",
      ],
    },
  },
};
