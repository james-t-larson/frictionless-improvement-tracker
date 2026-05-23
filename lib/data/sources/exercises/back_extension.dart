const Map<String, dynamic> backExtension = {
  "pk": "328b8330-4a04-4f43-a255-f17cba659635",
  "name": "Back Extension",
  "muscleGroups": ["Back", "Glutes"],
  "primaryMuscles": ["gluteus maximus", "hamstrings", "erector spinae"],
  "secondaryMuscles": ["rectus abdominis"],
  "variations": {
    "floor": {
      "excludedVariations": ["45-degree", "GHD", "machine", "swiss-ball"],
    },
    "single-leg": {
      "excludedVariations": ["machine"],
    },
    "45-degree": {
      "excludedVariations": ["floor", "GHD", "machine", "swiss-ball"],
    },
    "GHD": {
      "excludedVariations": ["floor", "45-degree", "machine", "swiss-ball"],
    },
    "swiss-ball": {
      "excludedVariations": ["floor", "45-degree", "GHD", "machine"],
    },
    "reverse": {
      "excludedVariations": ["machine"],
    },
    "weighted": {
      "excludedVariations": ["band", "barbell", "dumbbell", "machine", "plate"],
    },
    "machine": {
      "excludedVariations": [
        "45-degree",
        "band",
        "barbell",
        "dumbbell",
        "floor",
        "GHD",
        "plate",
        "reverse",
        "single-leg",
        "swiss-ball",
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
