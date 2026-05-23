const Map<String, dynamic> kneeRaise = {
  "pk": "f4a37b4f-5c6d-4f18-e9a4-6b1d2f5f8c30",
  "name": "Knee Raise",
  "muscleGroups": ["Core"],
  "primaryMuscles": ["rectus abdominis"],
  "secondaryMuscles": ["external obliques", "wrist flexors", "iliopsoas"],
  "variations": {
    "hanging": {
      "excludedVariations": [
        "lying",
        "incline",
        "captain's chair",
        "parallel bars",
        "standing",
        "cable",
        "band",
      ],
    },
    "bodyweight": {
      "excludedVariations": [
        "weighted",
        "cable",
        "band",
      ],
    },
    "lying": {
      "excludedVariations": [
        "hanging",
        "incline",
        "captain's chair",
        "parallel bars",
        "standing",
      ],
    },
    "incline": {
      "excludedVariations": [
        "hanging",
        "lying",
        "captain's chair",
        "parallel bars",
        "standing",
        "cable",
        "band",
      ],
    },
    "weighted": {
      "excludedVariations": [
        "bodyweight",
        "cable",
        "band",
      ],
    },
    "captain's chair": {
      "excludedVariations": [
        "hanging",
        "lying",
        "incline",
        "parallel bars",
        "standing",
        "cable",
        "band",
      ],
    },
    "parallel bars": {
      "excludedVariations": [
        "hanging",
        "lying",
        "incline",
        "captain's chair",
        "standing",
        "cable",
        "band",
      ],
    },
    "standing": {
      "excludedVariations": [
        "hanging",
        "lying",
        "incline",
        "captain's chair",
        "parallel bars",
      ],
    },
    "cable": {
      "excludedVariations": [
        "bodyweight",
        "weighted",
        "band",
        "hanging",
        "incline",
        "captain's chair",
        "parallel bars",
      ],
    },
    "band": {
      "excludedVariations": [
        "bodyweight",
        "weighted",
        "cable",
        "hanging",
        "incline",
        "captain's chair",
        "parallel bars",
      ],
    },
  },
};
