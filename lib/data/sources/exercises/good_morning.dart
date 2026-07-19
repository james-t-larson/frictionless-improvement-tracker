const Map<String, dynamic> goodMorning = {
  "pk": "e7f04a19-2b3c-4e85-d6f1-3a8c9e2d5b07",
  "name": "Good Morning",
  "muscleGroups": ["Legs", "Back"],
  "primaryMuscles": ["hamstrings", "erector spinae"],
  "secondaryMuscles": ["gluteus maximus", "rectus abdominis"],
  "variations": {
    "seated": {
      "excludedVariations": [
        "good morning squat",
        "paused",
        "single-leg",
        "suspended",
        "wide-grip",
      ],
    },
    "single-leg": {
      "excludedVariations": [
        "good morning squat",
        "paused",
        "seated",
        "suspended",
        "wide-grip",
      ],
    },
    "good morning squat": {
      "excludedVariations": [
        "paused",
        "seated",
        "single-leg",
        "suspended",
        "wide-grip",
      ],
    },
    "suspended": {
      "excludedVariations": [
        "good morning squat",
        "paused",
        "seated",
        "single-leg",
        "wide-grip",
      ],
    },
    "wide-grip": {
      "excludedVariations": [
        "good morning squat",
        "paused",
        "seated",
        "single-leg",
        "suspended",
      ],
    },
    "paused": {
      "excludedVariations": [
        "good morning squat",
        "seated",
        "single-leg",
        "suspended",
        "wide-grip",
      ],
    },
    "barbell": {
      "excludedVariations": [
        "banded",
        "cable",
        "dumbbell",
        "safety bar",
        "smith machine",
      ],
    },
    "banded": {
      "excludedVariations": [
        "barbell",
        "cable",
        "dumbbell",
        "safety bar",
        "smith machine",
      ],
    },
    "dumbbell": {
      "excludedVariations": [
        "banded",
        "barbell",
        "cable",
        "safety bar",
        "smith machine",
      ],
    },
    "cable": {
      "excludedVariations": [
        "banded",
        "barbell",
        "dumbbell",
        "safety bar",
        "smith machine",
      ],
    },
    "smith machine": {
      "excludedVariations": [
        "banded",
        "barbell",
        "cable",
        "dumbbell",
        "safety bar",
      ],
    },
    "safety bar": {
      "excludedVariations": [
        "banded",
        "barbell",
        "cable",
        "dumbbell",
        "smith machine",
      ],
    },
  },
  "namedVariations": [
    {
      "name": "Seated Good Morning",
      "variations": ["seated"],
    },
  ],
};
