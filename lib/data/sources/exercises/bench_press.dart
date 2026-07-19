const Map<String, dynamic> benchPress = {
  "pk": "23cf1e36-69e0-424b-8403-fc4e30de15da",
  "name": "Bench Press",
  "muscleGroups": ["Chest"],
  "primaryMuscles": ["pectoralis major", "anterior deltoid"],
  "secondaryMuscles": ["triceps brachii"],
  "variations": {
    "incline": {
      "excludedVariations": [
        "decline",
      ],
    },
    "decline": {
      "excludedVariations": [
        "incline",
        "larsen",
      ],
    },
    "close-grip": {
      "excludedVariations": [
        "wide-grip",
      ],
    },
    "wide-grip": {
      "excludedVariations": [
        "close-grip",
      ],
    },
    "underhand-grip (supinated)": {
      "excludedVariations": [
        "neutral-grip (semi-pronated)",
        "swiss bar",
      ],
    },
    "neutral-grip (semi-pronated)": {
      "excludedVariations": [
        "underhand-grip (supinated)",
        "barbell",
        "axle bar",
        "smith machine",
      ],
    },
    "larsen": {
      "excludedVariations": [
        "decline",
      ],
    },
    "paused": {
      "excludedVariations": [
        "spoto",
        "touch-and-go",
        "tempo",
      ],
    },
    "spoto": {
      "excludedVariations": [
        "paused",
        "touch-and-go",
        "tempo",
        "pin",
      ],
    },
    "touch-and-go": {
      "excludedVariations": [
        "paused",
        "spoto",
        "tempo",
        "pin",
      ],
    },
    "tempo": {
      "excludedVariations": [
        "paused",
        "spoto",
        "touch-and-go",
      ],
    },
    "barbell": {
      "excludedVariations": [
        "dumbbell",
        "smith machine",
        "axle bar",
        "swiss bar",
        "cable",
        "single-arm",
        "alternating",
        "neutral-grip (semi-pronated)",
      ],
    },
    "dumbbell": {
      "excludedVariations": [
        "barbell",
        "smith machine",
        "axle bar",
        "swiss bar",
        "cable",
        "pin",
      ],
    },
    "smith machine": {
      "excludedVariations": [
        "barbell",
        "dumbbell",
        "axle bar",
        "swiss bar",
        "cable",
        "single-arm",
        "alternating",
        "neutral-grip (semi-pronated)",
      ],
    },
    "axle bar": {
      "excludedVariations": [
        "barbell",
        "dumbbell",
        "smith machine",
        "swiss bar",
        "cable",
        "single-arm",
        "alternating",
        "neutral-grip (semi-pronated)",
      ],
    },
    "swiss bar": {
      "excludedVariations": [
        "barbell",
        "dumbbell",
        "smith machine",
        "axle bar",
        "cable",
        "underhand-grip (supinated)",
        "single-arm",
        "alternating",
      ],
    },
    "cable": {
      "excludedVariations": [
        "barbell",
        "dumbbell",
        "smith machine",
        "axle bar",
        "swiss bar",
        "pin",
        "slingshot",
        "banded",
      ],
    },
    "pin": {
      "excludedVariations": [
        "spoto",
        "touch-and-go",
        "dumbbell",
        "cable",
        "single-arm",
        "alternating",
      ],
    },
    "slingshot": {
      "excludedVariations": [
        "cable",
        "single-arm",
        "alternating",
      ],
    },
    "banded": {
      "excludedVariations": [
        "cable",
      ],
    },
    "single-arm": {
      "excludedVariations": [
        "alternating",
        "barbell",
        "smith machine",
        "axle bar",
        "swiss bar",
        "pin",
        "slingshot",
      ],
    },
    "alternating": {
      "excludedVariations": [
        "single-arm",
        "barbell",
        "smith machine",
        "axle bar",
        "swiss bar",
        "pin",
        "slingshot",
      ],
    },
  },
  "namedVariations": [
    {
      "name": "Incline Bench Press",
      "variations": ["incline"],
    },
    {
      "name": "Decline Bench Press",
      "variations": ["decline"],
    },
    {
      "name": "Close-Grip Bench Press",
      "variations": ["close-grip"],
    },
    {
      "name": "Wide-Grip Bench Press",
      "variations": ["wide-grip"],
    },
    {
      "name": "Dumbbell Bench Press",
      "variations": ["dumbbell"],
      "aliases": ["Dumbbell Chest Press"],
    },
    {
      "name": "Incline Dumbbell Press",
      "variations": ["incline", "dumbbell"],
    },
    {
      "name": "Paused Bench Press",
      "variations": ["paused"],
    },
    {
      "name": "Smith Machine Bench Press",
      "variations": ["smith machine"],
    },
    {
      "name": "Larsen Press",
      "variations": ["larsen"],
    },
    {
      "name": "Spoto Press",
      "variations": ["spoto"],
    },
  ],
};
