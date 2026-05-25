const Map<String, dynamic> wristExtension = {
  "pk": "c7d60e7b-8f9a-4c41-b2d7-9e4a5c8b1f63",
  "name": "Wrist Extension",
  "muscleGroups": ["Arms"],
  "primaryMuscles": ["wrist extensors"],
  "secondaryMuscles": [],
  "variations": {
    "single-arm": {
      "excludedVariations": [
        "barbell",
        "EZ-bar"
      ],
    },
    "seated": {
      "excludedVariations": [
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
        "cable",
        "dumbbell",
        "single-arm"
      ],
    },
    "barbell": {
      "excludedVariations": [
        "band",
        "cable",
        "dumbbell",
        "EZ-bar",
        "single-arm"
      ],
    },
    "dumbbell": {
      "excludedVariations": [
        "band",
        "barbell",
        "cable",
        "EZ-bar"
      ],
    },
    "cable": {
      "excludedVariations": [
        "band",
        "barbell",
        "dumbbell",
        "EZ-bar"
      ],
    },
    "band": {
      "excludedVariations": [
        "barbell",
        "cable",
        "dumbbell",
        "EZ-bar"
      ],
    },
  },
};
