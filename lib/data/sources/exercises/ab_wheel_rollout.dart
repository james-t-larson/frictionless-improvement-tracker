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
      "excludedVariations": ["feet-elevated", "pike", "standing"],
    },
    "standing": {
      "excludedVariations": ["feet-elevated", "kneeling", "pike"],
    },
    "feet-elevated": {
      "excludedVariations": ["kneeling", "standing", "pike"],
    },
    "pike": {
      "excludedVariations": ["kneeling", "standing", "feet-elevated", "weighted", "band-assisted", "single-arm", "twisting"],
    },
    "single-arm": {
      "excludedVariations": ["pike"],
    },
    "twisting": {
      "excludedVariations": ["pike"],
    },
    "barbell": {
      "excludedVariations": ["band-assisted", "weighted"],
    },
    "band-assisted": {
      "excludedVariations": ["barbell", "weighted", "pike"],
    },
    "weighted": {
      "excludedVariations": ["band-assisted", "barbell", "pike"],
    },
    "ramp": {
      "excludedVariations": ["kneeling", "feet-elevated", "pike"],
    },
  },
};
