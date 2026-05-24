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
        "Arnold",
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
        "Arnold"
      ],
    },
    "push jerk": {
      "excludedVariations": [
        "strict",
        "push press",
        "split jerk",
        "Arnold",
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
        "Arnold",
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
    "Arnold": {
      "excludedVariations": [
        "strict",
        "push press",
        "push jerk",
        "split jerk",
        "barbell",
        "kettlebell",
        "landmine",
        "pin",
        "Smith machine",
        "machine"
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
        "Arnold",
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
        "Arnold"
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
        "Arnold",
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
        "Arnold"
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
        "Arnold",
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
        "Arnold",
        "standing",
        "Z-press"
      ],
    }
  },
};
