const Map<String, dynamic> hipAbduction = {
  "pk": "7e95b8b5-a6eb-41b6-a3c9-ae06a9ba7ac4",
  "name": "Hip Abduction",
  "muscleGroups": ["Legs"],
  "primaryMuscles": ["hip abductors"],
  "secondaryMuscles": ["gluteus maximus"],
  "variations": {
    "single-leg": {
      "excludedVariations": [
        "clamshell",
        "fire hydrant",
        "lying",
        "seated",
        "side-lying",
        "standing",
      ],
    },
    "standing": {
      "excludedVariations": [
        "clamshell",
        "fire hydrant",
        "lying",
        "seated",
        "side-lying",
        "single-leg",
      ],
    },
    "seated": {
      "excludedVariations": [
        "clamshell",
        "fire hydrant",
        "lying",
        "side-lying",
        "single-leg",
        "standing",
      ],
    },
    "lying": {
      "excludedVariations": [
        "clamshell",
        "fire hydrant",
        "seated",
        "side-lying",
        "single-leg",
        "standing",
      ],
    },
    "fire hydrant": {
      "excludedVariations": [
        "clamshell",
        "lying",
        "seated",
        "side-lying",
        "single-leg",
        "standing",
      ],
    },
    "clamshell": {
      "excludedVariations": [
        "fire hydrant",
        "lying",
        "seated",
        "side-lying",
        "single-leg",
        "standing",
      ],
    },
    "side-lying": {
      "excludedVariations": [
        "clamshell",
        "fire hydrant",
        "lying",
        "seated",
        "single-leg",
        "standing",
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
