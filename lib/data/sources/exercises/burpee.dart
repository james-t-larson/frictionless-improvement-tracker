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
      "excludedVariations": [
        "box jump", 
        "bosu"
      ],
    },
    "pull-up": {
      "excludedVariations": [
        "no-jump",
        "tuck",
        "box jump",
        "broad jump",
        "lateral",
        "bosu",
        "dumbbell"
      ],
    },
    "no-jump": {
      "excludedVariations": [
        "pull-up",
        "tuck",
        "box jump",
        "broad jump",
        "lateral"
      ],
    },
    "push-up": {
      "excludedVariations": [
        "half"
      ],
    },
    "tuck": {
      "excludedVariations": [
        "no-jump",
        "pull-up",
        "box jump",
        "broad jump",
        "lateral"
      ],
    },
    "half": {
      "excludedVariations": [
        "push-up"
      ],
    },
    "bosu": {
      "excludedVariations": [
        "pull-up",
        "box jump",
        "broad jump",
        "lateral",
        "dumbbell",
        "single-leg"
      ],
    },
    "weighted": {
      "excludedVariations": [],
    },
    "box jump": {
      "excludedVariations": [
        "no-jump",
        "tuck",
        "pull-up",
        "broad jump",
        "lateral",
        "bosu",
        "dumbbell",
        "single-leg"
      ],
    },
    "dumbbell": {
      "excludedVariations": [
        "pull-up",
        "box jump",
        "bosu"
      ],
    },
    "broad jump": {
      "excludedVariations": [
        "no-jump",
        "tuck",
        "pull-up",
        "box jump",
        "lateral",
        "bosu"
      ],
    },
    "lateral": {
      "excludedVariations": [
        "no-jump",
        "tuck",
        "pull-up",
        "box jump",
        "broad jump",
        "bosu"
      ],
    }
  },
};
