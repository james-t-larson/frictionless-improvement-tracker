const Map<String, dynamic> landminePress = {
  "pk": "b2c15d2a-3e4f-4b96-a7c2-4d9f0b3e6a18",
  "name": "Landmine Press",
  "muscleGroups": ["Shoulders", "Chest"],
  "primaryMuscles": ["anterior deltoid", "pectoralis major"],
  "secondaryMuscles": ["triceps brachii", "lateral deltoid"],
  "variations": {
    "single-arm": {
      "excludedVariations": [
        "alternating",
        "bilateral",
      ],
    },
    "kneeling": {
      "excludedVariations": [
        "half-kneeling",
        "push press",
        "rotational",
        "split-stance",
        "squat-to-press",
        "standing",
      ],
    },
    "standing": {
      "excludedVariations": [
        "half-kneeling",
        "kneeling",
        "split-stance",
        "squat-to-press",
      ],
    },
    "half-kneeling": {
      "excludedVariations": [
        "kneeling",
        "push press",
        "rotational",
        "split-stance",
        "squat-to-press",
        "standing",
      ],
    },
    "push press": {
      "excludedVariations": [
        "half-kneeling",
        "kneeling",
        "squat-to-press",
      ],
    },
    "bilateral": {
      "excludedVariations": [
        "alternating",
        "single-arm",
      ],
    },
    "alternating": {
      "excludedVariations": [
        "bilateral",
        "single-arm",
      ],
    },
    "rotational": {
      "excludedVariations": [
        "half-kneeling",
        "kneeling",
        "squat-to-press",
      ],
    },
    "squat-to-press": {
      "excludedVariations": [
        "half-kneeling",
        "kneeling",
        "push press",
        "rotational",
        "split-stance",
        "standing",
      ],
    },
    "split-stance": {
      "excludedVariations": [
        "half-kneeling",
        "kneeling",
        "squat-to-press",
        "standing",
      ],
    },
  },
};
