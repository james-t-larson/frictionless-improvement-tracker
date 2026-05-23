const Map<String, dynamic> landmineRotation = {
  "pk": "a5b48c50-6d7e-4a29-f0b5-7c2e3a6a9d41",
  "name": "Landmine Rotation",
  "muscleGroups": ["Core", "Shoulders"],
  "primaryMuscles": ["external obliques"],
  "secondaryMuscles": [
    "rectus abdominis",
    "anterior deltoid",
    "erector spinae",
  ],
  "variations": {
    "standing": {
      "excludedVariations": [
        "half-kneeling",
        "kneeling",
      ],
    },
    "kneeling": {
      "excludedVariations": [
        "half-kneeling",
        "rotational push-press",
        "standing",
      ],
    },
    "half-kneeling": {
      "excludedVariations": [
        "kneeling",
        "rotational push-press",
        "standing",
      ],
    },
    "single-arm": {
      "excludedVariations": [
        "bilateral",
      ],
    },
    "bilateral": {
      "excludedVariations": [
        "rotational push-press",
        "single-arm",
      ],
    },
    "chop": {
      "excludedVariations": [
        "lift",
        "rotational push-press",
      ],
    },
    "lift": {
      "excludedVariations": [
        "chop",
        "rotational push-press",
      ],
    },
    "rotational push-press": {
      "excludedVariations": [
        "bilateral",
        "chop",
        "half-kneeling",
        "kneeling",
        "lift",
      ],
    },
  },
};
