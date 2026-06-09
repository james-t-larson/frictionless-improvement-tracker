const Map<String, dynamic> romanianDeadlift = {
  "pk": "9aea77cf-1fc2-4758-96e5-e894112778a8",
  "name": "Romanian Deadlift",
  "muscleGroups": ["Legs"],
  "primaryMuscles": ["hamstrings", "gluteus maximus"],
  "secondaryMuscles": ["erector spinae", "gastrocnemius"],
  "variations": {
    "single-leg": {
      "excludedVariations": [
        "B-stance",
        "snatch-grip"
      ]
    },
    "paused": {
      "excludedVariations": []
    },
    "stiff-leg": {
      "excludedVariations": []
    },
    "snatch-grip": {
      "excludedVariations": [
        "B-stance",
        "cable",
        "dumbbell",
        "kettlebell",
        "single-leg",
        "trap bar"
      ]
    },
    "B-stance": {
      "excludedVariations": [
        "single-leg",
        "snatch-grip"
      ]
    },
    "deficit": {
      "excludedVariations": []
    },
    "barbell": {
      "excludedVariations": [
        "cable",
        "dumbbell",
        "kettlebell",
        "Smith machine",
        "trap bar"
      ]
    },
    "dumbbell": {
      "excludedVariations": [
        "banded",
        "barbell",
        "cable",
        "kettlebell",
        "Smith machine",
        "snatch-grip",
        "trap bar"
      ]
    },
    "kettlebell": {
      "excludedVariations": [
        "banded",
        "barbell",
        "cable",
        "dumbbell",
        "Smith machine",
        "snatch-grip",
        "trap bar"
      ]
    },
    "cable": {
      "excludedVariations": [
        "banded",
        "barbell",
        "dumbbell",
        "kettlebell",
        "Smith machine",
        "snatch-grip",
        "trap bar"
      ]
    },
    "trap bar": {
      "excludedVariations": [
        "banded",
        "barbell",
        "cable",
        "dumbbell",
        "kettlebell",
        "Smith machine",
        "snatch-grip"
      ]
    },
    "banded": {
      "excludedVariations": [
        "cable",
        "dumbbell",
        "kettlebell",
        "Smith machine",
        "trap bar"
      ]
    },
    "Smith machine": {
      "excludedVariations": [
        "banded",
        "barbell",
        "cable",
        "dumbbell",
        "kettlebell",
        "trap bar"
      ]
    }
  }
};

