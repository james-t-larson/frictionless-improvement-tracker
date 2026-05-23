const Map<String, dynamic> frogPumps = {
  "pk": "8a96a73c-0c69-4102-a2c9-f103c8497e7e",
  "name": "Frog Pumps",
  "muscleGroups": ["Glutes"],
  "primaryMuscles": ["gluteus maximus"],
  "secondaryMuscles": ["hamstrings", "hip adductors"],
  "variations": {
    "single-leg": {
      "excludedVariations": ["feet-elevated"],
    },
    "feet-elevated": {
      "excludedVariations": ["single-leg"],
    },
    "banded": {
      "excludedVariations": [
        "barbell",
        "dumbbell",
        "plate-weighted",
        "weighted",
      ],
    },
    "weighted": {
      "excludedVariations": ["banded", "barbell", "dumbbell", "plate-weighted"],
    },
    "plate-weighted": {
      "excludedVariations": ["banded", "barbell", "dumbbell", "weighted"],
    },
    "barbell": {
      "excludedVariations": [
        "banded",
        "dumbbell",
        "plate-weighted",
        "weighted",
      ],
    },
    "dumbbell": {
      "excludedVariations": ["banded", "barbell", "plate-weighted", "weighted"],
    },
  },
};
