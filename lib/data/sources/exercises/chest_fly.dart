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
        "overhand-grip",
        "pec-dec",
        "underhand-grip",
      ],
    },
    "decline": {
      "excludedVariations": [
        "flat",
        "incline",
        "overhand-grip",
        "pec-dec",
        "underhand-grip",
      ],
    },
    "flat": {
      "excludedVariations": [
        "decline",
        "incline",
        "overhand-grip",
        "pec-dec",
        "underhand-grip",
      ],
    },
    "overhand-grip": {
      "excludedVariations": [
        "decline",
        "flat",
        "incline",
        "pec-dec",
        "underhand-grip",
      ],
    },
    "underhand-grip": {
      "excludedVariations": [
        "decline",
        "flat",
        "incline",
        "overhand-grip",
        "pec-dec",
      ],
    },
    "pec-dec": {
      "excludedVariations": [
        "band",
        "cable crossover",
        "decline",
        "dumbbell",
        "flat",
        "incline",
        "overhand-grip",
        "underhand-grip",
      ],
    },
    "dumbbell": {
      "excludedVariations": ["band", "cable crossover", "pec-dec"],
    },
    "cable crossover": {
      "excludedVariations": ["band", "dumbbell", "pec-dec"],
    },
    "band": {
      "excludedVariations": ["cable crossover", "dumbbell", "pec-dec"],
    },
  },
};
