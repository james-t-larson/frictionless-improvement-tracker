const Map<String, dynamic> medicineBallThrow = {
  "pk": "ed36669e-3f5c-411d-8eab-8fb757a21e93",
  "name": "Medicine Ball Throw",
  "muscleGroups": ["Core"],
  "primaryMuscles": ["external obliques"],
  "secondaryMuscles": ["rectus abdominis", "anterior deltoid"],
  "variations": {
    "rotational": {
      "excludedVariations": [
        "chest pass",
        "overhead",
        "scoop toss",
        "side throw",
        "squat throw",
        "wall ball",
      ],
    },
    "overhead": {
      "excludedVariations": [
        "chest pass",
        "rotational",
        "scoop toss",
        "side throw",
        "wall ball",
      ],
    },
    "chest pass": {
      "excludedVariations": [
        "overhead",
        "rotational",
        "scoop toss",
        "side throw",
        "slam",
        "wall ball",
      ],
    },
    "slam": {
      "excludedVariations": [
        "chest pass",
        "scoop toss",
        "side throw",
        "squat throw",
        "wall ball",
      ],
    },
    "wall ball": {
      "excludedVariations": [
        "chest pass",
        "kneeling",
        "overhead",
        "partner",
        "rotational",
        "scoop toss",
        "side throw",
        "slam",
        "squat throw",
      ],
    },
    "squat throw": {
      "excludedVariations": [
        "kneeling",
        "rotational",
        "scoop toss",
        "side throw",
        "slam",
        "wall ball",
      ],
    },
    "kneeling": {
      "excludedVariations": [
        "squat throw",
        "wall ball",
      ],
    },
    "partner": {
      "excludedVariations": [
        "wall ball",
      ],
    },
    "side throw": {
      "excludedVariations": [
        "chest pass",
        "overhead",
        "rotational",
        "scoop toss",
        "slam",
        "squat throw",
        "wall ball",
      ],
    },
    "scoop toss": {
      "excludedVariations": [
        "chest pass",
        "overhead",
        "rotational",
        "side throw",
        "slam",
        "squat throw",
        "wall ball",
      ],
    },
  },
};
