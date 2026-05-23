const Map<String, dynamic> snatch = {
  "pk": "e9f82a9d-0b1c-4e63-d4f9-1a6c7e0d3b85",
  "name": "Snatch",
  "muscleGroups": ["Back"],
  "primaryMuscles": ["gluteus maximus", "hamstrings", "erector spinae"],
  "secondaryMuscles": [
    "trapezius",
    "anterior deltoid",
    "quadriceps femoris",
    "wrist extensors",
  ],
  "variations": {
    "hang": {
      "excludedVariations": [
        "drop snatch",
        "muscle snatch",
        "overhead squat",
        "paused",
        "power",
        "snatch balance",
        "squat",
        "wide-grip",
      ],
    },
    "power": {
      "excludedVariations": [
        "drop snatch",
        "hang",
        "muscle snatch",
        "overhead squat",
        "paused",
        "snatch balance",
        "squat",
        "wide-grip",
      ],
    },
    "squat": {
      "excludedVariations": [
        "drop snatch",
        "hang",
        "muscle snatch",
        "overhead squat",
        "paused",
        "power",
        "snatch balance",
        "wide-grip",
      ],
    },
    "muscle snatch": {
      "excludedVariations": [
        "drop snatch",
        "hang",
        "overhead squat",
        "paused",
        "power",
        "snatch balance",
        "squat",
        "wide-grip",
      ],
    },
    "overhead squat": {
      "excludedVariations": [
        "drop snatch",
        "hang",
        "muscle snatch",
        "paused",
        "power",
        "snatch balance",
        "squat",
        "wide-grip",
      ],
    },
    "snatch balance": {
      "excludedVariations": [
        "drop snatch",
        "hang",
        "muscle snatch",
        "overhead squat",
        "paused",
        "power",
        "squat",
        "wide-grip",
      ],
    },
    "drop snatch": {
      "excludedVariations": [
        "hang",
        "muscle snatch",
        "overhead squat",
        "paused",
        "power",
        "snatch balance",
        "squat",
        "wide-grip",
      ],
    },
    "paused": {
      "excludedVariations": [
        "drop snatch",
        "hang",
        "muscle snatch",
        "overhead squat",
        "power",
        "snatch balance",
        "squat",
        "wide-grip",
      ],
    },
    "wide-grip": {
      "excludedVariations": [
        "drop snatch",
        "hang",
        "muscle snatch",
        "overhead squat",
        "paused",
        "power",
        "snatch balance",
        "squat",
      ],
    },
    "barbell": {
      "excludedVariations": ["block", "dumbbell", "kettlebell"],
    },
    "dumbbell": {
      "excludedVariations": ["barbell", "block", "kettlebell"],
    },
    "kettlebell": {
      "excludedVariations": ["barbell", "block", "dumbbell"],
    },
    "block": {
      "excludedVariations": ["barbell", "dumbbell", "kettlebell"],
    },
  },
};
