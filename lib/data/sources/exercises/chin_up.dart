const Map<String, dynamic> chinUp = {
  "pk": "c5d48e5b-6f7a-4c29-b0d5-7e2a3c6b9f41",
  "name": "Chin-Up",
  "muscleGroups": ["Back", "Arms"],
  "primaryMuscles": ["latissimus dorsi", "biceps brachii"],
  "secondaryMuscles": ["wrist flexors", "posterior deltoid", "infraspinatus"],
  "variations": {
    "bodyweight": {
      "excludedVariations": [
        "weighted",
        "assisted",
        "band-resisted",
      ],
    },
    "close-grip": {
      "excludedVariations": [
        "neutral-grip",
        "ring",
      ],
    },
    "neutral-grip": {
      "excludedVariations": [
        "close-grip",
        "ring",
      ],
    },
    "L-sit": {
      "excludedVariations": [
        "assisted",
        "kipping",
      ],
    },
    "weighted": {
      "excludedVariations": [
        "bodyweight",
        "assisted",
        "band-resisted",
        "kipping",
      ],
    },
    "assisted": {
      "excludedVariations": [
        "bodyweight",
        "weighted",
        "band-resisted",
        "kipping",
        "L-sit",
        "negative",
      ],
    },
    "ring": {
      "excludedVariations": [
        "close-grip",
        "neutral-grip",
      ],
    },
    "band-resisted": {
      "excludedVariations": [
        "bodyweight",
        "weighted",
        "assisted",
        "kipping",
      ],
    },
    "kipping": {
      "excludedVariations": [
        "weighted",
        "assisted",
        "band-resisted",
        "L-sit",
        "negative",
      ],
    },
    "negative": {
      "excludedVariations": [
        "assisted",
        "kipping",
      ],
    },
  },
};
