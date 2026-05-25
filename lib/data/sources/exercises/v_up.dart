const Map<String, dynamic> vUp = {
  "pk": "e4ada608-1354-43e6-99cb-c7af0c76edde",
  "name": "V-Up",
  "muscleGroups": ["Core"],
  "primaryMuscles": ["rectus abdominis"],
  "secondaryMuscles": [],
  "variations": {
    "single-leg": {
      "excludedVariations": ["bent-knee", "full", "straddle", "tuck"],
    },
    "bent-knee": {
      "excludedVariations": ["full", "single-leg", "straddle", "tuck"],
    },
    "hollow body": {
      "excludedVariations": [],
    },
    "tuck": {
      "excludedVariations": ["bent-knee", "full", "single-leg", "straddle"],
    },
    "full": {
      "excludedVariations": ["bent-knee", "single-leg", "straddle", "tuck"],
    },
    "straddle": {
      "excludedVariations": ["bent-knee", "full", "single-leg", "tuck"],
    },
    "weighted": {
      "excludedVariations": ["band-resisted"],
    },
    "band-resisted": {
      "excludedVariations": ["weighted"],
    },
  },
};
