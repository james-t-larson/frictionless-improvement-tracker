const Map<String, dynamic> hipThrust = {
  "pk": "b9e2a547-3c68-4f10-a1d7-5c8b0e3d2f94",
  "name": "Hip Thrust",
  "muscleGroups": ["Legs"],
  "primaryMuscles": ["gluteus maximus"],
  "secondaryMuscles": ["hamstrings", "hip adductors"],
  "variations": {
    "single-leg": {
      "excludedVariations": [
        "B-stance",
        "narrow-stance",
        "wide-stance",
      ],
    },
    "paused": {
      "excludedVariations": [],
    },
    "feet-elevated": {
      "excludedVariations": [],
    },
    "narrow-stance": {
      "excludedVariations": [
        "B-stance",
        "single-leg",
        "wide-stance",
      ],
    },
    "wide-stance": {
      "excludedVariations": [
        "B-stance",
        "narrow-stance",
        "single-leg",
      ],
    },
    "american": {
      "excludedVariations": [],
    },
    "B-stance": {
      "excludedVariations": [
        "narrow-stance",
        "single-leg",
        "wide-stance",
      ],
    },
    "barbell": {
      "excludedVariations": [
        "dumbbell",
        "machine",
        "plate",
        "smith machine",
      ],
    },
    "dumbbell": {
      "excludedVariations": [
        "barbell",
        "machine",
        "plate",
        "smith machine",
      ],
    },
    "banded": {
      "excludedVariations": [],
    },
    "machine": {
      "excludedVariations": [
        "barbell",
        "dumbbell",
        "plate",
        "smith machine",
      ],
    },
    "smith machine": {
      "excludedVariations": [
        "barbell",
        "dumbbell",
        "machine",
        "plate",
      ],
    },
    "plate": {
      "excludedVariations": [
        "barbell",
        "dumbbell",
        "machine",
        "smith machine",
      ],
    },
  },
};
