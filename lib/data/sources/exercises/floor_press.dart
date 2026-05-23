const Map<String, dynamic> floorPress = {
  "pk": "c5116ba3-8a9d-4318-80e5-678a927cf916",
  "name": "Floor Press",
  "muscleGroups": ["Chest"],
  "primaryMuscles": ["pectoralis major", "anterior deltoid"],
  "secondaryMuscles": ["triceps brachii"],
  "variations": {
    "single-arm": {
      "excludedVariations": ["close-grip", "barbell", "alternating"],
    },
    "close-grip": {
      "excludedVariations": ["single-arm", "alternating"],
    },
    "paused": {
      "excludedVariations": [],
    },
    "neutral-grip": {
      "excludedVariations": ["barbell"],
    },
    "dumbbell": {
      "excludedVariations": ["barbell", "kettlebell"],
    },
    "barbell": {
      "excludedVariations": ["dumbbell", "kettlebell", "single-arm", "neutral-grip", "alternating"],
    },
    "kettlebell": {
      "excludedVariations": ["barbell", "dumbbell"],
    },
    "banded": {
      "excludedVariations": [],
    },
    "alternating": {
      "excludedVariations": ["barbell", "close-grip", "single-arm"],
    },
    "bridge": {
      "excludedVariations": [],
    },
  },
};
