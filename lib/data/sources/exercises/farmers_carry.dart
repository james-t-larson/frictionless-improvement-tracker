const Map<String, dynamic> farmersCarry = {
  "pk": "d8e71f8c-9a0b-4d52-c3e8-0f5b6d9c2a74",
  "name": "Farmer's Carry",
  "muscleGroups": ["Shoulders", "Back"],
  "primaryMuscles": ["wrist flexors", "trapezius"],
  "secondaryMuscles": ["erector spinae", "lateral deltoid", "gluteus maximus"],
  "variations": {
    "single-arm": {
      "excludedVariations": [
        "mixed-grip",
        "overhead",
        "suitcase carry",
        "waiter's carry",
      ],
    },
    "overhead": {
      "excludedVariations": [
        "mixed-grip",
        "single-arm",
        "suitcase carry",
        "waiter's carry",
      ],
    },
    "waiter's carry": {
      "excludedVariations": [
        "mixed-grip",
        "overhead",
        "single-arm",
        "suitcase carry",
      ],
    },
    "suitcase carry": {
      "excludedVariations": [
        "mixed-grip",
        "overhead",
        "single-arm",
        "waiter's carry",
      ],
    },
    "mixed-grip": {
      "excludedVariations": [
        "overhead",
        "single-arm",
        "suitcase carry",
        "waiter's carry",
      ],
    },
    "dumbbell": {
      "excludedVariations": [
        "axle bar",
        "barbell",
        "double kettlebell",
        "kettlebell",
        "trap bar",
        "yoke",
      ],
    },
    "barbell": {
      "excludedVariations": [
        "axle bar",
        "double kettlebell",
        "dumbbell",
        "kettlebell",
        "trap bar",
        "yoke",
      ],
    },
    "kettlebell": {
      "excludedVariations": [
        "axle bar",
        "barbell",
        "double kettlebell",
        "dumbbell",
        "trap bar",
        "yoke",
      ],
    },
    "trap bar": {
      "excludedVariations": [
        "axle bar",
        "barbell",
        "double kettlebell",
        "dumbbell",
        "kettlebell",
        "yoke",
      ],
    },
    "yoke": {
      "excludedVariations": [
        "axle bar",
        "barbell",
        "double kettlebell",
        "dumbbell",
        "kettlebell",
        "trap bar",
      ],
    },
    "axle bar": {
      "excludedVariations": [
        "barbell",
        "double kettlebell",
        "dumbbell",
        "kettlebell",
        "trap bar",
        "yoke",
      ],
    },
    "double kettlebell": {
      "excludedVariations": [
        "axle bar",
        "barbell",
        "dumbbell",
        "kettlebell",
        "trap bar",
        "yoke",
      ],
    },
  },
};
