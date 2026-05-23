const Map<String, dynamic> hipAdduction = {
  "pk": "e7f60a7e-8b9c-4e41-d2f7-9a4c5e8f1b63",
  "name": "Hip Adduction",
  "muscleGroups": ["Legs"],
  "primaryMuscles": ["hip adductors"],
  "secondaryMuscles": ["gluteus maximus"],
  "variations": {
    "seated": {
      "excludedVariations": [
        "Copenhagen plank",
        "lying",
        "side-lying",
        "single-leg",
        "standing",
      ],
    },
    "standing": {
      "excludedVariations": [
        "Copenhagen plank",
        "lying",
        "seated",
        "side-lying",
        "single-leg",
      ],
    },
    "lying": {
      "excludedVariations": [
        "Copenhagen plank",
        "seated",
        "side-lying",
        "single-leg",
        "standing",
      ],
    },
    "Copenhagen plank": {
      "excludedVariations": [
        "lying",
        "seated",
        "side-lying",
        "single-leg",
        "standing",
      ],
    },
    "side-lying": {
      "excludedVariations": [
        "Copenhagen plank",
        "lying",
        "seated",
        "single-leg",
        "standing",
      ],
    },
    "single-leg": {
      "excludedVariations": [
        "Copenhagen plank",
        "lying",
        "seated",
        "side-lying",
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
