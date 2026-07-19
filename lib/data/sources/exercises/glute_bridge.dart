const Map<String, dynamic> gluteBridge = {
  "pk": "ab0da03b-dd54-4a7f-bb06-40c866dfa88c",
  "name": "Glute Bridge",
  "muscleGroups": ["Legs"],
  "primaryMuscles": ["gluteus maximus", "hamstrings"],
  "secondaryMuscles": ["hip adductors"],
  "variations": {
    "single-leg": {
      "excludedVariations": ["double-leg", "b-stance", "marching"],
    },
    "feet-elevated": {
      "excludedVariations": [],
    },
    "double-leg": {
      "excludedVariations": ["single-leg", "b-stance", "marching"],
    },
    "b-stance": {
      "excludedVariations": ["single-leg", "double-leg", "marching"],
    },
    "marching": {
      "excludedVariations": ["single-leg", "double-leg", "b-stance"],
    },
    "weighted": {
      "excludedVariations": [
        "barbell",
        "dumbbell",
        "kettlebell",
        "plate",
      ],
    },
    "banded": {
      "excludedVariations": [],
    },
    "barbell": {
      "excludedVariations": [
        "dumbbell",
        "kettlebell",
        "plate",
        "weighted",
      ],
    },
    "plate": {
      "excludedVariations": [
        "barbell",
        "dumbbell",
        "kettlebell",
        "weighted",
      ],
    },
    "dumbbell": {
      "excludedVariations": [
        "barbell",
        "kettlebell",
        "plate",
        "weighted",
      ],
    },
    "kettlebell": {
      "excludedVariations": [
        "barbell",
        "dumbbell",
        "plate",
        "weighted",
      ],
    },
  },
  "namedVariations": [
    {
      "name": "Single-Leg Glute Bridge",
      "variations": ["single-leg"],
    },
  ],
};
