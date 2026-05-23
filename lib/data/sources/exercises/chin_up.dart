const Map<String, dynamic> chinUp = {
  "pk": "c5d48e5b-6f7a-4c29-b0d5-7e2a3c6b9f41",
  "name": "Chin-Up",
  "muscleGroups": ["Back", "Biceps"],
  "primaryMuscles": ["latissimus dorsi", "biceps brachii"],
  "secondaryMuscles": ["wrist flexors", "posterior deltoid", "infraspinatus"],
  "variations": {
    "bodyweight": {
      "excludedVariations": [
        "L-sit",
        "close-grip",
        "neutral-grip",
        "typewriter",
        "wide-grip",
      ],
    },
    "close-grip": {
      "excludedVariations": [
        "L-sit",
        "bodyweight",
        "neutral-grip",
        "typewriter",
        "wide-grip",
      ],
    },
    "neutral-grip": {
      "excludedVariations": [
        "L-sit",
        "bodyweight",
        "close-grip",
        "typewriter",
        "wide-grip",
      ],
    },
    "wide-grip": {
      "excludedVariations": [
        "L-sit",
        "bodyweight",
        "close-grip",
        "neutral-grip",
        "typewriter",
      ],
    },
    "L-sit": {
      "excludedVariations": [
        "bodyweight",
        "close-grip",
        "neutral-grip",
        "typewriter",
        "wide-grip",
      ],
    },
    "typewriter": {
      "excludedVariations": [
        "L-sit",
        "bodyweight",
        "close-grip",
        "neutral-grip",
        "wide-grip",
      ],
    },
    "weighted": {
      "excludedVariations": [
        "assisted",
        "band-resisted",
        "kipping",
        "ring",
        "supinated",
      ],
    },
    "assisted": {
      "excludedVariations": [
        "band-resisted",
        "kipping",
        "ring",
        "supinated",
        "weighted",
      ],
    },
    "ring": {
      "excludedVariations": [
        "assisted",
        "band-resisted",
        "kipping",
        "supinated",
        "weighted",
      ],
    },
    "band-resisted": {
      "excludedVariations": [
        "assisted",
        "kipping",
        "ring",
        "supinated",
        "weighted",
      ],
    },
    "kipping": {
      "excludedVariations": [
        "assisted",
        "band-resisted",
        "ring",
        "supinated",
        "weighted",
      ],
    },
    "supinated": {
      "excludedVariations": [
        "assisted",
        "band-resisted",
        "kipping",
        "ring",
        "weighted",
      ],
    },
  },
};
