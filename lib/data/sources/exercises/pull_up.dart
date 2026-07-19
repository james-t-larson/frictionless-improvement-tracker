const Map<String, dynamic> pullUp = {
  "pk": "1232d6bd-1b97-4c14-b8e6-de4a40cae8db",
  "name": "Pull-Up",
  "muscleGroups": ["Back"],
  "primaryMuscles": ["latissimus dorsi"],
  "secondaryMuscles": [
    "biceps brachii",
    "wrist flexors",
    "infraspinatus",
    "posterior deltoid",
  ],
  "variations": {
    "bodyweight": {
      "excludedVariations": ["assisted", "weighted"],
    },
    "weighted": {
      "excludedVariations": ["assisted", "bodyweight"],
    },
    "assisted": {
      "excludedVariations": ["bodyweight", "weighted"],
    },
    "neutral-grip": {
      "excludedVariations": [
        "archer",
        "close-grip",
        "commando",
        "typewriter",
        "wide-grip",
      ],
    },
    "wide-grip": {
      "excludedVariations": ["close-grip", "commando", "neutral-grip"],
    },
    "close-grip": {
      "excludedVariations": [
        "archer",
        "commando",
        "neutral-grip",
        "typewriter",
        "wide-grip",
      ],
    },
    "commando": {
      "excludedVariations": [
        "archer",
        "close-grip",
        "neutral-grip",
        "ring",
        "typewriter",
        "wide-grip",
      ],
    },
    "butterfly": {
      "excludedVariations": ["L-sit", "archer", "kipping", "typewriter"],
    },
    "kipping": {
      "excludedVariations": ["L-sit", "archer", "butterfly", "typewriter"],
    },
    "archer": {
      "excludedVariations": [
        "L-sit",
        "butterfly",
        "close-grip",
        "commando",
        "kipping",
        "neutral-grip",
        "typewriter",
      ],
    },
    "L-sit": {
      "excludedVariations": ["archer", "butterfly", "kipping", "typewriter"],
    },
    "typewriter": {
      "excludedVariations": [
        "L-sit",
        "archer",
        "butterfly",
        "close-grip",
        "commando",
        "kipping",
        "neutral-grip",
      ],
    },
    "ring": {
      "excludedVariations": ["commando", "towel"],
    },
    "towel": {
      "excludedVariations": ["ring"],
    },
  },
  "namedVariations": [
    {
      "name": "Weighted Pull-Up",
      "variations": ["weighted"],
    },
    {
      "name": "Wide-Grip Pull-Up",
      "variations": ["wide-grip"],
    },
    {
      "name": "Neutral-Grip Pull-Up",
      "variations": ["neutral-grip"],
    },
    {
      "name": "Kipping Pull-Up",
      "variations": ["kipping"],
    },
  ],
};
