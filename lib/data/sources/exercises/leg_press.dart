const Map<String, dynamic> legPress = {
  "pk": "859b2211-9bb0-462b-987c-620a3e37d688",
  "name": "Leg Press",
  "muscleGroups": ["Legs"],
  "primaryMuscles": ["gluteus maximus", "quadriceps femoris", "hip adductors"],
  "secondaryMuscles": ["hamstrings"],
  "variations": {
    "single-leg": {
      "excludedVariations": [
        "narrow-stance",
        "wide-stance",
      ],
    },
    "paused": {
      "excludedVariations": [],
    },
    "wide-stance": {
      "excludedVariations": [
        "narrow-stance",
        "single-leg",
      ],
    },
    "narrow-stance": {
      "excludedVariations": [
        "single-leg",
        "wide-stance",
      ],
    },
    "high-foot": {
      "excludedVariations": [
        "low-foot",
      ],
    },
    "low-foot": {
      "excludedVariations": [
        "high-foot",
      ],
    },
    "banded": {
      "excludedVariations": [],
    },
  },
};
