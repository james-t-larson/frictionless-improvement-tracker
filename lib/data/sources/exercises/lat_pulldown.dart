const Map<String, dynamic> latPulldown = {
  "pk": "a189b026-3641-426f-b9a2-d32678ccb99f",
  "name": "Lat Pulldown",
  "muscleGroups": ["Back"],
  "primaryMuscles": ["latissimus dorsi"],
  "secondaryMuscles": ["infraspinatus", "subscapularis", "posterior deltoid"],
  "variations": {
    "straight arm": {
      "excludedVariations": [
        "underhand-grip"
      ],
    },
    "single-arm": {
      "excludedVariations": [
        "wide-grip",
        "close-grip",
        "bar",
        "rope"
      ],
    },
    "seated": {
      "excludedVariations": [
        "standing",
        "kneeling"
      ],
    },
    "standing": {
      "excludedVariations": [
        "seated",
        "kneeling"
      ],
    },
    "kneeling": {
      "excludedVariations": [
        "seated",
        "standing"
      ],
    },
    "wide-grip": {
      "excludedVariations": [
        "close-grip",
        "single-arm",
        "rope"
      ],
    },
    "close-grip": {
      "excludedVariations": [
        "wide-grip",
        "single-arm"
      ],
    },
    "neutral-grip": {
      "excludedVariations": [
        "overhand-grip",
        "underhand-grip"
      ],
    },
    "overhand-grip": {
      "excludedVariations": [
        "underhand-grip",
        "neutral-grip"
      ],
    },
    "underhand-grip": {
      "excludedVariations": [
        "overhand-grip",
        "neutral-grip",
        "straight arm",
        "rope"
      ],
    },
    "bar": {
      "excludedVariations": [
        "rope",
        "single-arm"
      ],
    },
    "cable": {
      "excludedVariations": [
        "band"
      ],
    },
    "band": {
      "excludedVariations": [
        "cable"
      ],
    },
    "rope": {
      "excludedVariations": [
        "bar",
        "single-arm",
        "wide-grip",
        "underhand-grip"
      ],
    }
  },
  "namedVariations": [
    {
      "name": "Wide-Grip Lat Pulldown",
      "variations": ["wide-grip"],
    },
    {
      "name": "Close-Grip Lat Pulldown",
      "variations": ["close-grip"],
    },
    {
      "name": "Straight-Arm Pulldown",
      "variations": ["straight arm"],
    },
  ],
};
