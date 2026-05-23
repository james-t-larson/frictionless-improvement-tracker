const Map<String, dynamic> hipThrust = {
  "pk": "b9e2a547-3c68-4f10-a1d7-5c8b0e3d2f94",
  "name": "Hip Thrust",
  "muscleGroups": ["Glutes"],
  "primaryMuscles": ["gluteus maximus"],
  "secondaryMuscles": ["hamstrings", "hip adductors"],
  "variations": {
    "single-leg": {
      "excludedVariations": [
        "B-stance",
        "american",
        "feet-elevated",
        "narrow-stance",
        "paused",
        "wide-stance",
      ],
    },
    "paused": {
      "excludedVariations": [
        "B-stance",
        "american",
        "feet-elevated",
        "narrow-stance",
        "single-leg",
        "wide-stance",
      ],
    },
    "feet-elevated": {
      "excludedVariations": [
        "B-stance",
        "american",
        "narrow-stance",
        "paused",
        "single-leg",
        "wide-stance",
      ],
    },
    "narrow-stance": {
      "excludedVariations": [
        "B-stance",
        "american",
        "feet-elevated",
        "paused",
        "single-leg",
        "wide-stance",
      ],
    },
    "wide-stance": {
      "excludedVariations": [
        "B-stance",
        "american",
        "feet-elevated",
        "narrow-stance",
        "paused",
        "single-leg",
      ],
    },
    "american": {
      "excludedVariations": [
        "B-stance",
        "feet-elevated",
        "narrow-stance",
        "paused",
        "single-leg",
        "wide-stance",
      ],
    },
    "B-stance": {
      "excludedVariations": [
        "american",
        "feet-elevated",
        "narrow-stance",
        "paused",
        "single-leg",
        "wide-stance",
      ],
    },
    "barbell": {
      "excludedVariations": [
        "banded",
        "dumbbell",
        "machine",
        "plate",
        "smith machine",
      ],
    },
    "dumbbell": {
      "excludedVariations": [
        "banded",
        "barbell",
        "machine",
        "plate",
        "smith machine",
      ],
    },
    "banded": {
      "excludedVariations": [
        "barbell",
        "dumbbell",
        "machine",
        "plate",
        "smith machine",
      ],
    },
    "machine": {
      "excludedVariations": [
        "banded",
        "barbell",
        "dumbbell",
        "plate",
        "smith machine",
      ],
    },
    "smith machine": {
      "excludedVariations": [
        "banded",
        "barbell",
        "dumbbell",
        "machine",
        "plate",
      ],
    },
    "plate": {
      "excludedVariations": [
        "banded",
        "barbell",
        "dumbbell",
        "machine",
        "smith machine",
      ],
    },
  },
};
