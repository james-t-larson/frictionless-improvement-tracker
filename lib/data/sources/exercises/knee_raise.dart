const Map<String, dynamic> kneeRaise = {
  "pk": "f4a37b4f-5c6d-4f18-e9a4-6b1d2f5f8c30",
  "name": "Knee Raise",
  "muscleGroups": ["Core"],
  "primaryMuscles": ["rectus abdominis"],
  "secondaryMuscles": ["external obliques", "wrist flexors", "iliopsoas"],
  "variations": {
    "hanging": {
      "excludedVariations": [
        "bodyweight",
        "incline",
        "lying",
        "straight-leg",
        "toes-to-bar",
      ],
    },
    "bodyweight": {
      "excludedVariations": [
        "hanging",
        "incline",
        "lying",
        "straight-leg",
        "toes-to-bar",
      ],
    },
    "straight-leg": {
      "excludedVariations": [
        "bodyweight",
        "hanging",
        "incline",
        "lying",
        "toes-to-bar",
      ],
    },
    "toes-to-bar": {
      "excludedVariations": [
        "bodyweight",
        "hanging",
        "incline",
        "lying",
        "straight-leg",
      ],
    },
    "lying": {
      "excludedVariations": [
        "bodyweight",
        "hanging",
        "incline",
        "straight-leg",
        "toes-to-bar",
      ],
    },
    "incline": {
      "excludedVariations": [
        "bodyweight",
        "hanging",
        "lying",
        "straight-leg",
        "toes-to-bar",
      ],
    },
    "weighted": {
      "excludedVariations": [
        "band",
        "cable",
        "captain's chair",
        "parallel bars",
      ],
    },
    "captain's chair": {
      "excludedVariations": ["band", "cable", "parallel bars", "weighted"],
    },
    "parallel bars": {
      "excludedVariations": ["band", "cable", "captain's chair", "weighted"],
    },
    "cable": {
      "excludedVariations": [
        "band",
        "captain's chair",
        "parallel bars",
        "weighted",
      ],
    },
    "band": {
      "excludedVariations": [
        "cable",
        "captain's chair",
        "parallel bars",
        "weighted",
      ],
    },
  },
};
