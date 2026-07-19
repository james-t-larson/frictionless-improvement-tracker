const Map<String, dynamic> shoulderPress = {
  "pk": "64c75731-36c2-45ae-b8c1-c8b481f34144",
  "name": "Shoulder Press",
  "muscleGroups": ["Shoulders"],
  "primaryMuscles": ["anterior deltoid"],
  "secondaryMuscles": ["lateral deltoid", "triceps brachii"],
  "variations": {
    "single-arm": {
      "excludedVariations": [
        "alternating",
        "barbell",
        "smith machine",
        "pin"
      ],
    },
    "seated": {
      "excludedVariations": [
        "standing",
        "push press"
      ],
    },
    "standing": {
      "excludedVariations": [
        "seated"
      ],
    },
    "push press": {
      "excludedVariations": [
        "seated",
        "machine",
        "pin"
      ],
    },
    "paused": {
      "excludedVariations": [
        "pin"
      ],
    },
    "alternating": {
      "excludedVariations": [
        "single-arm",
        "barbell",
        "smith machine",
        "pin"
      ],
    },
    "dumbbell": {
      "excludedVariations": [
        "barbell",
        "cable",
        "kettlebell",
        "machine",
        "pin",
        "smith machine"
      ],
    },
    "barbell": {
      "excludedVariations": [
        "cable",
        "dumbbell",
        "kettlebell",
        "machine",
        "smith machine",
        "alternating",
        "single-arm",
      ],
    },
    "smith machine": {
      "excludedVariations": [
        "barbell",
        "cable",
        "dumbbell",
        "kettlebell",
        "machine",
        "alternating",
        "single-arm",
      ],
    },
    "machine": {
      "excludedVariations": [
        "barbell",
        "cable",
        "dumbbell",
        "kettlebell",
        "pin",
        "smith machine",
        "push press",
      ],
    },
    "kettlebell": {
      "excludedVariations": [
        "barbell",
        "cable",
        "dumbbell",
        "machine",
        "pin",
        "smith machine"
      ],
    },
    "pin": {
      "excludedVariations": [
        "dumbbell",
        "cable",
        "kettlebell",
        "machine",
        "alternating",
        "single-arm",
        "push press",
        "paused",
      ],
    },
    "cable": {
      "excludedVariations": [
        "barbell",
        "dumbbell",
        "kettlebell",
        "machine",
        "pin",
        "smith machine",
      ],
    },
  },
  "namedVariations": [
    {
      "name": "Dumbbell Shoulder Press",
      "variations": ["dumbbell"],
    },
    {
      "name": "Seated Dumbbell Shoulder Press",
      "variations": ["seated", "dumbbell"],
    },
  ],
};
