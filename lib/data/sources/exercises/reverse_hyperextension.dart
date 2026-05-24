const Map<String, dynamic> reverseHyperextension = {
  "pk": "c7d60e52-8f9a-4c41-b2d7-9e4a5c8c1f63",
  "name": "Reverse Hyperextension",
  "muscleGroups": ["Legs", "Back"],
  "primaryMuscles": ["gluteus maximus", "hamstrings", "erector spinae"],
  "secondaryMuscles": [],
  "variations": {
    "GHD": {
      "excludedVariations": ["flat bench", "machine", "swiss ball"],
    },
    "single-leg": {
      "excludedVariations": [],
    },
    "machine": {
      "excludedVariations": ["GHD", "flat bench", "swiss ball"],
    },
    "flat bench": {
      "excludedVariations": ["GHD", "machine", "swiss ball"],
    },
    "weighted": {
      "excludedVariations": [],
    },
    "banded": {
      "excludedVariations": [],
    },
    "swiss ball": {
      "excludedVariations": ["GHD", "flat bench", "machine"],
    },
  },
};
