const Map<String, dynamic> chestFly = {
  "pk": "0c5940e6-419e-476b-a1eb-39302e0aebe5",
  "name": "Chest Fly",
  "muscleGroups": ["Chest"],
  "primaryMuscles": ["pectoralis major"],
  "secondaryMuscles": ["biceps brachii", "wrist flexors", "anterior deltoid"],
  "variations": {
    "incline": {
      "excludedVariations": [
        "decline",
        "flat",
        "pec-dec",
      ],
    },
    "decline": {
      "excludedVariations": [
        "flat",
        "incline",
        "pec-dec",
      ],
    },
    "flat": {
      "excludedVariations": [
        "decline",
        "incline",
        "pec-dec",
      ],
    },
    "pec-dec": {
      "excludedVariations": [
        "band",
        "cable",
        "decline",
        "dumbbell",
        "flat",
        "incline",
      ],
    },
    "dumbbell": {
      "excludedVariations": ["band", "cable", "pec-dec"],
    },
    "cable": {
      "excludedVariations": ["band", "dumbbell", "pec-dec"],
    },
    "band": {
      "excludedVariations": ["cable", "dumbbell", "pec-dec"],
    },
  },
  "namedVariations": [
    {
      "name": "Cable Fly",
      "variations": ["cable"],
      "aliases": ["Cable Crossover"],
    },
    {
      "name": "Pec Deck",
      "variations": ["pec-dec"],
      "aliases": ["Machine Fly"],
    },
    {
      "name": "Dumbbell Fly",
      "variations": ["dumbbell"],
    },
    {
      "name": "Incline Dumbbell Fly",
      "variations": ["incline", "dumbbell"],
    },
  ],
};
