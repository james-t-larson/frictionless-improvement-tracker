const Map<String, dynamic> boxJump = {
  "pk": "f8a71b8f-9c0d-4f52-e3a8-0b5d6f9f2c74",
  "name": "Box Jump",
  "muscleGroups": ["Legs"],
  "primaryMuscles": ["gluteus maximus", "quadriceps femoris"],
  "secondaryMuscles": ["hamstrings", "gastrocnemius"],
  "variations": {
    "standard": {
      "excludedVariations": [
        "box jump over",
        "depth jump",
        "lateral",
        "rotational",
        "seated",
        "single-leg",
      ],
    },
    "depth jump": {
      "excludedVariations": [
        "box jump over",
        "lateral",
        "rotational",
        "seated",
        "single-leg",
        "standard",
      ],
    },
    "single-leg": {
      "excludedVariations": [
        "box jump over",
        "depth jump",
        "lateral",
        "rotational",
        "seated",
        "standard",
      ],
    },
    "lateral": {
      "excludedVariations": [
        "box jump over",
        "depth jump",
        "rotational",
        "seated",
        "single-leg",
        "standard",
      ],
    },
    "rotational": {
      "excludedVariations": [
        "box jump over",
        "depth jump",
        "lateral",
        "seated",
        "single-leg",
        "standard",
      ],
    },
    "seated": {
      "excludedVariations": [
        "box jump over",
        "depth jump",
        "lateral",
        "rotational",
        "single-leg",
        "standard",
      ],
    },
    "box jump over": {
      "excludedVariations": [
        "depth jump",
        "lateral",
        "rotational",
        "seated",
        "single-leg",
        "standard",
      ],
    },
  },
};
