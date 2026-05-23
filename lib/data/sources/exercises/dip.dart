const Map<String, dynamic> dip = {
  "pk": "102850fa-8459-4cd0-81b5-88cc982d5de4",
  "name": "Dip",
  "muscleGroups": ["Chest", "Arms"],
  "primaryMuscles": ["pectoralis major", "triceps brachii"],
  "secondaryMuscles": ["subscapularis", "anterior deltoid"],
  "variations": {
    "bodyweight": {
      "excludedVariations": [
        "assisted",
        "banded",
        "weighted",
      ],
    },
    "chest-forward": {
      "excludedVariations": [
        "bench",
        "upright",
      ],
    },
    "upright": {
      "excludedVariations": [
        "chest-forward",
      ],
    },
    "weighted": {
      "excludedVariations": [
        "assisted",
        "banded",
        "bodyweight",
      ],
    },
    "assisted": {
      "excludedVariations": [
        "banded",
        "bodyweight",
        "weighted",
      ],
    },
    "banded": {
      "excludedVariations": [
        "assisted",
        "bodyweight",
        "machine",
        "weighted",
      ],
    },
    "straight bar": {
      "excludedVariations": [
        "bench",
        "machine",
        "parallel bars",
        "rings",
      ],
    },
    "parallel bars": {
      "excludedVariations": [
        "bench",
        "machine",
        "rings",
        "straight bar",
      ],
    },
    "rings": {
      "excludedVariations": [
        "bench",
        "machine",
        "parallel bars",
        "straight bar",
      ],
    },
    "bench": {
      "excludedVariations": [
        "chest-forward",
        "machine",
        "parallel bars",
        "rings",
        "straight bar",
      ],
    },
    "machine": {
      "excludedVariations": [
        "banded",
        "bench",
        "parallel bars",
        "rings",
        "straight bar",
      ],
    },
  },
};
