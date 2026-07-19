const Map<String, dynamic> clean = {
  "pk": "f0a93b0e-1c2d-4f74-e5a0-2b7d8f1e4c96",
  "name": "Clean",
  "muscleGroups": ["Back"],
  "primaryMuscles": ["gluteus maximus", "hamstrings", "erector spinae"],
  "secondaryMuscles": ["trapezius", "quadriceps femoris", "wrist extensors"],
  "variations": {
    "hang": {
      "excludedVariations": [
        "block",
        "deficit",
        "low-hang",
        "tall clean",
      ],
    },
    "squat": {
      "excludedVariations": [
        "clean pull",
        "clean shrug",
      ],
    },
    "single-arm": {
      "excludedVariations": [
        "clean pull",
        "clean shrug",
        "tall clean",
      ],
    },
    "clean pull": {
      "excludedVariations": [
        "clean shrug",
        "squat",
        "tall clean",
      ],
    },
    "tall clean": {
      "excludedVariations": [
        "block",
        "clean pull",
        "clean shrug",
        "deficit",
        "hang",
        "low-hang",
        "single-arm",
      ],
    },
    "clean shrug": {
      "excludedVariations": [
        "clean pull",
        "squat",
        "tall clean",
      ],
    },
    "low-hang": {
      "excludedVariations": [
        "block",
        "deficit",
        "hang",
        "tall clean",
      ],
    },
    "paused": {
      "excludedVariations": [
        "tall clean",
      ],
    },
    "deficit": {
      "excludedVariations": [
        "block",
        "hang",
        "low-hang",
        "tall clean",
      ],
    },
    "dumbbell": {
      "excludedVariations": ["block", "kettlebell"],
    },
    "kettlebell": {
      "excludedVariations": ["block", "dumbbell"],
    },
    "block": {
      "excludedVariations": [
        "deficit",
        "dumbbell",
        "hang",
        "kettlebell",
        "low-hang",
        "tall clean",
      ],
    },
  },
  "namedVariations": [
    {
      "name": "Hang Clean",
      "variations": ["hang"],
    },
    {
      "name": "Squat Clean",
      "variations": ["squat"],
    },
  ],
};
