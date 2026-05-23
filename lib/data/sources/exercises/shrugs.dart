const Map<String, dynamic> shrugs = {
  "pk": "e8dc87a4-79e1-4114-90a4-418a4b67359f",
  "name": "Shrugs",
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
      "excludedVariations": ["behind-the-back", "overhead"],
    },
    "behind-the-back": {
      "excludedVariations": ["overhead", "single-arm"],
    },
    "overhead": {
      "excludedVariations": ["behind-the-back", "single-arm"],
    },
    "dumbbell": {
      "excludedVariations": [
        "band",
        "barbell",
        "cable",
        "kettlebell",
        "machine",
        "smith machine",
        "trap bar",
      ],
    },
    "barbell": {
      "excludedVariations": [
        "band",
        "cable",
        "dumbbell",
        "kettlebell",
        "machine",
        "smith machine",
        "trap bar",
      ],
    },
    "cable": {
      "excludedVariations": [
        "band",
        "barbell",
        "dumbbell",
        "kettlebell",
        "machine",
        "smith machine",
        "trap bar",
      ],
    },
    "machine": {
      "excludedVariations": [
        "band",
        "barbell",
        "cable",
        "dumbbell",
        "kettlebell",
        "smith machine",
        "trap bar",
      ],
    },
    "kettlebell": {
      "excludedVariations": [
        "band",
        "barbell",
        "cable",
        "dumbbell",
        "machine",
        "smith machine",
        "trap bar",
      ],
    },
    "trap bar": {
      "excludedVariations": [
        "band",
        "barbell",
        "cable",
        "dumbbell",
        "kettlebell",
        "machine",
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
        "machine",
        "trap bar",
      ],
    },
    "band": {
      "excludedVariations": [
        "barbell",
        "cable",
        "dumbbell",
        "kettlebell",
        "machine",
        "smith machine",
        "trap bar",
      ],
    },
  },
};
