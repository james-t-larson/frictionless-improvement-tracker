const Map<String, dynamic> overheadPress = {
  "pk": "a3f7c812-1d45-4b89-93c0-7e2d4f6a1b85",
  "name": "Overhead Press",
  "muscleGroups": ["Shoulders"],
  "primaryMuscles": ["anterior deltoid", "lateral deltoid"],
  "secondaryMuscles": ["triceps brachii", "trapezius", "subscapularis"],
  "variations": {
    "push press": {
      "excludedVariations": [
        "strict",
        "push jerk",
        "split jerk",
        "seated",
        "Z-press",
        "machine"
      ],
    },
    "strict": {
      "excludedVariations": [
        "push press",
        "push jerk",
        "split jerk",
      ],
    },
    "push jerk": {
      "excludedVariations": [
        "strict",
        "push press",
        "split jerk",
        "seated",
        "Z-press",
        "machine",
        "Smith machine"
      ],
    },
    "split jerk": {
      "excludedVariations": [
        "strict",
        "push press",
        "push jerk",
        "seated",
        "Z-press",
        "single-arm",
        "alternating",
        "dumbbell",
        "kettlebell",
        "machine",
        "Smith machine",
        "landmine",
        "pin"
      ],
    },
    "seated": {
      "excludedVariations": [
        "standing",
        "Z-press",
        "push press",
        "push jerk",
        "split jerk"
      ],
    },
    "standing": {
      "excludedVariations": [
        "seated",
        "Z-press",
        "machine"
      ],
    },
    "Z-press": {
      "excludedVariations": [
        "standing",
        "seated",
        "push press",
        "push jerk",
        "split jerk",
        "machine",
        "Smith machine"
      ],
    },
    "single-arm": {
      "excludedVariations": [
        "alternating",
        "barbell",
        "Smith machine",
        "machine",
        "pin",
        "split jerk"
      ],
    },
    "alternating": {
      "excludedVariations": [
        "single-arm",
        "barbell",
        "Smith machine",
        "machine",
        "pin",
        "landmine",
        "split jerk"
      ],
    },
    "paused": {
      "excludedVariations": [],
    },
    "pin": {
      "excludedVariations": [
        "dumbbell",
        "kettlebell",
        "landmine",
        "machine",
        "single-arm",
        "alternating",
        "split jerk"
      ],
    },
    "barbell": {
      "excludedVariations": [
        "dumbbell",
        "kettlebell",
        "landmine",
        "Smith machine",
        "machine",
        "single-arm",
        "alternating",
      ],
    },
    "dumbbell": {
      "excludedVariations": [
        "barbell",
        "kettlebell",
        "landmine",
        "Smith machine",
        "machine",
        "pin",
        "split jerk"
      ],
    },
    "kettlebell": {
      "excludedVariations": [
        "barbell",
        "dumbbell",
        "landmine",
        "Smith machine",
        "machine",
        "pin",
        "split jerk"
      ],
    },
    "landmine": {
      "excludedVariations": [
        "barbell",
        "dumbbell",
        "kettlebell",
        "Smith machine",
        "machine",
        "pin",
        "alternating",
        "split jerk",
      ],
    },
    "Smith machine": {
      "excludedVariations": [
        "barbell",
        "dumbbell",
        "kettlebell",
        "landmine",
        "machine",
        "single-arm",
        "alternating",
        "push jerk",
        "split jerk",
        "Z-press"
      ],
    },
    "machine": {
      "excludedVariations": [
        "barbell",
        "dumbbell",
        "kettlebell",
        "landmine",
        "Smith machine",
        "pin",
        "single-arm",
        "alternating",
        "push press",
        "push jerk",
        "split jerk",
        "standing",
        "Z-press"
      ],
    }
  },
  "namedVariations": [
    {
      "name": "Push Press",
      "variations": ["push press"],
    },
    {
      "name": "Military Press",
      "variations": ["strict", "standing"],
    },
    {
      "name": "Z-Press",
      "variations": ["Z-press"],
    },
    {
      "name": "Push Jerk",
      "variations": ["push jerk"],
    },
    {
      "name": "Split Jerk",
      "variations": ["split jerk"],
    },
  ],
};
