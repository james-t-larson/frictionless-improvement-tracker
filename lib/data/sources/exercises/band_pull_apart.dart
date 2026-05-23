const Map<String, dynamic> bandPullApart = {
  "pk": "d0e93f0c-1a2b-4d74-c5e0-2f7a8d1e4f96",
  "name": "Band Pull-Apart",
  "muscleGroups": ["Shoulders"],
  "primaryMuscles": ["posterior deltoid", "infraspinatus"],
  "secondaryMuscles": ["trapezius", "lateral deltoid"],
  "variations": {
    "overhand": {
      "excludedVariations": [
        "chest-level",
        "narrow-grip",
        "overhead",
        "single-arm",
        "underhand",
        "wide-grip",
      ],
    },
    "underhand": {
      "excludedVariations": [
        "chest-level",
        "narrow-grip",
        "overhand",
        "overhead",
        "single-arm",
        "wide-grip",
      ],
    },
    "wide-grip": {
      "excludedVariations": [
        "chest-level",
        "narrow-grip",
        "overhand",
        "overhead",
        "single-arm",
        "underhand",
      ],
    },
    "narrow-grip": {
      "excludedVariations": [
        "chest-level",
        "overhand",
        "overhead",
        "single-arm",
        "underhand",
        "wide-grip",
      ],
    },
    "chest-level": {
      "excludedVariations": [
        "narrow-grip",
        "overhand",
        "overhead",
        "single-arm",
        "underhand",
        "wide-grip",
      ],
    },
    "overhead": {
      "excludedVariations": [
        "chest-level",
        "narrow-grip",
        "overhand",
        "single-arm",
        "underhand",
        "wide-grip",
      ],
    },
    "single-arm": {
      "excludedVariations": [
        "chest-level",
        "narrow-grip",
        "overhand",
        "overhead",
        "underhand",
        "wide-grip",
      ],
    },
  },
};
