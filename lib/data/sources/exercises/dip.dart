const Map<String, dynamic> dip = {
  "pk": "102850fa-8459-4cd0-81b5-88cc982d5de4",
  "name": "Dip",
  "muscleGroups": ["Chest", "Arms"],
  "primaryMuscles": ["pectoralis major", "triceps brachii"],
  "secondaryMuscles": ["subscapularis", "anterior deltoid"],
  "variations": {
    "bodyweight": {
      "excludedVariations": [
        "chest-forward",
        "korean",
        "single-arm",
        "upright",
      ],
    },
    "chest-forward": {
      "excludedVariations": ["bodyweight", "korean", "single-arm", "upright"],
    },
    "upright": {
      "excludedVariations": [
        "bodyweight",
        "chest-forward",
        "korean",
        "single-arm",
      ],
    },
    "korean": {
      "excludedVariations": [
        "bodyweight",
        "chest-forward",
        "single-arm",
        "upright",
      ],
    },
    "single-arm": {
      "excludedVariations": [
        "bodyweight",
        "chest-forward",
        "korean",
        "upright",
      ],
    },
    "weighted": {
      "excludedVariations": [
        "assisted",
        "banded",
        "bench",
        "machine",
        "parallel bars",
        "rings",
      ],
    },
    "assisted": {
      "excludedVariations": [
        "banded",
        "bench",
        "machine",
        "parallel bars",
        "rings",
        "weighted",
      ],
    },
    "rings": {
      "excludedVariations": [
        "assisted",
        "banded",
        "bench",
        "machine",
        "parallel bars",
        "weighted",
      ],
    },
    "bench": {
      "excludedVariations": [
        "assisted",
        "banded",
        "machine",
        "parallel bars",
        "rings",
        "weighted",
      ],
    },
    "machine": {
      "excludedVariations": [
        "assisted",
        "banded",
        "bench",
        "parallel bars",
        "rings",
        "weighted",
      ],
    },
    "parallel bars": {
      "excludedVariations": [
        "assisted",
        "banded",
        "bench",
        "machine",
        "rings",
        "weighted",
      ],
    },
    "banded": {
      "excludedVariations": [
        "assisted",
        "bench",
        "machine",
        "parallel bars",
        "rings",
        "weighted",
      ],
    },
  },
};
