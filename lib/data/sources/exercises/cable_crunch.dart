const Map<String, dynamic> cableCrunch = {
  "pk": "b6c59d51-7e8f-4b30-a1c6-8d3f4b7b0e52",
  "name": "Cable Crunch",
  "muscleGroups": ["Core"],
  "primaryMuscles": ["rectus abdominis"],
  "secondaryMuscles": ["external obliques"],
  "variations": {
    "kneeling": {
      "excludedVariations": [
        "lying",
        "reverse",
        "seated",
        "standing",
      ],
    },
    "standing": {
      "excludedVariations": [
        "kneeling",
        "lying",
        "reverse",
        "seated",
      ],
    },
    "seated": {
      "excludedVariations": [
        "kneeling",
        "lying",
        "reverse",
        "standing",
      ],
    },
    "lying": {
      "excludedVariations": [
        "kneeling",
        "seated",
        "standing",
      ],
    },
    "single-arm": {
      "excludedVariations": [
        "reverse",
      ],
    },
    "oblique": {
      "excludedVariations": [],
    },
    "reverse": {
      "excludedVariations": [
        "kneeling",
        "seated",
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
