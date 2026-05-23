const Map<String, dynamic> wristCurl = {
  "pk": "f1c844bd-28c8-4191-9b2a-d0233e6941e1",
  "name": "Wrist Curl",
  "muscleGroups": ["Arms"],
  "primaryMuscles": ["wrist flexors"],
  "secondaryMuscles": [],
  "variations": {
    "single-arm": {
      "excludedVariations": [
        "EZ-bar",
        "behind-the-back",
        "pronated",
        "reverse",
        "seated",
        "standing",
      ],
    },
    "behind-the-back": {
      "excludedVariations": [
        "EZ-bar",
        "pronated",
        "reverse",
        "seated",
        "single-arm",
        "standing",
      ],
    },
    "seated": {
      "excludedVariations": [
        "EZ-bar",
        "behind-the-back",
        "pronated",
        "reverse",
        "single-arm",
        "standing",
      ],
    },
    "standing": {
      "excludedVariations": [
        "EZ-bar",
        "behind-the-back",
        "pronated",
        "reverse",
        "seated",
        "single-arm",
      ],
    },
    "EZ-bar": {
      "excludedVariations": [
        "behind-the-back",
        "pronated",
        "reverse",
        "seated",
        "single-arm",
        "standing",
      ],
    },
    "reverse": {
      "excludedVariations": [
        "EZ-bar",
        "behind-the-back",
        "pronated",
        "seated",
        "single-arm",
        "standing",
      ],
    },
    "pronated": {
      "excludedVariations": [
        "EZ-bar",
        "behind-the-back",
        "reverse",
        "seated",
        "single-arm",
        "standing",
      ],
    },
    "barbell": {
      "excludedVariations": ["band", "cable", "dumbbell"],
    },
    "dumbbell": {
      "excludedVariations": ["band", "barbell", "cable"],
    },
    "cable": {
      "excludedVariations": ["band", "barbell", "dumbbell"],
    },
    "band": {
      "excludedVariations": ["barbell", "cable", "dumbbell"],
    },
  },
};
