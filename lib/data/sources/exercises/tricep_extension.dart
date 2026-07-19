const Map<String, dynamic> tricepExtension = {
  "pk": "c1d04e1b-2f3a-4c85-b6d1-3e8a9c2b5f07",
  "name": "Tricep Extension",
  "muscleGroups": ["Arms"],
  "primaryMuscles": ["triceps brachii"],
  "secondaryMuscles": [],
  "variations": {
    "EZ-bar": {
      "excludedVariations": [
        "barbell", "cable", "dumbbell", "rope", "band", "machine",
        "single-arm", "kickback"
      ],
    },
    "single-arm": {
      "excludedVariations": [
        "EZ-bar", "barbell", "machine"
      ],
    },
    "overhead": {
      "excludedVariations": [
        "kickback"
      ],
    },
    "lying": {
      "excludedVariations": [
        "seated", "standing", "kickback", "machine"
      ],
    },
    "seated": {
      "excludedVariations": [
        "lying", "standing"
      ],
    },
    "standing": {
      "excludedVariations": [
        "lying", "seated", "machine"
      ],
    },
    "kickback": {
      "excludedVariations": [
        "overhead", "lying", "EZ-bar", "barbell", "machine"
      ],
    },
    "cable": {
      "excludedVariations": [
        "EZ-bar", "dumbbell", "barbell", "band", "machine"
      ],
    },
    "dumbbell": {
      "excludedVariations": [
        "EZ-bar", "cable", "barbell", "rope", "band", "machine"
      ],
    },
    "barbell": {
      "excludedVariations": [
        "EZ-bar", "cable", "dumbbell", "rope", "band", "machine",
        "single-arm", "kickback"
      ],
    },
    "rope": {
      "excludedVariations": [
        "EZ-bar", "dumbbell", "barbell", "band", "machine"
      ],
    },
    "band": {
      "excludedVariations": [
        "EZ-bar", "cable", "dumbbell", "barbell", "rope", "machine"
      ],
    },
    "machine": {
      "excludedVariations": [
        "EZ-bar", "cable", "dumbbell", "barbell", "rope", "band", 
        "single-arm", "lying", "standing", "kickback"
      ],
    }
  },
  "namedVariations": [
    {
      "name": "Overhead Tricep Extension",
      "variations": ["overhead"],
    },
    {
      "name": "Tricep Kickback",
      "variations": ["kickback"],
    },
    {
      "name": "Lying Tricep Extension",
      "variations": ["lying"],
    },
  ],
};
