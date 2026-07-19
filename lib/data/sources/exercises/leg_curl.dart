const Map<String, dynamic> legCurl = {
  "pk": "a3b26c39-4d5e-4a07-f8b3-5c0e1a4f7d29",
  "name": "Leg Curl",
  "muscleGroups": ["Legs"],
  "primaryMuscles": ["hamstrings"],
  "secondaryMuscles": ["gastrocnemius", "gluteus maximus"],
  "variations": {
    "single-leg": {
      "excludedVariations": ["nordic"],
    },
    "prone": {
      "excludedVariations": [
        "seated machine",
        "slider",
        "stability ball",
        "standing",
        "suspension",
      ],
    },
    "standing": {
      "excludedVariations": [
        "dumbbell",
        "lying machine",
        "prone",
        "seated machine",
        "slider",
        "stability ball",
        "suspension",
      ],
    },
    "paused": {
      "excludedVariations": ["tempo"],
    },
    "tempo": {
      "excludedVariations": ["paused"],
    },
    "lying machine": {
      "excludedVariations": [
        "band",
        "cable",
        "dumbbell",
        "seated machine",
        "slider",
        "stability ball",
        "standing",
        "suspension",
      ],
    },
    "seated machine": {
      "excludedVariations": [
        "band",
        "cable",
        "dumbbell",
        "lying machine",
        "prone",
        "slider",
        "stability ball",
        "standing",
        "suspension",
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
        "suspension",
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
        "standing",
        "suspension",
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
        "suspension",
      ],
    },
    "slider": {
      "excludedVariations": [
        "band",
        "cable",
        "dumbbell",
        "lying machine",
        "prone",
        "seated machine",
        "stability ball",
        "standing",
        "suspension",
      ],
    },
    "stability ball": {
      "excludedVariations": [
        "band",
        "cable",
        "dumbbell",
        "lying machine",
        "prone",
        "seated machine",
        "slider",
        "standing",
        "suspension",
      ],
    },
    "suspension": {
      "excludedVariations": [
        "band",
        "cable",
        "dumbbell",
        "lying machine",
        "prone",
        "seated machine",
        "slider",
        "stability ball",
        "standing",
      ],
    },
  },
  "namedVariations": [
    {
      "name": "Lying Leg Curl",
      "variations": ["lying machine"],
    },
    {
      "name": "Seated Leg Curl",
      "variations": ["seated machine"],
    },
    {
      "name": "Standing Leg Curl",
      "variations": ["standing"],
    },
  ],
};
