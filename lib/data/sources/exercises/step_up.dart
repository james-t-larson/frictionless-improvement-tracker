const Map<String, dynamic> stepUp = {
  "pk": "f2a15b28-3c4d-4f96-e7a2-4b9d0f3e6c18",
  "name": "Step-Up",
  "muscleGroups": ["Legs"],
  "primaryMuscles": ["gluteus maximus", "quadriceps femoris"],
  "secondaryMuscles": ["hamstrings", "gastrocnemius"],
  "variations": {
    "bodyweight": {
      "excludedVariations": [
        "barbell",
        "dumbbell",
        "goblet",
        "kettlebell",
        "weighted vest"
      ],
    },
    "lateral": {
      "excludedVariations": [
        "crossover"
      ],
    },
    "crossover": {
      "excludedVariations": [
        "explosive",
        "lateral"
      ],
    },
    "explosive": {
      "excludedVariations": [
        "barbell",
        "crossover",
        "paused"
      ],
    },
    "paused": {
      "excludedVariations": [
        "explosive"
      ],
    },
    "dumbbell": {
      "excludedVariations": [
        "barbell",
        "bodyweight",
        "goblet",
        "kettlebell",
        "weighted vest"
      ],
    },
    "barbell": {
      "excludedVariations": [
        "bodyweight",
        "dumbbell",
        "explosive",
        "goblet",
        "kettlebell",
        "weighted vest"
      ],
    },
    "weighted vest": {
      "excludedVariations": [
        "barbell",
        "bodyweight",
        "dumbbell",
        "goblet",
        "kettlebell"
      ],
    },
    "kettlebell": {
      "excludedVariations": [
        "barbell",
        "bodyweight",
        "dumbbell",
        "goblet",
        "weighted vest"
      ],
    },
    "goblet": {
      "excludedVariations": [
        "barbell",
        "bodyweight",
        "dumbbell",
        "kettlebell",
        "weighted vest"
      ],
    },
  },
};
