const Map<String, dynamic> boxJump = {
  "pk": "f8a71b8f-9c0d-4f52-e3a8-0b5d6f9f2c74",
  "name": "Box Jump",
  "muscleGroups": ["Legs"],
  "primaryMuscles": ["gluteus maximus", "quadriceps femoris"],
  "secondaryMuscles": ["hamstrings", "gastrocnemius"],
  "variations": {
    "standard": {
      "excludedVariations": [
        "broad jump",
        "depth jump",
        "lateral",
        "rotational",
        "single-leg",
        "step-down",
      ],
    },
    "depth jump": {
      "excludedVariations": [
        "broad jump",
        "lateral",
        "rotational",
        "single-leg",
        "standard",
        "step-down",
      ],
    },
    "single-leg": {
      "excludedVariations": [
        "broad jump",
        "depth jump",
        "lateral",
        "rotational",
        "standard",
        "step-down",
      ],
    },
    "lateral": {
      "excludedVariations": [
        "broad jump",
        "depth jump",
        "rotational",
        "single-leg",
        "standard",
        "step-down",
      ],
    },
    "rotational": {
      "excludedVariations": [
        "broad jump",
        "depth jump",
        "lateral",
        "single-leg",
        "standard",
        "step-down",
      ],
    },
    "broad jump": {
      "excludedVariations": [
        "depth jump",
        "lateral",
        "rotational",
        "single-leg",
        "standard",
        "step-down",
      ],
    },
    "step-down": {
      "excludedVariations": [
        "broad jump",
        "depth jump",
        "lateral",
        "rotational",
        "single-leg",
        "standard",
      ],
    },
    "weighted": {
      "excludedVariations": ["banded", "hurdle"],
    },
    "banded": {
      "excludedVariations": ["hurdle", "weighted"],
    },
    "hurdle": {
      "excludedVariations": ["banded", "weighted"],
    },
  },
};
