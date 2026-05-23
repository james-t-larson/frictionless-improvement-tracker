const Map<String, dynamic> floorPress = {
  "pk": "c5116ba3-8a9d-4318-80e5-678a927cf916",
  "name": "Floor Press",
  "muscleGroups": ["Push", "Chest"],
  "primaryMuscles": ["pectoralis major", "anterior deltoid"],
  "secondaryMuscles": ["triceps brachii"],
  "variations": {
    "single-arm": {
      "excludedVariations": ["close-grip", "neutral-grip", "paused"],
    },
    "close-grip": {
      "excludedVariations": ["neutral-grip", "paused", "single-arm"],
    },
    "paused": {
      "excludedVariations": ["close-grip", "neutral-grip", "single-arm"],
    },
    "neutral-grip": {
      "excludedVariations": ["close-grip", "paused", "single-arm"],
    },
    "dumbbell": {
      "excludedVariations": ["banded", "barbell", "kettlebell"],
    },
    "barbell": {
      "excludedVariations": ["banded", "dumbbell", "kettlebell"],
    },
    "kettlebell": {
      "excludedVariations": ["banded", "barbell", "dumbbell"],
    },
    "banded": {
      "excludedVariations": ["barbell", "dumbbell", "kettlebell"],
    },
  },
};
