const Map<String, dynamic> deadlift = {
  "pk": "ba2387cd-2192-42d5-8895-4c8ad78b3607",
  "name": "Deadlift",
  "muscleGroups": ["Legs"],
  "primaryMuscles": ["gluteus maximus", "hamstrings", "erector spinae"],
  "secondaryMuscles": [
    "gastrocnemius",
    "wrist flexors",
    "wrist extensors",
    "trapezius",
    "quadriceps femoris",
  ],
  "variations": {
    "sumo": {
      "excludedVariations": [
        "deficit",
        "paused",
        "romanian",
        "single-leg",
        "snatch-grip",
        "stiff-leg",
      ],
    },
    "single-leg": {
      "excludedVariations": [
        "deficit",
        "paused",
        "romanian",
        "snatch-grip",
        "stiff-leg",
        "sumo",
      ],
    },
    "romanian": {
      "excludedVariations": [
        "deficit",
        "paused",
        "single-leg",
        "snatch-grip",
        "stiff-leg",
        "sumo",
      ],
    },
    "stiff-leg": {
      "excludedVariations": [
        "deficit",
        "paused",
        "romanian",
        "single-leg",
        "snatch-grip",
        "sumo",
      ],
    },
    "deficit": {
      "excludedVariations": [
        "paused",
        "romanian",
        "single-leg",
        "snatch-grip",
        "stiff-leg",
        "sumo",
      ],
    },
    "paused": {
      "excludedVariations": [
        "deficit",
        "romanian",
        "single-leg",
        "snatch-grip",
        "stiff-leg",
        "sumo",
      ],
    },
    "snatch-grip": {
      "excludedVariations": [
        "deficit",
        "paused",
        "romanian",
        "single-leg",
        "stiff-leg",
        "sumo",
      ],
    },
    "barbell": {
      "excludedVariations": [
        "banded",
        "block-pull",
        "dumbbell",
        "hex-bar",
        "kettlebell",
        "straps",
        "trap bar",
      ],
    },
    "dumbbell": {
      "excludedVariations": [
        "banded",
        "barbell",
        "block-pull",
        "hex-bar",
        "kettlebell",
        "straps",
        "trap bar",
      ],
    },
    "kettlebell": {
      "excludedVariations": [
        "banded",
        "barbell",
        "block-pull",
        "dumbbell",
        "hex-bar",
        "straps",
        "trap bar",
      ],
    },
    "trap bar": {
      "excludedVariations": [
        "banded",
        "barbell",
        "block-pull",
        "dumbbell",
        "hex-bar",
        "kettlebell",
        "straps",
      ],
    },
    "hex-bar": {
      "excludedVariations": [
        "banded",
        "barbell",
        "block-pull",
        "dumbbell",
        "kettlebell",
        "straps",
        "trap bar",
      ],
    },
    "banded": {
      "excludedVariations": [
        "barbell",
        "block-pull",
        "dumbbell",
        "hex-bar",
        "kettlebell",
        "straps",
        "trap bar",
      ],
    },
    "block-pull": {
      "excludedVariations": [
        "banded",
        "barbell",
        "dumbbell",
        "hex-bar",
        "kettlebell",
        "straps",
        "trap bar",
      ],
    },
    "straps": {
      "excludedVariations": [
        "banded",
        "barbell",
        "block-pull",
        "dumbbell",
        "hex-bar",
        "kettlebell",
        "trap bar",
      ],
    },
  },
  "namedVariations": [
    {
      "name": "Romanian Deadlift",
      "variations": ["romanian"],
      "aliases": ["RDL"],
    },
    {
      "name": "Sumo Deadlift",
      "variations": ["sumo"],
    },
    {
      "name": "Stiff-Leg Deadlift",
      "variations": ["stiff-leg"],
      "aliases": ["Stiff-Legged Deadlift"],
    },
    {
      "name": "Single-Leg Deadlift",
      "variations": ["single-leg"],
    },
    {
      "name": "Deficit Deadlift",
      "variations": ["deficit"],
    },
    {
      "name": "Snatch-Grip Deadlift",
      "variations": ["snatch-grip"],
    },
    {
      "name": "Trap Bar Deadlift",
      "variations": ["trap bar"],
      "aliases": ["Hex Bar Deadlift"],
    },
    {
      "name": "Paused Deadlift",
      "variations": ["paused"],
    },
  ],
};
