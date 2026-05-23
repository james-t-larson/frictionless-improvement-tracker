const Map<String, dynamic> pullover = {
  "pk": "f6a59b6e-7c8d-4f30-e1a6-8b3d4f7c0e52",
  "name": "Pullover",
  "muscleGroups": ["Chest", "Back"],
  "primaryMuscles": ["pectoralis major", "latissimus dorsi"],
  "secondaryMuscles": ["triceps brachii", "posterior deltoid"],
  "variations": {
    "decline": {
      "excludedVariations": [
        "EZ-bar",
        "bent-arm",
        "single-arm",
        "straight-arm",
      ],
    },
    "single-arm": {
      "excludedVariations": ["EZ-bar", "bent-arm", "decline", "straight-arm"],
    },
    "EZ-bar": {
      "excludedVariations": [
        "bent-arm",
        "decline",
        "single-arm",
        "straight-arm",
      ],
    },
    "straight-arm": {
      "excludedVariations": ["EZ-bar", "bent-arm", "decline", "single-arm"],
    },
    "bent-arm": {
      "excludedVariations": ["EZ-bar", "decline", "single-arm", "straight-arm"],
    },
    "dumbbell": {
      "excludedVariations": ["barbell", "cable", "flat bench", "machine"],
    },
    "flat bench": {
      "excludedVariations": ["barbell", "cable", "dumbbell", "machine"],
    },
    "cable": {
      "excludedVariations": ["barbell", "dumbbell", "flat bench", "machine"],
    },
    "barbell": {
      "excludedVariations": ["cable", "dumbbell", "flat bench", "machine"],
    },
    "machine": {
      "excludedVariations": ["barbell", "cable", "dumbbell", "flat bench"],
    },
  },
};
