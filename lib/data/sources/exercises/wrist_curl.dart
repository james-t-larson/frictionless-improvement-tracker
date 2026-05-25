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
        "barbell",
        "behind-the-back"
      ],
    },
    "behind-the-back": {
      "excludedVariations": [
        "EZ-bar",
        "band",
        "dumbbell",
        "pronated",
        "reverse",
        "seated",
        "single-arm"
      ],
    },
    "seated": {
      "excludedVariations": [
        "behind-the-back",
        "standing"
      ],
    },
    "standing": {
      "excludedVariations": [
        "seated"
      ],
    },
    "EZ-bar": {
      "excludedVariations": [
        "band",
        "barbell",
        "behind-the-back",
        "cable",
        "dumbbell",
        "single-arm"
      ],
    },
    "reverse": {
      "excludedVariations": [
        "behind-the-back",
        "pronated"
      ],
    },
    "pronated": {
      "excludedVariations": [
        "behind-the-back",
        "reverse"
      ],
    },
    "barbell": {
      "excludedVariations": [
        "EZ-bar",
        "band",
        "cable",
        "dumbbell",
        "single-arm"
      ],
    },
    "dumbbell": {
      "excludedVariations": [
        "EZ-bar",
        "band",
        "barbell",
        "behind-the-back",
        "cable"
      ],
    },
    "cable": {
      "excludedVariations": [
        "EZ-bar",
        "band",
        "barbell",
        "dumbbell"
      ],
    },
    "band": {
      "excludedVariations": [
        "EZ-bar",
        "barbell",
        "behind-the-back",
        "cable",
        "dumbbell"
      ],
    },
  },
};
