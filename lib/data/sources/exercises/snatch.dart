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
        "block",
        "drop snatch",
        "overhead squat",
        "snatch balance"
      ],
    },
    "power": {
      "excludedVariations": [
        "drop snatch",
        "muscle snatch",
        "overhead squat",
        "snatch balance",
        "squat"
      ],
    },
    "squat": {
      "excludedVariations": [
        "drop snatch",
        "muscle snatch",
        "overhead squat",
        "power",
        "snatch balance"
      ],
    },
    "muscle snatch": {
      "excludedVariations": [
        "drop snatch",
        "overhead squat",
        "power",
        "snatch balance",
        "squat"
      ],
    },
    "overhead squat": {
      "excludedVariations": [
        "block",
        "drop snatch",
        "hang",
        "muscle snatch",
        "power",
        "snatch balance",
        "squat"
      ],
    },
    "snatch balance": {
      "excludedVariations": [
        "block",
        "drop snatch",
        "dumbbell",
        "hang",
        "kettlebell",
        "muscle snatch",
        "overhead squat",
        "power",
        "squat"
      ],
    },
    "drop snatch": {
      "excludedVariations": [
        "block",
        "dumbbell",
        "hang",
        "kettlebell",
        "muscle snatch",
        "overhead squat",
        "power",
        "snatch balance",
        "squat"
      ],
    },
    "paused": {
      "excludedVariations": [
        "drop snatch",
        "snatch balance"
      ],
    },
    "barbell": {
      "excludedVariations": [
        "dumbbell",
        "kettlebell"
      ],
    },
    "dumbbell": {
      "excludedVariations": [
        "barbell",
        "block",
        "drop snatch",
        "kettlebell",
        "overhead squat",
        "snatch balance"
      ],
    },
    "kettlebell": {
      "excludedVariations": [
        "barbell",
        "block",
        "drop snatch",
        "dumbbell",
        "overhead squat",
        "paused",
        "snatch balance"
      ],
    },
    "block": {
      "excludedVariations": [
        "drop snatch",
        "dumbbell",
        "hang",
        "kettlebell",
        "overhead squat",
        "snatch balance"
      ],
    },
  },
  "namedVariations": [
    {
      "name": "Power Snatch",
      "variations": ["power"],
    },
    {
      "name": "Hang Snatch",
      "variations": ["hang"],
    },
    {
      "name": "Muscle Snatch",
      "variations": ["muscle snatch"],
    },
    {
      "name": "Snatch Balance",
      "variations": ["snatch balance"],
    },
  ],
};
