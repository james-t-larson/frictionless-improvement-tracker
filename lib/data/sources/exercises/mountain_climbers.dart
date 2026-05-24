const Map<String, dynamic> mountainClimbers = {
  "pk": "e13cf8a4-6b48-4d9e-9a24-a30d5f98d713",
  "name": "Mountain Climbers",
  "muscleGroups": ["Core"],
  "primaryMuscles": ["rectus abdominis"],
  "secondaryMuscles": ["external obliques"],
  "variations": {
    "slow": {
      "excludedVariations": [],
    },
    "cross-body": {
      "excludedVariations": ["spiderman"],
    },
    "spiderman": {
      "excludedVariations": ["cross-body"],
    },
    "elevated": {
      "excludedVariations": ["slider"],
    },
    "resistance band": {
      "excludedVariations": ["bosu", "slider"],
    },
    "slider": {
      "excludedVariations": ["bosu", "resistance band", "elevated"],
    },
    "bosu": {
      "excludedVariations": ["resistance band", "slider"],
    },
    "weighted vest": {
      "excludedVariations": [],
    },
  },
};
