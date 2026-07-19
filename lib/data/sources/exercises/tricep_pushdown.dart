const Map<String, dynamic> tricepPushdown = {
  "pk": "edb21df1-0a7a-49f8-94e3-fa47138af935",
  "name": "Tricep Pushdown",
  "muscleGroups": ["Arms"],
  "primaryMuscles": ["triceps brachii"],
  "secondaryMuscles": [],
  "variations": {
    "single-arm": {
      "excludedVariations": [
        "wide-grip",
        "close-grip",
        "bar",
        "v-bar",
        "rope"
      ],
    },
    "standing": {
      "excludedVariations": ["kneeling"],
    },
    "kneeling": {
      "excludedVariations": ["standing"],
    },
    "wide-grip": {
      "excludedVariations": [
        "close-grip",
        "single-arm",
        "rope",
        "v-bar",
        "neutral-grip"
      ],
    },
    "close-grip": {
      "excludedVariations": [
        "wide-grip",
        "single-arm",
        "rope",
        "v-bar"
      ],
    },
    "neutral-grip": {
      "excludedVariations": [
        "overhand-grip",
        "underhand-grip",
        "bar",
        "wide-grip"
      ],
    },
    "overhand-grip": {
      "excludedVariations": ["neutral-grip", "underhand-grip"],
    },
    "underhand-grip": {
      "excludedVariations": [
        "neutral-grip",
        "overhand-grip",
        "rope",
        "v-bar"
      ],
    },
    "bar": {
      "excludedVariations": [
        "rope",
        "v-bar",
        "neutral-grip",
        "single-arm"
      ],
    },
    "v-bar": {
      "excludedVariations": [
        "bar",
        "rope",
        "wide-grip",
        "close-grip",
        "single-arm",
        "underhand-grip"
      ],
    },
    "rope": {
      "excludedVariations": [
        "bar",
        "v-bar",
        "wide-grip",
        "close-grip",
        "single-arm",
        "underhand-grip"
      ],
    },
    "cable": {
      "excludedVariations": ["band"],
    },
    "band": {
      "excludedVariations": ["cable"],
    },
  },
  "namedVariations": [
    {
      "name": "Rope Pushdown",
      "variations": ["rope"],
      "aliases": ["Rope Tricep Pushdown"],
    },
  ],
};
