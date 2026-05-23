const Map<String, dynamic> legRaise = {
  "pk": "cbbdaae8-7600-456f-b025-12d2050b3765",
  "name": "Leg Raise",
  "muscleGroups": ["Core"],
  "primaryMuscles": ["rectus abdominis", "iliopsoas"],
  "secondaryMuscles": ["external obliques"],
  "variations": {
    "hanging": {
      "excludedVariations": [
        "lying",
        "captain's chair",
        "bench",
        "incline bench"
      ],
    },
    "lying": {
      "excludedVariations": [
        "hanging",
        "captain's chair",
        "bench",
        "incline bench",
        "toes-to-bar"
      ],
    },
    "single-leg": {
      "excludedVariations": [
        "flutter kick"
      ],
    },
    "knee-raise": {
      "excludedVariations": [
        "toes-to-bar",
        "flutter kick"
      ],
    },
    "toes-to-bar": {
      "excludedVariations": [
        "lying",
        "captain's chair",
        "bench",
        "incline bench",
        "knee-raise",
        "flutter kick"
      ],
    },
    "flutter kick": {
      "excludedVariations": [
        "single-leg",
        "toes-to-bar",
        "knee-raise"
      ],
    },
    "weighted": {
      "excludedVariations": [
        "band",
        "cable"
      ],
    },
    "captain's chair": {
      "excludedVariations": [
        "hanging",
        "lying",
        "bench",
        "incline bench",
        "toes-to-bar"
      ],
    },
    "bench": {
      "excludedVariations": [
        "hanging",
        "lying",
        "captain's chair",
        "incline bench",
        "toes-to-bar"
      ],
    },
    "incline bench": {
      "excludedVariations": [
        "hanging",
        "lying",
        "captain's chair",
        "bench",
        "toes-to-bar"
      ],
    },
    "band": {
      "excludedVariations": [
        "weighted",
        "cable"
      ],
    },
    "cable": {
      "excludedVariations": [
        "weighted",
        "band"
      ],
    },
  },
};
