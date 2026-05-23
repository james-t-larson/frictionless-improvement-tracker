const Map<String, dynamic> deadBug = {
  "pk": "b0c93d0b-1e2f-4b74-a5c0-2d7f8b1b4e96",
  "name": "Dead Bug",
  "muscleGroups": ["Core"],
  "primaryMuscles": ["rectus abdominis"],
  "secondaryMuscles": ["external obliques", "erector spinae"],
  "variations": {
    "bodyweight": {
      "excludedVariations": ["band", "dumbbell", "kettlebell", "medicine ball", "stability ball"],
    },
    "band": {
      "excludedVariations": ["bodyweight", "dumbbell", "kettlebell", "medicine ball", "stability ball"],
    },
    "dumbbell": {
      "excludedVariations": ["band", "bodyweight", "kettlebell", "medicine ball", "stability ball"],
    },
    "kettlebell": {
      "excludedVariations": ["band", "bodyweight", "dumbbell", "medicine ball", "stability ball"],
    },
    "medicine ball": {
      "excludedVariations": ["band", "bodyweight", "dumbbell", "kettlebell", "stability ball"],
    },
    "stability ball": {
      "excludedVariations": ["band", "bodyweight", "dumbbell", "kettlebell", "medicine ball"],
    },
    "contralateral": {
      "excludedVariations": ["double-leg", "ipsilateral", "single-arm", "single-leg"],
    },
    "ipsilateral": {
      "excludedVariations": ["contralateral", "double-leg", "single-arm", "single-leg"],
    },
    "single-arm": {
      "excludedVariations": ["contralateral", "double-leg", "ipsilateral", "single-leg"],
    },
    "single-leg": {
      "excludedVariations": ["contralateral", "double-leg", "ipsilateral", "single-arm"],
    },
    "double-leg": {
      "excludedVariations": ["contralateral", "ipsilateral", "single-arm", "single-leg"],
    },
  },
};
