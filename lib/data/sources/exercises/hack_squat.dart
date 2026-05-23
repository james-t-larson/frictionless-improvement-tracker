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
        "heel-elevated",
        "narrow-stance",
        "paused",
        "wide-stance",
      ],
    },
    "narrow-stance": {
      "excludedVariations": [
        "heel-elevated",
        "paused",
        "reverse",
        "wide-stance",
      ],
    },
    "wide-stance": {
      "excludedVariations": [
        "heel-elevated",
        "narrow-stance",
        "paused",
        "reverse",
      ],
    },
    "paused": {
      "excludedVariations": [
        "heel-elevated",
        "narrow-stance",
        "reverse",
        "wide-stance",
      ],
    },
    "heel-elevated": {
      "excludedVariations": [
        "narrow-stance",
        "paused",
        "reverse",
        "wide-stance",
      ],
    },
    "barbell": {
      "excludedVariations": [
        "banded",
        "dumbbell",
        "machine",
        "safety bar",
        "smith machine",
      ],
    },
    "dumbbell": {
      "excludedVariations": [
        "banded",
        "barbell",
        "machine",
        "safety bar",
        "smith machine",
      ],
    },
    "machine": {
      "excludedVariations": [
        "banded",
        "barbell",
        "dumbbell",
        "safety bar",
        "smith machine",
      ],
    },
    "smith machine": {
      "excludedVariations": [
        "banded",
        "barbell",
        "dumbbell",
        "machine",
        "safety bar",
      ],
    },
    "banded": {
      "excludedVariations": [
        "barbell",
        "dumbbell",
        "machine",
        "safety bar",
        "smith machine",
      ],
    },
    "safety bar": {
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
