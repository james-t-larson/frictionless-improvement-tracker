const Map<String, dynamic> legExtension = {
  "pk": "47d61f40-0743-47af-95a5-545a6a9a4824",
  "name": "Leg Extension",
  "muscleGroups": ["Legs"],
  "primaryMuscles": ["quadriceps femoris"],
  "secondaryMuscles": [],
  "variations": {
    "single-leg": {
      "excludedVariations": [
        "sissy squat"
      ],
    },
    "seated": {
      "excludedVariations": [
        "lying",
        "sissy squat"
      ],
    },
    "lying": {
      "excludedVariations": [
        "seated",
        "sissy squat"
      ],
    },
    "sissy squat": {
      "excludedVariations": [
        "lying",
        "seated",
        "single-leg",
        "machine",
        "cable"
      ],
    },
    "tempo": {
      "excludedVariations": [
        "paused"
      ],
    },
    "paused": {
      "excludedVariations": [
        "tempo"
      ],
    },
    "machine": {
      "excludedVariations": [
        "band", 
        "cable",
        "sissy squat"
      ],
    },
    "cable": {
      "excludedVariations": [
        "band", 
        "machine",
        "sissy squat"
      ],
    },
    "band": {
      "excludedVariations": [
        "cable", 
        "machine"
      ],
    },
  },
};
