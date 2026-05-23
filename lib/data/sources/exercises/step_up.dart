const Map<String, dynamic> stepUp = {
  "pk": "f2a15b28-3c4d-4f96-e7a2-4b9d0f3e6c18",
  "name": "Step-Up",
  "muscleGroups": ["Legs"],
  "primaryMuscles": ["gluteus maximus", "quadriceps femoris"],
  "secondaryMuscles": ["hamstrings", "gastrocnemius"],
  "variations": {
    "bodyweight": {
      "excludedVariations": [
        "Bulgarian",
        "crossover",
        "deficit",
        "explosive",
        "lateral",
        "paused",
        "single-leg",
      ],
    },
    "lateral": {
      "excludedVariations": [
        "Bulgarian",
        "bodyweight",
        "crossover",
        "deficit",
        "explosive",
        "paused",
        "single-leg",
      ],
    },
    "single-leg": {
      "excludedVariations": [
        "Bulgarian",
        "bodyweight",
        "crossover",
        "deficit",
        "explosive",
        "lateral",
        "paused",
      ],
    },
    "crossover": {
      "excludedVariations": [
        "Bulgarian",
        "bodyweight",
        "deficit",
        "explosive",
        "lateral",
        "paused",
        "single-leg",
      ],
    },
    "explosive": {
      "excludedVariations": [
        "Bulgarian",
        "bodyweight",
        "crossover",
        "deficit",
        "lateral",
        "paused",
        "single-leg",
      ],
    },
    "deficit": {
      "excludedVariations": [
        "Bulgarian",
        "bodyweight",
        "crossover",
        "explosive",
        "lateral",
        "paused",
        "single-leg",
      ],
    },
    "Bulgarian": {
      "excludedVariations": [
        "bodyweight",
        "crossover",
        "deficit",
        "explosive",
        "lateral",
        "paused",
        "single-leg",
      ],
    },
    "paused": {
      "excludedVariations": [
        "Bulgarian",
        "bodyweight",
        "crossover",
        "deficit",
        "explosive",
        "lateral",
        "single-leg",
      ],
    },
    "dumbbell": {
      "excludedVariations": [
        "barbell",
        "goblet",
        "kettlebell",
        "weighted vest",
      ],
    },
    "barbell": {
      "excludedVariations": [
        "dumbbell",
        "goblet",
        "kettlebell",
        "weighted vest",
      ],
    },
    "weighted vest": {
      "excludedVariations": ["barbell", "dumbbell", "goblet", "kettlebell"],
    },
    "kettlebell": {
      "excludedVariations": ["barbell", "dumbbell", "goblet", "weighted vest"],
    },
    "goblet": {
      "excludedVariations": [
        "barbell",
        "dumbbell",
        "kettlebell",
        "weighted vest",
      ],
    },
  },
};
