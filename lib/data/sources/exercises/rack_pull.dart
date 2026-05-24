const Map<String, dynamic> rackPull = {
  "pk": "d6e59f6d-7a8b-4d30-c1e6-8f3b4d7e0a52",
  "name": "Rack Pull",
  "muscleGroups": ["Back"],
  "primaryMuscles": ["erector spinae", "gluteus maximus"],
  "secondaryMuscles": ["trapezius", "hamstrings", "wrist flexors"],
  "variations": {
    "below-knee": {
      "excludedVariations": [
        "above-knee",
      ],
    },
    "above-knee": {
      "excludedVariations": [
        "below-knee",
      ],
    },
    "sumo": {
      "excludedVariations": [
        "snatch-grip",
      ],
    },
    "snatch-grip": {
      "excludedVariations": [
        "sumo",
        "mixed-grip",
      ],
    },
    "mixed-grip": {
      "excludedVariations": [
        "overhand",
        "snatch-grip",
        "straps",
      ],
    },
    "overhand": {
      "excludedVariations": [
        "mixed-grip",
      ],
    },
    "paused": {
      "excludedVariations": [],
    },
    "barbell": {
      "excludedVariations": [],
    },
    "straps": {
      "excludedVariations": [
        "mixed-grip",
      ],
    },
  },
};
