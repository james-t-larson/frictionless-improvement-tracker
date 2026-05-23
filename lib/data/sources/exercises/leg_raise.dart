const Map<String, dynamic> legRaise = {
  "pk": "cbbdaae8-7600-456f-b025-12d2050b3765",
  "name": "Leg Raise",
  "muscleGroups": ["Core"],
  "primaryMuscles": ["rectus abdominis", "wrist flexors", "wrist extensors"],
  "secondaryMuscles": ["external obliques"],
  "variations": {
    "hanging": {
      "excludedVariations": [
        "flutter kick",
        "knee-raise",
        "lying",
        "single-leg",
        "toes-to-bar",
      ],
    },
    "lying": {
      "excludedVariations": [
        "flutter kick",
        "hanging",
        "knee-raise",
        "single-leg",
        "toes-to-bar",
      ],
    },
    "single-leg": {
      "excludedVariations": [
        "flutter kick",
        "hanging",
        "knee-raise",
        "lying",
        "toes-to-bar",
      ],
    },
    "knee-raise": {
      "excludedVariations": [
        "flutter kick",
        "hanging",
        "lying",
        "single-leg",
        "toes-to-bar",
      ],
    },
    "toes-to-bar": {
      "excludedVariations": [
        "flutter kick",
        "hanging",
        "knee-raise",
        "lying",
        "single-leg",
      ],
    },
    "flutter kick": {
      "excludedVariations": [
        "hanging",
        "knee-raise",
        "lying",
        "single-leg",
        "toes-to-bar",
      ],
    },
    "weighted": {
      "excludedVariations": [
        "band",
        "bench",
        "cable",
        "captain's chair",
        "incline bench",
      ],
    },
    "captain's chair": {
      "excludedVariations": [
        "band",
        "bench",
        "cable",
        "incline bench",
        "weighted",
      ],
    },
    "bench": {
      "excludedVariations": [
        "band",
        "cable",
        "captain's chair",
        "incline bench",
        "weighted",
      ],
    },
    "incline bench": {
      "excludedVariations": [
        "band",
        "bench",
        "cable",
        "captain's chair",
        "weighted",
      ],
    },
    "band": {
      "excludedVariations": [
        "bench",
        "cable",
        "captain's chair",
        "incline bench",
        "weighted",
      ],
    },
    "cable": {
      "excludedVariations": [
        "band",
        "bench",
        "captain's chair",
        "incline bench",
        "weighted",
      ],
    },
  },
};
