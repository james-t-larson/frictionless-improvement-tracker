const Map<String, dynamic> nordicCurl = {
  "pk": "d4c96e3f-8a1b-4d72-c3e9-2f5a7b0d4c68",
  "name": "Nordic Curl",
  "muscleGroups": ["Legs"],
  "primaryMuscles": ["hamstrings"],
  "secondaryMuscles": ["gluteus maximus", "gastrocnemius"],
  "variations": {
    "bodyweight": {
      "excludedVariations": ["band-assisted", "weighted"],
    },
    "eccentric": {
      "excludedVariations": [],
    },
    "GHD": {
      "excludedVariations": ["machine", "partner-assisted"],
    },
    "weighted": {
      "excludedVariations": ["band-assisted", "bodyweight"],
    },
    "partner-assisted": {
      "excludedVariations": ["GHD", "machine"],
    },
    "machine": {
      "excludedVariations": ["GHD", "partner-assisted"],
    },
    "band-assisted": {
      "excludedVariations": ["bodyweight", "weighted"],
    },
  },
};
