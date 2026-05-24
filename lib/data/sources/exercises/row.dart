const Map<String, dynamic> row = {
  "pk": "a40205d6-396c-4c0b-a4b9-8ffbef49ed32",
  "name": "Row",
  "muscleGroups": ["Back"],
  "primaryMuscles": ["latissimus dorsi", "posterior deltoid", "trapezius"],
  "secondaryMuscles": [
    "biceps brachii",
    "wrist flexors",
    "erector spinae",
    "infraspinatus",
    "subscapularis",
  ],
  "variations": {
    "t-bar": {
      "excludedVariations": ["dumbbell", "barbell", "cable", "ring", "kroc", "pendlay", "yates", "seated"],
    },
    "pendlay": {
      "excludedVariations": [
        "chest-supported",
        "seated",
        "kroc",
        "yates",
        "t-bar",
        "cable",
        "machine",
        "ring",
        "landmine"
      ],
    },
    "chest-supported": {
      "excludedVariations": ["pendlay", "yates", "kroc", "standing"],
    },
    "seated": {
      "excludedVariations": ["standing", "pendlay", "yates", "kroc", "t-bar"],
    },
    "standing": {
      "excludedVariations": ["seated", "chest-supported"],
    },
    "single-arm": {
      "excludedVariations": ["yates"],
    },
    "wide-grip": {
      "excludedVariations": ["close-grip"],
    },
    "close-grip": {
      "excludedVariations": ["wide-grip"],
    },
    "neutral-grip": {
      "excludedVariations": ["overhand", "underhand"],
    },
    "overhand": {
      "excludedVariations": ["underhand", "neutral-grip"],
    },
    "underhand": {
      "excludedVariations": ["overhand", "neutral-grip"],
    },
    "kroc": {
      "excludedVariations": [
        "barbell",
        "cable",
        "machine",
        "landmine",
        "ring",
        "t-bar",
        "seated",
        "chest-supported",
        "pendlay",
        "yates",
        "pause"
      ],
    },
    "yates": {
      "excludedVariations": [
        "dumbbell",
        "cable",
        "machine",
        "landmine",
        "ring",
        "t-bar",
        "seated",
        "chest-supported",
        "pendlay",
        "kroc",
        "single-arm"
      ],
    },
    "pause": {
      "excludedVariations": ["kroc"],
    },
    "dumbbell": {
      "excludedVariations": ["barbell", "cable", "landmine", "machine", "ring", "t-bar", "yates", "pendlay"],
    },
    "barbell": {
      "excludedVariations": ["dumbbell", "cable", "landmine", "machine", "ring", "kroc", "t-bar"],
    },
    "cable": {
      "excludedVariations": ["barbell", "dumbbell", "landmine", "machine", "ring", "kroc", "yates", "pendlay", "t-bar"],
    },
    "machine": {
      "excludedVariations": ["barbell", "cable", "dumbbell", "landmine", "ring", "kroc", "yates", "pendlay"],
    },
    "landmine": {
      "excludedVariations": ["barbell", "cable", "dumbbell", "machine", "ring", "kroc", "yates", "pendlay"],
    },
    "ring": {
      "excludedVariations": ["barbell", "cable", "dumbbell", "landmine", "machine", "kroc", "yates", "pendlay", "t-bar", "chest-supported"],
    },
  },
};
