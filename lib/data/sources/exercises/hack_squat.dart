const Map<String, dynamic> hackSquat = {
  "pk": "288eae8d-af58-42db-9f10-16b599e11876",
  "name": "Hack Squat",
  "muscleGroups": ["Legs"],
  "primaryMuscles": ["quadriceps femoris"],
  "secondaryMuscles": [
    "gastrocnemius",
    "wrist flexors",
    "gluteus maximus",
    "erector spinae",
    "hip adductors",
    "trapezius",
  ],
  "variations": {
    "reverse": {
      "excludedVariations": [
        "barbell",
        "dumbbell",
        "heel-elevated",
      ],
    },
    "narrow-stance": {
      "excludedVariations": [
        "wide-stance",
      ],
    },
    "wide-stance": {
      "excludedVariations": [
        "narrow-stance",
      ],
    },
    "paused": {
      "excludedVariations": [],
    },
    "heel-elevated": {
      "excludedVariations": [
        "reverse",
      ],
    },
    "barbell": {
      "excludedVariations": [
        "dumbbell",
        "machine",
        "reverse",
        "smith machine",
      ],
    },
    "dumbbell": {
      "excludedVariations": [
        "banded",
        "barbell",
        "machine",
        "reverse",
        "smith machine",
      ],
    },
    "machine": {
      "excludedVariations": [
        "barbell",
        "dumbbell",
        "smith machine",
      ],
    },
    "smith machine": {
      "excludedVariations": [
        "barbell",
        "dumbbell",
        "machine",
      ],
    },
    "banded": {
      "excludedVariations": [
        "dumbbell",
      ],
    },
  },
};
