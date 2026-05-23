const Map<String, dynamic> mountainClimbers = {
  "pk": "e13cf8a4-6b48-4d9e-9a24-a30d5f98d713",
  "name": "Mountain Climbers",
  "muscleGroups": ["Core"],
  "primaryMuscles": ["rectus abdominis"],
  "secondaryMuscles": ["external obliques"],
  "variations": {
    "slow": {
      "excludedVariations": ["cross-body", "elevated"],
    },
    "cross-body": {
      "excludedVariations": ["elevated", "slow"],
    },
    "elevated": {
      "excludedVariations": ["cross-body", "slow"],
    },
    "resistance band": {
      "excludedVariations": ["bosu", "slider", "weighted vest"],
    },
    "slider": {
      "excludedVariations": ["bosu", "resistance band", "weighted vest"],
    },
    "bosu": {
      "excludedVariations": ["resistance band", "slider", "weighted vest"],
    },
    "weighted vest": {
      "excludedVariations": ["bosu", "resistance band", "slider"],
    },
  },
};
