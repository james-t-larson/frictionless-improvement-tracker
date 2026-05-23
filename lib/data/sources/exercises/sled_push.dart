const Map<String, dynamic> sledPush = {
  "pk": "d8e71f53-9a0b-4d52-c3e8-0f5b6d9d2a74",
  "name": "Sled Push",
  "muscleGroups": ["Legs"],
  "primaryMuscles": ["gluteus maximus", "quadriceps femoris"],
  "secondaryMuscles": ["hamstrings", "gastrocnemius", "anterior deltoid"],
  "variations": {
    "loaded": {
      "excludedVariations": [
        "backward",
        "heavy",
        "high-handles",
        "lateral",
        "low-handles",
        "single-arm",
        "sprint",
      ],
    },
    "sprint": {
      "excludedVariations": [
        "backward",
        "heavy",
        "high-handles",
        "lateral",
        "loaded",
        "low-handles",
        "single-arm",
      ],
    },
    "low-handles": {
      "excludedVariations": [
        "backward",
        "heavy",
        "high-handles",
        "lateral",
        "loaded",
        "single-arm",
        "sprint",
      ],
    },
    "high-handles": {
      "excludedVariations": [
        "backward",
        "heavy",
        "lateral",
        "loaded",
        "low-handles",
        "single-arm",
        "sprint",
      ],
    },
    "single-arm": {
      "excludedVariations": [
        "backward",
        "heavy",
        "high-handles",
        "lateral",
        "loaded",
        "low-handles",
        "sprint",
      ],
    },
    "backward": {
      "excludedVariations": [
        "heavy",
        "high-handles",
        "lateral",
        "loaded",
        "low-handles",
        "single-arm",
        "sprint",
      ],
    },
    "heavy": {
      "excludedVariations": [
        "backward",
        "high-handles",
        "lateral",
        "loaded",
        "low-handles",
        "single-arm",
        "sprint",
      ],
    },
    "lateral": {
      "excludedVariations": [
        "backward",
        "heavy",
        "high-handles",
        "loaded",
        "low-handles",
        "single-arm",
        "sprint",
      ],
    },
    "prowler": {
      "excludedVariations": ["banded"],
    },
    "banded": {
      "excludedVariations": ["prowler"],
    },
  },
};
