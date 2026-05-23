const Map<String, dynamic> russianTwist = {
  "pk": "e3f26a3e-4b5c-4e07-d8f3-5a0c1e4e7b29",
  "name": "Russian Twist",
  "muscleGroups": ["Core"],
  "primaryMuscles": ["external obliques"],
  "secondaryMuscles": ["rectus abdominis"],
  "variations": {
    "bodyweight": {
      "excludedVariations": ["decline", "feet-elevated"],
    },
    "feet-elevated": {
      "excludedVariations": ["bodyweight", "decline"],
    },
    "decline": {
      "excludedVariations": ["bodyweight", "feet-elevated"],
    },
    "weighted": {
      "excludedVariations": [
        "band-resisted",
        "cable",
        "kettlebell",
        "medicine ball",
        "plate",
      ],
    },
    "medicine ball": {
      "excludedVariations": [
        "band-resisted",
        "cable",
        "kettlebell",
        "plate",
        "weighted",
      ],
    },
    "cable": {
      "excludedVariations": [
        "band-resisted",
        "kettlebell",
        "medicine ball",
        "plate",
        "weighted",
      ],
    },
    "plate": {
      "excludedVariations": [
        "band-resisted",
        "cable",
        "kettlebell",
        "medicine ball",
        "weighted",
      ],
    },
    "kettlebell": {
      "excludedVariations": [
        "band-resisted",
        "cable",
        "medicine ball",
        "plate",
        "weighted",
      ],
    },
    "band-resisted": {
      "excludedVariations": [
        "cable",
        "kettlebell",
        "medicine ball",
        "plate",
        "weighted",
      ],
    },
  },
};
