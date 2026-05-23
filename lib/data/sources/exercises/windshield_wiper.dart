const Map<String, dynamic> windshieldWiper = {
  "pk": "37115036-6477-4046-96dc-5c48d077a201",
  "name": "Windshield Wiper",
  "muscleGroups": ["Core"],
  "primaryMuscles": ["external obliques"],
  "secondaryMuscles": ["rectus abdominis"],
  "variations": {
    "single-leg": {
      "excludedVariations": ["bent-knee", "decline", "feet-elevated"],
    },
    "bent-knee": {
      "excludedVariations": ["decline", "feet-elevated", "single-leg"],
    },
    "feet-elevated": {
      "excludedVariations": ["bent-knee", "decline", "single-leg"],
    },
    "decline": {
      "excludedVariations": ["bent-knee", "feet-elevated", "single-leg"],
    },
    "weighted": {"excludedVariations": []},
  },
};
