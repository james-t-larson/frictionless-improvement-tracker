const Map<String, dynamic> legExtension = {
  "pk": "47d61f40-0743-47af-95a5-545a6a9a4824",
  "name": "Leg Extension",
  "muscleGroups": ["Legs"],
  "primaryMuscles": ["quadriceps femoris"],
  "secondaryMuscles": [],
  "variations": {
    "single-leg": {
      "excludedVariations": [
        "lying",
        "paused",
        "seated",
        "sissy squat",
        "tempo",
      ],
    },
    "seated": {
      "excludedVariations": [
        "lying",
        "paused",
        "single-leg",
        "sissy squat",
        "tempo",
      ],
    },
    "lying": {
      "excludedVariations": [
        "paused",
        "seated",
        "single-leg",
        "sissy squat",
        "tempo",
      ],
    },
    "sissy squat": {
      "excludedVariations": [
        "lying",
        "paused",
        "seated",
        "single-leg",
        "tempo",
      ],
    },
    "tempo": {
      "excludedVariations": [
        "lying",
        "paused",
        "seated",
        "single-leg",
        "sissy squat",
      ],
    },
    "paused": {
      "excludedVariations": [
        "lying",
        "seated",
        "single-leg",
        "sissy squat",
        "tempo",
      ],
    },
    "machine": {
      "excludedVariations": ["band", "cable"],
    },
    "cable": {
      "excludedVariations": ["band", "machine"],
    },
    "band": {
      "excludedVariations": ["cable", "machine"],
    },
  },
};
