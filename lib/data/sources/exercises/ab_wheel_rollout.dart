const Map<String, dynamic> abWheelRollout = {
  "pk": "d2e15f2d-3a4b-4d96-c7e2-4f9b0d3d6a18",
  "name": "Ab Wheel Rollout",
  "muscleGroups": ["Core"],
  "primaryMuscles": ["rectus abdominis"],
  "secondaryMuscles": [
    "external obliques",
    "erector spinae",
    "anterior deltoid",
  ],
  "variations": {
    "kneeling": {
      "excludedVariations": ["feet-elevated", "pike", "single-arm", "standing"],
    },
    "standing": {
      "excludedVariations": ["feet-elevated", "kneeling", "pike", "single-arm"],
    },
    "single-arm": {
      "excludedVariations": ["feet-elevated", "kneeling", "pike", "standing"],
    },
    "pike": {
      "excludedVariations": [
        "feet-elevated",
        "kneeling",
        "single-arm",
        "standing",
      ],
    },
    "feet-elevated": {
      "excludedVariations": ["kneeling", "pike", "single-arm", "standing"],
    },
    "barbell": {
      "excludedVariations": ["band-assisted", "weighted"],
    },
    "band-assisted": {
      "excludedVariations": ["barbell", "weighted"],
    },
    "weighted": {
      "excludedVariations": ["band-assisted", "barbell"],
    },
  },
};
