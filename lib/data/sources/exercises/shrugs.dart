const Map<String, dynamic> shrugs = {
  "pk": "e8dc87a4-79e1-4114-90a4-418a4b67359f",
  "name": "Shrugs",
  "muscleGroups": ["Shoulders", "Back"],
  "primaryMuscles": ["trapezius"],
  "secondaryMuscles": [
    "levator scapulae",
    "rhomboids",
    "wrist flexors",
  ],
  "variations": {
    "single-arm": {
      "excludedVariations": [
        "behind-the-back", 
        "overhead", 
        "snatch-grip", 
        "barbell", 
        "trap bar"
      ],
    },
    "behind-the-back": {
      "excludedVariations": [
        "single-arm", 
        "overhead", 
        "seated", 
        "snatch-grip", 
        "dumbbell", 
        "kettlebell", 
        "trap bar"
      ],
    },
    "overhead": {
      "excludedVariations": [
        "single-arm", 
        "behind-the-back", 
        "seated", 
        "snatch-grip", 
        "trap bar"
      ],
    },
    "seated": {
      "excludedVariations": [
        "behind-the-back", 
        "overhead", 
        "snatch-grip", 
        "trap bar"
      ],
    },
    "snatch-grip": {
      "excludedVariations": [
        "single-arm", 
        "behind-the-back", 
        "overhead", 
        "seated", 
        "dumbbell", 
        "cable", 
        "machine", 
        "kettlebell", 
        "trap bar", 
        "band"
      ],
    },
    "dumbbell": {
      "excludedVariations": [
        "band",
        "barbell",
        "cable",
        "kettlebell",
        "machine",
        "smith machine",
        "trap bar",
        "behind-the-back",
        "snatch-grip"
      ],
    },
    "barbell": {
      "excludedVariations": [
        "band",
        "cable",
        "dumbbell",
        "kettlebell",
        "machine",
        "smith machine",
        "trap bar",
        "single-arm"
      ],
    },
    "cable": {
      "excludedVariations": [
        "band",
        "barbell",
        "dumbbell",
        "kettlebell",
        "machine",
        "smith machine",
        "trap bar",
        "snatch-grip"
      ],
    },
    "machine": {
      "excludedVariations": [
        "band",
        "barbell",
        "cable",
        "dumbbell",
        "kettlebell",
        "smith machine",
        "trap bar",
        "snatch-grip"
      ],
    },
    "kettlebell": {
      "excludedVariations": [
        "band",
        "barbell",
        "cable",
        "dumbbell",
        "machine",
        "smith machine",
        "trap bar",
        "behind-the-back",
        "snatch-grip"
      ],
    },
    "trap bar": {
      "excludedVariations": [
        "band",
        "barbell",
        "cable",
        "dumbbell",
        "kettlebell",
        "machine",
        "smith machine",
        "single-arm",
        "behind-the-back",
        "overhead",
        "seated",
        "snatch-grip"
      ],
    },
    "smith machine": {
      "excludedVariations": [
        "band",
        "barbell",
        "cable",
        "dumbbell",
        "kettlebell",
        "machine",
        "trap bar"
      ],
    },
    "band": {
      "excludedVariations": [
        "barbell",
        "cable",
        "dumbbell",
        "kettlebell",
        "machine",
        "smith machine",
        "trap bar",
        "snatch-grip"
      ],
    },
  },
  "namedVariations": [
    {
      "name": "Barbell Shrug",
      "variations": ["barbell"],
    },
    {
      "name": "Dumbbell Shrug",
      "variations": ["dumbbell"],
    },
  ],
};
