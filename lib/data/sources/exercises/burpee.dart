const Map<String, dynamic> burpee = {
  "pk": "7e703b05-364f-4847-af0f-a1a22aab19f6",
  "name": "Burpee",
  "muscleGroups": ["Legs", "Core"],
  "primaryMuscles": [
    "pectoralis major",
    "gluteus maximus",
    "quadriceps femoris",
    "anterior deltoid",
    "lateral deltoid",
  ],
  "secondaryMuscles": ["rectus abdominis", "trapezius"],
  "variations": {
    "single-leg": {
      "excludedVariations": ["half", "no-jump", "pull-up", "push-up", "tuck"],
    },
    "pull-up": {
      "excludedVariations": [
        "half",
        "no-jump",
        "push-up",
        "single-leg",
        "tuck",
      ],
    },
    "no-jump": {
      "excludedVariations": [
        "half",
        "pull-up",
        "push-up",
        "single-leg",
        "tuck",
      ],
    },
    "push-up": {
      "excludedVariations": [
        "half",
        "no-jump",
        "pull-up",
        "single-leg",
        "tuck",
      ],
    },
    "tuck": {
      "excludedVariations": [
        "half",
        "no-jump",
        "pull-up",
        "push-up",
        "single-leg",
      ],
    },
    "half": {
      "excludedVariations": [
        "no-jump",
        "pull-up",
        "push-up",
        "single-leg",
        "tuck",
      ],
    },
    "bosu": {
      "excludedVariations": ["box jump", "dumbbell", "weighted"],
    },
    "weighted": {
      "excludedVariations": ["bosu", "box jump", "dumbbell"],
    },
    "box jump": {
      "excludedVariations": ["bosu", "dumbbell", "weighted"],
    },
    "dumbbell": {
      "excludedVariations": ["bosu", "box jump", "weighted"],
    },
  },
};
