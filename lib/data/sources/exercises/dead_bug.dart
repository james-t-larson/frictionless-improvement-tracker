const Map<String, dynamic> deadBug = {
  "pk": "b0c93d0b-1e2f-4b74-a5c0-2d7f8b1b4e96",
  "name": "Dead Bug",
  "muscleGroups": ["Core"],
  "primaryMuscles": ["rectus abdominis"],
  "secondaryMuscles": ["external obliques", "erector spinae"],
  "variations": {
    "bodyweight": {
      "excludedVariations": ["contralateral", "single-arm", "single-leg"],
    },
    "single-arm": {
      "excludedVariations": ["bodyweight", "contralateral", "single-leg"],
    },
    "single-leg": {
      "excludedVariations": ["bodyweight", "contralateral", "single-arm"],
    },
    "contralateral": {
      "excludedVariations": ["bodyweight", "single-arm", "single-leg"],
    },
    "weighted": {
      "excludedVariations": ["band", "dumbbell", "stability ball"],
    },
    "band": {
      "excludedVariations": ["dumbbell", "stability ball", "weighted"],
    },
    "stability ball": {
      "excludedVariations": ["band", "dumbbell", "weighted"],
    },
    "dumbbell": {
      "excludedVariations": ["band", "stability ball", "weighted"],
    },
  },
};
