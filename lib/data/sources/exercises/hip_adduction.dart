const Map<String, dynamic> hipAdduction = {
  "pk": "e7f60a7e-8b9c-4e41-d2f7-9a4c5e8f1b63",
  "name": "Hip Adduction",
  "muscleGroups": ["Legs"],
  "primaryMuscles": ["hip adductors"],
  "secondaryMuscles": ["gracilis", "pectineus"],
  "variations": {
    "seated": {
      "excludedVariations": [
        "Copenhagen plank",
        "lying",
        "side-lying",
        "standing",
        "cable"
      ],
    },
    "standing": {
      "excludedVariations": [
        "Copenhagen plank",
        "lying",
        "seated",
        "side-lying",
        "machine"
      ],
    },
    "lying": {
      "excludedVariations": [
        "Copenhagen plank",
        "seated",
        "side-lying",
        "standing",
        "machine",
        "cable"
      ],
    },
    "Copenhagen plank": {
      "excludedVariations": [
        "lying",
        "seated",
        "side-lying",
        "standing",
        "machine",
        "cable",
        "banded"
      ],
    },
    "side-lying": {
      "excludedVariations": [
        "Copenhagen plank",
        "lying",
        "seated",
        "standing",
        "machine"
      ],
    },
    "single-leg": {
      "excludedVariations": [
        "Copenhagen plank", 
        "lying"
      ],
    },
    "machine": {
      "excludedVariations": [
        "banded", 
        "cable",
        "standing",
        "lying",
        "side-lying",
        "Copenhagen plank"
      ],
    },
    "cable": {
      "excludedVariations": [
        "banded", 
        "machine",
        "seated",
        "lying",
        "Copenhagen plank"
      ],
    },
    "banded": {
      "excludedVariations": [
        "cable", 
        "machine",
        "Copenhagen plank"
      ],
    },
  },
  "namedVariations": [
    {
      "name": "Copenhagen Plank",
      "variations": ["Copenhagen plank"],
    },
  ],
};
