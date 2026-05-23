const Map<String, dynamic> farmersCarry = {
  "pk": "d8e71f8c-9a0b-4d52-c3e8-0f5b6d9c2a74",
  "name": "Farmer's Carry",
  "muscleGroups": ["Shoulders", "Back"],
  "primaryMuscles": ["wrist flexors", "trapezius"],
  "secondaryMuscles": ["erector spinae", "lateral deltoid", "gluteus maximus"],
  "variations": {
    "overhead": {
      "excludedVariations": [
        "mixed-grip",
        "suitcase carry",
        "waiter's carry",
        "trap bar",
        "farmer's handles",
      ],
    },
    "waiter's carry": {
      "excludedVariations": [
        "mixed-grip",
        "overhead",
        "suitcase carry",
        "trap bar",
        "farmer's handles",
      ],
    },
    "suitcase carry": {
      "excludedVariations": [
        "mixed-grip",
        "overhead",
        "waiter's carry",
        "trap bar",
      ],
    },
    "mixed-grip": {
      "excludedVariations": [
        "overhead",
        "suitcase carry",
        "waiter's carry",
        "trap bar",
        "farmer's handles",
      ],
    },
    "dumbbell": {
      "excludedVariations": [
        "axle bar",
        "barbell",
        "farmer's handles",
        "kettlebell",
        "trap bar",
      ],
    },
    "barbell": {
      "excludedVariations": [
        "axle bar",
        "dumbbell",
        "farmer's handles",
        "kettlebell",
        "trap bar",
      ],
    },
    "kettlebell": {
      "excludedVariations": [
        "axle bar",
        "barbell",
        "dumbbell",
        "farmer's handles",
        "trap bar",
      ],
    },
    "trap bar": {
      "excludedVariations": [
        "axle bar",
        "barbell",
        "dumbbell",
        "farmer's handles",
        "kettlebell",
        "mixed-grip",
        "overhead",
        "suitcase carry",
        "waiter's carry",
      ],
    },
    "axle bar": {
      "excludedVariations": [
        "barbell",
        "dumbbell",
        "farmer's handles",
        "kettlebell",
        "trap bar",
      ],
    },
    "farmer's handles": {
      "excludedVariations": [
        "axle bar",
        "barbell",
        "dumbbell",
        "kettlebell",
        "mixed-grip",
        "overhead",
        "trap bar",
        "waiter's carry",
      ],
    },
  },
};
