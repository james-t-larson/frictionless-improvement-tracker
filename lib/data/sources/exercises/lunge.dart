const Map<String, dynamic> lunge = {
  "pk": "dce6d67f-877e-4595-9277-3a3f0f19dc46",
  "name": "Lunge",
  "muscleGroups": ["Legs"],
  "primaryMuscles": ["gluteus maximus", "quadriceps femoris", "hip adductors"],
  "secondaryMuscles": ["gastrocnemius"],
  "variations": {
    "walking": {
      "excludedVariations": [
        "bulgarian",
        "curtsy",
        "deficit",
        "front",
        "reverse",
        "side",
        "split"
      ],
    },
    "reverse": {
      "excludedVariations": [
        "bulgarian",
        "curtsy",
        "front",
        "side",
        "split",
        "walking"
      ],
    },
    "side": {
      "excludedVariations": [
        "bulgarian",
        "curtsy",
        "deficit",
        "front",
        "reverse",
        "split",
        "walking"
      ],
    },
    "curtsy": {
      "excludedVariations": [
        "bulgarian",
        "front",
        "reverse",
        "side",
        "split",
        "walking"
      ],
    },
    "front": {
      "excludedVariations": [
        "bulgarian",
        "curtsy",
        "reverse",
        "side",
        "split",
        "walking"
      ],
    },
    "split": {
      "excludedVariations": [
        "bulgarian",
        "curtsy",
        "front",
        "reverse",
        "side",
        "walking"
      ],
    },
    "bulgarian": {
      "excludedVariations": [
        "curtsy",
        "front",
        "reverse",
        "side",
        "split",
        "walking"
      ],
    },
    "deficit": {
      "excludedVariations": [
        "explosive",
        "side",
        "walking"
      ],
    },
    "paused": {
      "excludedVariations": [
        "explosive",
        "tempo"
      ],
    },
    "tempo": {
      "excludedVariations": [
        "explosive",
        "paused"
      ],
    },
    "overhead": {
      "excludedVariations": [
        "explosive",
        "suitcase"
      ],
    },
    "suitcase": {
      "excludedVariations": [
        "barbell",
        "explosive",
        "goblet",
        "overhead"
      ],
    },
    "explosive": {
      "excludedVariations": [
        "deficit",
        "overhead",
        "paused",
        "suitcase",
        "tempo"
      ],
    },
    "dumbbell": {
      "excludedVariations": [
        "banded",
        "barbell",
        "goblet",
        "kettlebell"
      ],
    },
    "barbell": {
      "excludedVariations": [
        "banded",
        "dumbbell",
        "goblet",
        "kettlebell",
        "suitcase"
      ],
    },
    "goblet": {
      "excludedVariations": [
        "banded",
        "barbell",
        "dumbbell",
        "kettlebell",
        "suitcase"
      ],
    },
    "kettlebell": {
      "excludedVariations": [
        "banded",
        "barbell",
        "dumbbell",
        "goblet"
      ],
    },
    "banded": {
      "excludedVariations": [
        "barbell",
        "dumbbell",
        "goblet",
        "kettlebell",
        "weighted vest"
      ],
    },
    "weighted vest": {
      "excludedVariations": [
        "banded"
      ],
    },
  },
  "namedVariations": [
    {
      "name": "Walking Lunge",
      "variations": ["walking"],
    },
    {
      "name": "Reverse Lunge",
      "variations": ["reverse"],
    },
    {
      "name": "Curtsy Lunge",
      "variations": ["curtsy"],
    },
    {
      "name": "Side Lunge",
      "variations": ["side"],
      "aliases": ["Lateral Lunge"],
    },
  ],
};
