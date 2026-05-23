const Map<String, dynamic> reverseHyperextension = {
  "pk": "c7d60e52-8f9a-4c41-b2d7-9e4a5c8c1f63",
  "name": "Reverse Hyperextension",
  "muscleGroups": ["Legs", "Back"],
  "primaryMuscles": ["gluteus maximus", "hamstrings", "erector spinae"],
  "secondaryMuscles": [],
  "variations": {
    "GHD": {
      "excludedVariations": ["hip extension", "single-leg"],
    },
    "single-leg": {
      "excludedVariations": ["GHD", "hip extension"],
    },
    "hip extension": {
      "excludedVariations": ["GHD", "single-leg"],
    },
    "machine": {
      "excludedVariations": [
        "banded",
        "flat bench",
        "parallel bars",
        "swiss ball",
        "weighted",
      ],
    },
    "flat bench": {
      "excludedVariations": [
        "banded",
        "machine",
        "parallel bars",
        "swiss ball",
        "weighted",
      ],
    },
    "weighted": {
      "excludedVariations": [
        "banded",
        "flat bench",
        "machine",
        "parallel bars",
        "swiss ball",
      ],
    },
    "banded": {
      "excludedVariations": [
        "flat bench",
        "machine",
        "parallel bars",
        "swiss ball",
        "weighted",
      ],
    },
    "swiss ball": {
      "excludedVariations": [
        "banded",
        "flat bench",
        "machine",
        "parallel bars",
        "weighted",
      ],
    },
    "parallel bars": {
      "excludedVariations": [
        "banded",
        "flat bench",
        "machine",
        "swiss ball",
        "weighted",
      ],
    },
  },
};
