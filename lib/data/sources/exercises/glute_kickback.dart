const Map<String, dynamic> gluteKickback = {
  "pk": "dee8ca71-a01b-4ffd-b85e-426080e92f1e",
  "name": "Glute Kickback",
  "muscleGroups": ["Legs"],
  "primaryMuscles": ["gluteus maximus"],
  "secondaryMuscles": ["hamstrings", "hip adductors"],
  "variations": {
    "standing": {
      "excludedVariations": [
        "floor",
        "quadruped",
        "donkey kick",
      ],
    },
    "floor": {
      "excludedVariations": [
        "quadruped",
        "standing",
      ],
    },
    "quadruped": {
      "excludedVariations": [
        "floor",
        "standing",
      ],
    },
    "donkey kick": {
      "excludedVariations": [
        "bent-knee",
        "straight-leg",
        "standing",
      ],
    },
    "straight-leg": {
      "excludedVariations": [
        "bent-knee",
        "donkey kick",
      ],
    },
    "bent-knee": {
      "excludedVariations": [
        "straight-leg",
        "donkey kick",
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
  "namedVariations": [
    {
      "name": "Donkey Kick",
      "variations": ["donkey kick"],
    },
  ],
};
