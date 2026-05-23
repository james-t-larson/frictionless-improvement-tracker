const Map<String, dynamic> uprightRow = {
  "pk": "91ee79b7-397d-4b90-8988-9a41bff9d639",
  "name": "Upright Row",
  "muscleGroups": ["Shoulders", "Back"],
  "primaryMuscles": ["lateral deltoid"],
  "secondaryMuscles": ["biceps brachii", "anterior deltoid", "trapezius"],
  "variations": {
    "wide-grip": {
      "excludedVariations": ["narrow-grip", "single-arm"],
    },
    "narrow-grip": {
      "excludedVariations": ["single-arm", "wide-grip"],
    },
    "single-arm": {
      "excludedVariations": ["narrow-grip", "wide-grip"],
    },
    "barbell": {
      "excludedVariations": [
        "band",
        "cable",
        "dumbbell",
        "kettlebell",
        "smith machine",
      ],
    },
    "dumbbell": {
      "excludedVariations": [
        "band",
        "barbell",
        "cable",
        "kettlebell",
        "smith machine",
      ],
    },
    "cable": {
      "excludedVariations": [
        "band",
        "barbell",
        "dumbbell",
        "kettlebell",
        "smith machine",
      ],
    },
    "kettlebell": {
      "excludedVariations": [
        "band",
        "barbell",
        "cable",
        "dumbbell",
        "smith machine",
      ],
    },
    "smith machine": {
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
        "smith machine",
      ],
    },
  },
};
