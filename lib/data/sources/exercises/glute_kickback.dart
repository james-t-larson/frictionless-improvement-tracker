const Map<String, dynamic> gluteKickback = {
  "pk": "dee8ca71-a01b-4ffd-b85e-426080e92f1e",
  "name": "Glute Kickback",
  "muscleGroups": ["Legs"],
  "primaryMuscles": ["gluteus maximus"],
  "secondaryMuscles": ["hamstrings", "hip adductors"],
  "variations": {
    "single-leg": {
      "excludedVariations": [
        "bent-knee",
        "donkey kick",
        "floor",
        "quadruped",
        "straight-leg",
      ],
    },
    "floor": {
      "excludedVariations": [
        "bent-knee",
        "donkey kick",
        "quadruped",
        "single-leg",
        "straight-leg",
      ],
    },
    "donkey kick": {
      "excludedVariations": [
        "bent-knee",
        "floor",
        "quadruped",
        "single-leg",
        "straight-leg",
      ],
    },
    "quadruped": {
      "excludedVariations": [
        "bent-knee",
        "donkey kick",
        "floor",
        "single-leg",
        "straight-leg",
      ],
    },
    "straight-leg": {
      "excludedVariations": [
        "bent-knee",
        "donkey kick",
        "floor",
        "quadruped",
        "single-leg",
      ],
    },
    "bent-knee": {
      "excludedVariations": [
        "donkey kick",
        "floor",
        "quadruped",
        "single-leg",
        "straight-leg",
      ],
    },
    "machine": {
      "excludedVariations": ["banded", "cable"],
    },
    "cable": {
      "excludedVariations": ["banded", "machine"],
    },
    "banded": {
      "excludedVariations": ["cable", "machine"],
    },
  },
};
