const Map<String, dynamic> romanianDeadlift = {
  "pk": "c1d83b6a-7f29-4e5c-b2a8-9d0e5f7c3b21",
  "name": "Romanian Deadlift",
  "muscleGroups": ["Legs", "Glutes"],
  "primaryMuscles": ["hamstrings", "gluteus maximus"],
  "secondaryMuscles": ["erector spinae", "gastrocnemius"],
  "variations": {
    "single-leg": {
      "excludedVariations": [
        "B-stance",
        "deficit",
        "paused",
        "snatch-grip",
        "stiff-leg",
        "wide-grip",
      ],
    },
    "paused": {
      "excludedVariations": [
        "B-stance",
        "deficit",
        "single-leg",
        "snatch-grip",
        "stiff-leg",
        "wide-grip",
      ],
    },
    "stiff-leg": {
      "excludedVariations": [
        "B-stance",
        "deficit",
        "paused",
        "single-leg",
        "snatch-grip",
        "wide-grip",
      ],
    },
    "wide-grip": {
      "excludedVariations": [
        "B-stance",
        "deficit",
        "paused",
        "single-leg",
        "snatch-grip",
        "stiff-leg",
      ],
    },
    "snatch-grip": {
      "excludedVariations": [
        "B-stance",
        "deficit",
        "paused",
        "single-leg",
        "stiff-leg",
        "wide-grip",
      ],
    },
    "B-stance": {
      "excludedVariations": [
        "deficit",
        "paused",
        "single-leg",
        "snatch-grip",
        "stiff-leg",
        "wide-grip",
      ],
    },
    "deficit": {
      "excludedVariations": [
        "B-stance",
        "paused",
        "single-leg",
        "snatch-grip",
        "stiff-leg",
        "wide-grip",
      ],
    },
    "barbell": {
      "excludedVariations": [
        "banded",
        "cable",
        "dumbbell",
        "kettlebell",
        "trap bar",
      ],
    },
    "dumbbell": {
      "excludedVariations": [
        "banded",
        "barbell",
        "cable",
        "kettlebell",
        "trap bar",
      ],
    },
    "kettlebell": {
      "excludedVariations": [
        "banded",
        "barbell",
        "cable",
        "dumbbell",
        "trap bar",
      ],
    },
    "cable": {
      "excludedVariations": [
        "banded",
        "barbell",
        "dumbbell",
        "kettlebell",
        "trap bar",
      ],
    },
    "trap bar": {
      "excludedVariations": [
        "banded",
        "barbell",
        "cable",
        "dumbbell",
        "kettlebell",
      ],
    },
    "banded": {
      "excludedVariations": [
        "barbell",
        "cable",
        "dumbbell",
        "kettlebell",
        "trap bar",
      ],
    },
  },
};
