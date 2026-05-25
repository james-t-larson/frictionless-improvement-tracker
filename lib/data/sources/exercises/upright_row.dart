const Map<String, dynamic> uprightRow = {
  "pk": "91ee79b7-397d-4b90-8988-9a41bff9d639",
  "name": "Upright Row",
  "muscleGroups": ["Shoulders", "Back"],
  "primaryMuscles": ["lateral deltoid"],
  "secondaryMuscles": ["biceps brachii", "anterior deltoid", "trapezius"],
  "variations": {
    "wide-grip": {
      "excludedVariations": ["single-arm"],
    },
    "single-arm": {
      "excludedVariations": ["wide-grip", "barbell", "ez-bar"],
    },
    "barbell": {
      "excludedVariations": [
        "band",
        "cable",
        "dumbbell",
        "ez-bar",
        "kettlebell",
        "smith machine",
        "single-arm",
      ],
    },
    "dumbbell": {
      "excludedVariations": [
        "band",
        "barbell",
        "cable",
        "ez-bar",
        "kettlebell",
        "smith machine",
      ],
    },
    "cable": {
      "excludedVariations": [
        "band",
        "barbell",
        "dumbbell",
        "ez-bar",
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
        "ez-bar",
        "smith machine",
      ],
    },
    "smith machine": {
      "excludedVariations": [
        "band",
        "barbell",
        "cable",
        "dumbbell",
        "ez-bar",
        "kettlebell",
      ],
    },
    "band": {
      "excludedVariations": [
        "barbell",
        "cable",
        "dumbbell",
        "ez-bar",
        "kettlebell",
        "smith machine",
      ],
    },
    "ez-bar": {
      "excludedVariations": [
        "band",
        "barbell",
        "cable",
        "dumbbell",
        "kettlebell",
        "smith machine",
        "single-arm",
      ],
    },
  },
};
