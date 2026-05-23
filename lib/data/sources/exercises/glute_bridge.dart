const Map<String, dynamic> gluteBridge = {
  "pk": "ab0da03b-dd54-4a7f-bb06-40c866dfa88c",
  "name": "Glute Bridge",
  "muscleGroups": ["Glutes"],
  "primaryMuscles": ["gluteus maximus", "hamstrings"],
  "secondaryMuscles": ["hip adductors"],
  "variations": {
    "single-leg": {
      "excludedVariations": ["double-leg", "feet-elevated"],
    },
    "feet-elevated": {
      "excludedVariations": ["double-leg", "single-leg"],
    },
    "double-leg": {
      "excludedVariations": ["feet-elevated", "single-leg"],
    },
    "weighted": {
      "excludedVariations": [
        "banded",
        "barbell",
        "dumbbell",
        "kettlebell",
        "plate",
      ],
    },
    "banded": {
      "excludedVariations": [
        "barbell",
        "dumbbell",
        "kettlebell",
        "plate",
        "weighted",
      ],
    },
    "barbell": {
      "excludedVariations": [
        "banded",
        "dumbbell",
        "kettlebell",
        "plate",
        "weighted",
      ],
    },
    "plate": {
      "excludedVariations": [
        "banded",
        "barbell",
        "dumbbell",
        "kettlebell",
        "weighted",
      ],
    },
    "dumbbell": {
      "excludedVariations": [
        "banded",
        "barbell",
        "kettlebell",
        "plate",
        "weighted",
      ],
    },
    "kettlebell": {
      "excludedVariations": [
        "banded",
        "barbell",
        "dumbbell",
        "plate",
        "weighted",
      ],
    },
  },
};
