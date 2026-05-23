const Map<String, dynamic> vUp = {
  "pk": "e4ada608-1354-43e6-99cb-c7af0c76edde",
  "name": "V-Up",
  "muscleGroups": ["Core"],
  "primaryMuscles": ["rectus abdominis"],
  "secondaryMuscles": [],
  "variations": {
    "single-leg": {
      "excludedVariations": ["bent-knee", "full", "hollow body", "tuck"],
    },
    "bent-knee": {
      "excludedVariations": ["full", "hollow body", "single-leg", "tuck"],
    },
    "hollow body": {
      "excludedVariations": ["bent-knee", "full", "single-leg", "tuck"],
    },
    "tuck": {
      "excludedVariations": ["bent-knee", "full", "hollow body", "single-leg"],
    },
    "full": {
      "excludedVariations": ["bent-knee", "hollow body", "single-leg", "tuck"],
    },
    "weighted": {
      "excludedVariations": ["band-resisted"],
    },
    "band-resisted": {
      "excludedVariations": ["weighted"],
    },
  },
};
