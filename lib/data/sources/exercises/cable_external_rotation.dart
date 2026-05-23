const Map<String, dynamic> cableExternalRotation = {
  "pk": "e1f04a1d-2b3c-4e85-d6f1-3a8d9e2f5a07",
  "name": "Cable External Rotation",
  "muscleGroups": ["Shoulders"],
  "primaryMuscles": ["infraspinatus"],
  "secondaryMuscles": ["posterior deltoid"],
  "variations": {
    "standing": {
      "excludedVariations": [
        "seated",
        "knee-supported"
      ],
    },
    "seated": {
      "excludedVariations": [
        "standing"
      ],
    },
    "single-arm": {
      "excludedVariations": [
        "bilateral"
      ],
    },
    "bilateral": {
      "excludedVariations": [
        "single-arm",
        "knee-supported"
      ],
    },
    "90-degree abduction": {
      "excludedVariations": [
        "knee-supported"
      ],
    },
    "knee-supported": {
      "excludedVariations": [
        "standing",
        "bilateral",
        "90-degree abduction"
      ],
    },
    "band": {
      "excludedVariations": []
    },
  },
};
