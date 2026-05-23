const Map<String, dynamic> nordicCurl = {
  "pk": "d4c96e3f-8a1b-4d72-c3e9-2f5a7b0d4c68",
  "name": "Nordic Curl",
  "muscleGroups": ["Legs"],
  "primaryMuscles": ["hamstrings"],
  "secondaryMuscles": ["gluteus maximus", "gastrocnemius"],
  "variations": {
    "bodyweight": {
      "excludedVariations": ["GHD", "eccentric", "feet-anchored"],
    },
    "eccentric": {
      "excludedVariations": ["GHD", "bodyweight", "feet-anchored"],
    },
    "GHD": {
      "excludedVariations": ["bodyweight", "eccentric", "feet-anchored"],
    },
    "feet-anchored": {
      "excludedVariations": ["GHD", "bodyweight", "eccentric"],
    },
    "weighted": {
      "excludedVariations": ["band-assisted", "machine", "partner-assisted"],
    },
    "partner-assisted": {
      "excludedVariations": ["band-assisted", "machine", "weighted"],
    },
    "machine": {
      "excludedVariations": ["band-assisted", "partner-assisted", "weighted"],
    },
    "band-assisted": {
      "excludedVariations": ["machine", "partner-assisted", "weighted"],
    },
  },
};
