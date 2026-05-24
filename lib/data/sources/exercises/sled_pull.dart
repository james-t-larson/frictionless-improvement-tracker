const Map<String, dynamic> sledPull = {
  "pk": "e9f82a54-0b1c-4e63-d4f9-1a6c7e0e3b85",
  "name": "Sled Pull",
  "muscleGroups": ["Legs"],
  "primaryMuscles": ["hamstrings", "gluteus maximus"],
  "secondaryMuscles": ["erector spinae", "wrist flexors"],
  "variations": {
    "strap": {
      "excludedVariations": [
        "rope",
        "hip harness",
      ],
    },
    "rope": {
      "excludedVariations": [
        "strap",
        "hip harness",
      ],
    },
    "hip harness": {
      "excludedVariations": [
        "strap",
        "rope",
        "single-arm",
        "seated",
      ],
    },
    "walking": {
      "excludedVariations": [
        "sprinting",
        "backward drag",
        "lateral drag",
        "seated",
      ],
    },
    "sprinting": {
      "excludedVariations": [
        "walking",
        "backward drag",
        "lateral drag",
        "seated",
      ],
    },
    "backward drag": {
      "excludedVariations": [
        "walking",
        "sprinting",
        "lateral drag",
        "seated",
      ],
    },
    "lateral drag": {
      "excludedVariations": [
        "walking",
        "sprinting",
        "backward drag",
        "seated",
      ],
    },
    "seated": {
      "excludedVariations": [
        "walking",
        "sprinting",
        "backward drag",
        "lateral drag",
        "hip harness",
