const Map<String, dynamic> cableCrunch = {
  "pk": "b6c59d51-7e8f-4b30-a1c6-8d3f4b7b0e52",
  "name": "Cable Crunch",
  "muscleGroups": ["Core"],
  "primaryMuscles": ["rectus abdominis"],
  "secondaryMuscles": ["external obliques"],
  "variations": {
    "kneeling": {
      "excludedVariations": [
        "oblique",
        "reverse",
        "seated",
        "side-lying",
        "single-arm",
        "standing",
      ],
    },
    "standing": {
      "excludedVariations": [
        "kneeling",
        "oblique",
        "reverse",
        "seated",
        "side-lying",
        "single-arm",
      ],
    },
    "single-arm": {
      "excludedVariations": [
        "kneeling",
        "oblique",
        "reverse",
        "seated",
        "side-lying",
        "standing",
      ],
    },
    "oblique": {
      "excludedVariations": [
        "kneeling",
        "reverse",
        "seated",
        "side-lying",
        "single-arm",
        "standing",
      ],
    },
    "reverse": {
      "excludedVariations": [
        "kneeling",
        "oblique",
        "seated",
        "side-lying",
        "single-arm",
        "standing",
      ],
    },
    "side-lying": {
      "excludedVariations": [
        "kneeling",
        "oblique",
        "reverse",
        "seated",
        "single-arm",
        "standing",
      ],
    },
    "seated": {
      "excludedVariations": [
        "kneeling",
        "oblique",
        "reverse",
        "side-lying",
        "single-arm",
        "standing",
      ],
    },
    "rope": {
      "excludedVariations": ["band"],
    },
    "band": {
      "excludedVariations": ["rope"],
    },
  },
};
