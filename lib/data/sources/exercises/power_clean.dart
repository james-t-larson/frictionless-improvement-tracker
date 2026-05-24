const Map<String, dynamic> powerClean = {
  "pk": "8431323c-ca05-4424-9e2f-995e85f4f9e3",
  "name": "Power Clean",
  "muscleGroups": ["Back"],
  "primaryMuscles": ["gluteus maximus", "erector spinae"],
  "secondaryMuscles": [
    "wrist extensors",
    "hamstrings",
    "hip adductors",
    "trapezius",
  ],
  "variations": {
    "hang": {
      "excludedVariations": [
        "block",
        "low-hang",
        "mid-thigh",
        "pause at knee",
        "paused",
        "tall",
      ],
    },
    "wide-grip": {
      "excludedVariations": [
        "dumbbell",
        "kettlebell",
        "tall",
      ],
    },
    "clean and press": {
      "excludedVariations": [
        "clean and jerk",
        "clean and push jerk",
        "clean and push press",
      ],
    },
    "clean and jerk": {
      "excludedVariations": [
        "clean and press",
        "clean and push jerk",
        "clean and push press",
      ],
    },
    "clean and push press": {
      "excludedVariations": [
        "clean and jerk",
        "clean and press",
        "clean and push jerk",
      ],
    },
    "clean and push jerk": {
      "excludedVariations": [
        "clean and jerk",
        "clean and press",
        "clean and push press",
      ],
    },
    "tall": {
      "excludedVariations": [
        "block",
        "hang",
        "low-hang",
        "mid-thigh",
        "pause at knee",
        "paused",
        "wide-grip",
      ],
    },
    "low-hang": {
      "excludedVariations": [
        "block",
        "hang",
        "mid-thigh",
        "pause at knee",
        "paused",
        "tall",
      ],
    },
    "mid-thigh": {
      "excludedVariations": [
        "block",
        "hang",
        "low-hang",
        "pause at knee",
        "paused",
        "tall",
      ],
    },
    "paused": {
      "excludedVariations": [
        "block",
        "hang",
        "low-hang",
        "mid-thigh",
        "pause at knee",
        "tall",
      ],
    },
    "pause at knee": {
      "excludedVariations": [
        "block",
        "hang",
        "low-hang",
        "mid-thigh",
        "paused",
        "tall",
      ],
    },
    "dumbbell": {
      "excludedVariations": ["block", "kettlebell", "wide-grip"],
    },
    "kettlebell": {
      "excludedVariations": ["block", "dumbbell", "wide-grip"],
    },
    "block": {
      "excludedVariations": [
        "dumbbell",
        "hang",
        "kettlebell",
        "low-hang",
        "mid-thigh",
        "pause at knee",
        "paused",
        "tall",
      ],
    },
  },
};
