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
      "excludedVariations": ["close-grip", "wide-grip"],
    },
    "single-arm": {
      "excludedVariations": ["close-grip", "wide-grip"],
    },
    "barbell": {
      "excludedVariations": ["dumbbell", "machine"],
    },
    "dumbbell": {
      "excludedVariations": ["barbell", "machine"],
    },
    "machine": {
      "excludedVariations": ["barbell", "dumbbell"],
    },
  },
};
