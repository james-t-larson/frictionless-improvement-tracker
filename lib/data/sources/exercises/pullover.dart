const Map<String, dynamic> pullover = {
  "pk": "f6a59b6e-7c8d-4f30-e1a6-8b3d4f7c0e52",
  "name": "Pullover",
  "muscleGroups": ["Chest", "Back"],
  "primaryMuscles": ["pectoralis major", "latissimus dorsi"],
  "secondaryMuscles": ["triceps brachii", "posterior deltoid"],
  "variations": {
    "decline": {
      "excludedVariations": ["flat bench", "machine", "stability ball"],
    },
    "single-arm": {
      "excludedVariations": ["barbell", "EZ-bar", "machine"],
    },
    "EZ-bar": {
      "excludedVariations": ["dumbbell", "barbell", "cable", "machine", "single-arm"],
    },
    "straight-arm": {
      "excludedVariations": ["bent-arm"],
    },
    "bent-arm": {
      "excludedVariations": ["straight-arm"],
    },
    "dumbbell": {
      "excludedVariations": ["barbell", "EZ-bar", "cable", "machine"],
    },
    "flat bench": {
      "excludedVariations": ["decline", "machine", "stability ball"],
    },
    "cable": {
      "excludedVariations": ["dumbbell", "barbell", "EZ-bar", "machine"],
    },
    "barbell": {
      "excludedVariations": ["dumbbell", "EZ-bar", "cable", "machine", "single-arm"],
    },
    "machine": {
      "excludedVariations": [
        "dumbbell", 
        "barbell", 
        "EZ-bar", 
        "cable", 
        "flat bench", 
        "decline", 
        "single-arm", 
        "stability ball"
      ],
    },
    "stability ball": {
      "excludedVariations": ["flat bench", "decline", "machine"],
    },
  },
  "namedVariations": [
    {
      "name": "Dumbbell Pullover",
      "variations": ["dumbbell"],
    },
  ],
};
