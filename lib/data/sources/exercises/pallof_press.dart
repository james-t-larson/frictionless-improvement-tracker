const Map<String, dynamic> pallofPress = {
  "pk": "c1d04e1c-2f3a-4c85-b6d1-3e8a9c2c5f07",
  "name": "Pallof Press",
  "muscleGroups": ["Core"],
  "primaryMuscles": ["external obliques", "rectus abdominis"],
  "secondaryMuscles": ["anterior deltoid", "erector spinae"],
  "variations": {
    "kneeling": {
      "excludedVariations": [
        "half-kneeling",
        "split-stance",
        "standing",
      ],
    },
    "standing": {
      "excludedVariations": [
        "half-kneeling",
        "kneeling",
        "split-stance",
      ],
    },
    "half-kneeling": {
      "excludedVariations": [
        "kneeling",
        "split-stance",
        "standing",
      ],
    },
    "split-stance": {
      "excludedVariations": [
        "half-kneeling",
        "kneeling",
        "standing",
      ],
    },
    "single-arm": {
      "excludedVariations": [
        "overhead",
      ],
    },
    "overhead": {
      "excludedVariations": [
        "rotation",
        "single-arm",
      ],
    },
    "rotation": {
      "excludedVariations": [
        "isometric",
        "overhead",
      ],
    },
    "isometric": {
      "excludedVariations": [
        "rotation",
      ],
    },
    "cable": {
      "excludedVariations": ["band"],
    },
    "band": {
      "excludedVariations": ["cable"],
    },
  },
};
