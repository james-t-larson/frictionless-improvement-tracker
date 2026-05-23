const Map<String, dynamic> legCurl = {
  "pk": "a3b26c39-4d5e-4a07-f8b3-5c0e1a4f7d29",
  "name": "Leg Curl",
  "muscleGroups": ["Legs"],
  "primaryMuscles": ["hamstrings"],
  "secondaryMuscles": ["gastrocnemius", "gluteus maximus"],
  "variations": {
    "single-leg": {
      "excludedVariations": ["nordic", "paused", "prone", "standing", "tempo"],
    },
    "nordic": {
      "excludedVariations": [
        "paused",
        "prone",
        "single-leg",
        "standing",
        "tempo",
      ],
    },
    "prone": {
      "excludedVariations": [
        "nordic",
        "paused",
        "single-leg",
        "standing",
        "tempo",
      ],
    },
    "standing": {
      "excludedVariations": [
        "nordic",
        "paused",
        "prone",
        "single-leg",
        "tempo",
      ],
    },
    "paused": {
      "excludedVariations": [
        "nordic",
        "prone",
        "single-leg",
        "standing",
        "tempo",
      ],
    },
    "tempo": {
      "excludedVariations": [
        "nordic",
        "paused",
        "prone",
        "single-leg",
        "standing",
      ],
    },
    "lying machine": {
      "excludedVariations": [
        "band",
        "cable",
        "dumbbell",
        "seated machine",
        "slider",
        "stability ball",
      ],
    },
    "seated machine": {
      "excludedVariations": [
        "band",
        "cable",
        "dumbbell",
        "lying machine",
        "slider",
        "stability ball",
      ],
    },
    "cable": {
      "excludedVariations": [
        "band",
        "dumbbell",
        "lying machine",
        "seated machine",
        "slider",
        "stability ball",
      ],
    },
    "dumbbell": {
      "excludedVariations": [
        "band",
        "cable",
        "lying machine",
        "seated machine",
        "slider",
        "stability ball",
      ],
    },
    "band": {
      "excludedVariations": [
        "cable",
        "dumbbell",
        "lying machine",
        "seated machine",
        "slider",
        "stability ball",
      ],
    },
    "slider": {
      "excludedVariations": [
        "band",
        "cable",
        "dumbbell",
        "lying machine",
        "seated machine",
        "stability ball",
      ],
    },
    "stability ball": {
      "excludedVariations": [
        "band",
        "cable",
        "dumbbell",
        "lying machine",
        "seated machine",
        "slider",
      ],
    },
  },
};
