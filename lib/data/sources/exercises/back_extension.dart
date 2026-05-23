const Map<String, dynamic> backExtension = {
  "pk": "328b8330-4a04-4f43-a255-f17cba659635",
  "name": "Back Extension",
  "muscleGroups": ["Back", "Glutes"],
  "primaryMuscles": ["gluteus maximus", "hamstrings", "erector spinae"],
  "secondaryMuscles": ["rectus abdominis"],
  "variations": {
    "floor": {
      "excludedVariations": ["45-degree", "GHD", "reverse", "single-leg"],
    },
    "single-leg": {
      "excludedVariations": ["45-degree", "GHD", "floor", "reverse"],
    },
    "45-degree": {
      "excludedVariations": ["GHD", "floor", "reverse", "single-leg"],
    },
    "GHD": {
      "excludedVariations": ["45-degree", "floor", "reverse", "single-leg"],
    },
    "reverse": {
      "excludedVariations": ["45-degree", "GHD", "floor", "single-leg"],
    },
    "weighted": {
      "excludedVariations": ["band", "barbell", "dumbbell", "machine", "plate"],
    },
    "machine": {
      "excludedVariations": [
        "band",
        "barbell",
        "dumbbell",
        "plate",
        "weighted",
      ],
    },
    "barbell": {
      "excludedVariations": [
        "band",
        "dumbbell",
        "machine",
        "plate",
        "weighted",
      ],
    },
    "band": {
      "excludedVariations": [
        "barbell",
        "dumbbell",
        "machine",
        "plate",
        "weighted",
      ],
    },
    "dumbbell": {
      "excludedVariations": ["band", "barbell", "machine", "plate", "weighted"],
    },
    "plate": {
      "excludedVariations": [
        "band",
        "barbell",
        "dumbbell",
        "machine",
        "weighted",
      ],
    },
  },
};
