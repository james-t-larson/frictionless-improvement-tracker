const Map<String, dynamic> sledPush = {
  "pk": "d8e71f53-9a0b-4d52-c3e8-0f5b6d9d2a74",
  "name": "Sled Push",
  "muscleGroups": ["Legs"],
  "primaryMuscles": ["gluteus maximus", "quadriceps femoris"],
  "secondaryMuscles": ["hamstrings", "gastrocnemius", "anterior deltoid"],
  "variations": {
    "sprint": {
      "excludedVariations": [
        "backward",
        "heavy",
        "lateral",
        "single-arm",
      ],
    },
    "low-handles": {
      "excludedVariations": [
        "backward",
        "high-handles",
        "lateral",
      ],
    },
    "high-handles": {
      "excludedVariations": [
        "backward",
        "low-handles",
      ],
    },
    "single-arm": {
      "excludedVariations": [
        "backward",
        "heavy",
        "lateral",
        "sprint",
      ],
    },
    "backward": {
      "excludedVariations": [
        "high-handles",
        "low-handles",
        "single-arm",
        "sprint",
      ],
    },
    "heavy": {
      "excludedVariations": [
        "single-arm",
        "sprint",
      ],
    },
    "lateral": {
      "excludedVariations": [
        "low-handles",
        "single-arm",
        "sprint",
      ],
    },
  },
};
