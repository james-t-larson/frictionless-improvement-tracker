const Map<String, dynamic> calfRaise = {
  "pk": "b4c37d4a-5e6f-4b18-a9c4-6d1f2b5a8e30",
  "name": "Calf Raise",
  "muscleGroups": ["Legs"],
  "primaryMuscles": ["gastrocnemius"],
  "secondaryMuscles": ["soleus"],
  "variations": {
    "standing": {
      "excludedVariations": ["seated", "donkey", "leg press", "toe press"],
    },
    "seated": {
      "excludedVariations": ["standing", "donkey", "leg press", "toe press"],
    },
    "single-leg": {
      "excludedVariations": [],
    },
    "donkey": {
      "excludedVariations": ["standing", "seated", "leg press", "toe press"],
    },
    "leg press": {
      "excludedVariations": ["standing", "seated", "donkey", "toe press", "heel-elevated"],
    },
    "toe press": {
      "excludedVariations": ["standing", "seated", "donkey", "leg press", "heel-elevated"],
    },
    "offset": {
      "excludedVariations": [],
    },
    "paused": {
      "excludedVariations": [],
    },
    "tempo": {
      "excludedVariations": [],
    },
    "heel-elevated": {
      "excludedVariations": ["leg press", "toe press"],
    },
    "eccentric": {
      "excludedVariations": [],
    },
    "machine": {
      "excludedVariations": ["band-resisted", "barbell", "dumbbell", "bodyweight", "smith machine"],
    },
    "barbell": {
      "excludedVariations": ["band-resisted", "dumbbell", "machine", "bodyweight", "smith machine"],
    },
    "dumbbell": {
      "excludedVariations": ["band-resisted", "barbell", "machine", "bodyweight", "smith machine"],
    },
    "band-resisted": {
      "excludedVariations": ["barbell", "dumbbell", "machine", "bodyweight", "smith machine"],
    },
    "bodyweight": {
      "excludedVariations": ["machine", "barbell", "dumbbell", "band-resisted", "smith machine"],
    },
    "smith machine": {
      "excludedVariations": ["machine", "barbell", "dumbbell", "band-resisted", "bodyweight"],
    },
  },
  "namedVariations": [
    {
      "name": "Standing Calf Raise",
      "variations": ["standing"],
    },
    {
      "name": "Seated Calf Raise",
      "variations": ["seated"],
    },
    {
      "name": "Donkey Calf Raise",
      "variations": ["donkey"],
    },
  ],
};
