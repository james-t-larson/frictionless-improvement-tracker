const Map<String, dynamic> frogPumps = {
  "pk": "8a96a73c-0c69-4102-a2c9-f103c8497e7e",
  "name": "Frog Pumps",
  "muscleGroups": ["Legs"],
  "primaryMuscles": ["gluteus maximus"],
  "secondaryMuscles": ["hamstrings", "hip adductors"],
  "variations": {
    "feet-elevated": {
      "excludedVariations": [],
    },
    "banded": {
      "excludedVariations": [],
    },
    "weighted": {
      "excludedVariations": [
        "barbell",
        "dumbbell",
        "plate-weighted",
        "smith-machine"
      ],
    },
    "plate-weighted": {
      "excludedVariations": [
        "barbell",
        "dumbbell",
        "smith-machine",
        "weighted"
      ],
    },
    "barbell": {
      "excludedVariations": [
        "dumbbell",
        "plate-weighted",
        "smith-machine",
        "weighted"
      ],
    },
    "dumbbell": {
      "excludedVariations": [
        "barbell",
        "plate-weighted",
        "smith-machine",
        "weighted"
      ],
    },
    "smith-machine": {
      "excludedVariations": [
        "barbell",
        "dumbbell",
        "plate-weighted",
        "weighted"
      ],
    },
  },
};
