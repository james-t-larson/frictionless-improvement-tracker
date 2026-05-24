const Map<String, dynamic> plank = {
  "pk": "a06410b6-c871-45c0-aee5-db6df750f494",
  "name": "Plank",
  "muscleGroups": ["Core"],
  "primaryMuscles": ["rectus abdominis", "erector spinae"],
  "secondaryMuscles": ["external obliques", "anterior deltoid"],
  "variations": {
    "forearm": {
      "excludedVariations": [
        "hands",
      ],
    },
    "hands": {
      "excludedVariations": [
        "forearm",
        "RKC",
        "stir the pot",
      ],
    },
    "side": {
      "excludedVariations": [
        "reverse",
        "RKC",
        "long-lever",
        "stir the pot",
      ],
    },
    "single-leg": {
      "excludedVariations": [
        "RKC",
        "kneeling",
      ],
    },
    "RKC": {
      "excludedVariations": [
        "hands",
        "side",
        "reverse",
        "single-leg",
        "reach",
        "long-lever",
        "stir the pot",
        "kneeling",
        "decline",
      ],
    },
    "reach": {
      "excludedVariations": [
        "RKC",
        "reverse",
        "stir the pot",
      ],
    },
    "reverse": {
      "excludedVariations": [
        "side",
        "RKC",
        "reach",
        "long-lever",
        "stir the pot",
        "kneeling",
        "decline",
      ],
    },
    "long-lever": {
      "excludedVariations": [
        "side",
        "reverse",
        "RKC",
        "stir the pot",
        "kneeling",
      ],
    },
    "stir the pot": {
      "excludedVariations": [
        "hands",
        "side",
        "reverse",
        "RKC",
        "reach",
        "long-lever",
        "weighted",
        "kneeling",
        "decline",
      ],
    },
    "kneeling": {
      "excludedVariations": [
        "single-leg",
        "RKC",
        "reverse",
        "long-lever",
        "stir the pot",
        "decline",
      ],
    },
    "decline": {
      "excludedVariations": [
        "RKC",
        "reverse",
        "stir the pot",
        "kneeling",
      ],
    },
    "weighted": {
      "excludedVariations": ["band", "bosu", "stir the pot"],
    },
    "bosu": {
      "excludedVariations": ["band", "weighted"],
    },
    "band": {
      "excludedVariations": ["bosu", "weighted"],
    },
  },
};
