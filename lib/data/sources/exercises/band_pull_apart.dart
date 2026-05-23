const Map<String, dynamic> bandPullApart = {
  "pk": "d0e93f0c-1a2b-4d74-c5e0-2f7a8d1e4f96",
  "name": "Band Pull-Apart",
  "muscleGroups": ["Shoulders"],
  "primaryMuscles": ["posterior deltoid", "infraspinatus"],
  "secondaryMuscles": ["trapezius", "lateral deltoid"],
  "variations": {
    "overhand": {
      "excludedVariations": [
        "underhand",
      ],
    },
    "underhand": {
      "excludedVariations": [
        "overhand",
      ],
    },
    "chest-level": {
      "excludedVariations": [
        "overhead",
        "diagonal",
      ],
    },
    "overhead": {
      "excludedVariations": [
        "chest-level",
        "diagonal",
      ],
    },
    "diagonal": {
      "excludedVariations": [
        "chest-level",
        "overhead",
      ],
    },
    "single-arm": {
      "excludedVariations": [],
    },
    "supine": {
      "excludedVariations": [
        "seated",
        "bent-over",
      ],
    },
    "seated": {
      "excludedVariations": [
        "supine",
        "bent-over",
      ],
    },
    "bent-over": {
      "excludedVariations": [
        "supine",
        "seated",
      ],
    },
  },
};
