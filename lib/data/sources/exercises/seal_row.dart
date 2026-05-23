const Map<String, dynamic> sealRow = {
  "pk": "e7f60a7d-8b9c-4e41-d2f7-9a4c5e8d1b63",
  "name": "Seal Row",
  "muscleGroups": ["Back"],
  "primaryMuscles": ["latissimus dorsi", "posterior deltoid"],
  "secondaryMuscles": ["biceps brachii", "trapezius", "infraspinatus"],
  "variations": {
    "wide-grip": {
      "excludedVariations": ["close-grip", "neutral-grip", "single-arm"],
    },
    "close-grip": {
      "excludedVariations": ["neutral-grip", "single-arm", "wide-grip"],
    },
    "neutral-grip": {
      "excludedVariations": ["close-grip", "single-arm", "wide-grip"],
    },
    "single-arm": {
      "excludedVariations": ["close-grip", "neutral-grip", "wide-grip"],
    },
    "barbell": {
      "excludedVariations": ["cable", "dumbbell", "machine"],
    },
    "dumbbell": {
      "excludedVariations": ["barbell", "cable", "machine"],
    },
    "machine": {
      "excludedVariations": ["barbell", "cable", "dumbbell"],
    },
    "cable": {
      "excludedVariations": ["barbell", "dumbbell", "machine"],
    },
  },
};
