const Map<String, dynamic> sitUp = {
  "pk": "13ce59d9-4fd0-4aea-857a-3afc186c3074",
  "name": "Sit-Up",
  "muscleGroups": ["Core"],
  "primaryMuscles": ["rectus abdominis"],
  "secondaryMuscles": ["external obliques"],
  "variations": {
    "standard": {
      "excludedVariations": [
        "decline",
        "butterfly",
        "straight-leg",
        "janda",
      ],
    },
    "decline": {
      "excludedVariations": [
        "standard",
        "anchor",
        "butterfly",
        "straight-leg",
        "janda",
      ],
    },
    "butterfly": {
      "excludedVariations": [
        "standard",
        "decline",
        "anchor",
        "straight-leg",
        "janda",
      ],
    },
    "straight-leg": {
      "excludedVariations": [
        "standard",
        "decline",
        "butterfly",
        "janda",
      ],
    },
    "janda": {
      "excludedVariations": [
        "standard",
        "decline",
        "anchor",
        "butterfly",
        "straight-leg",
      ],
    },
    "anchor": {
      "excludedVariations": [
        "decline",
        "butterfly",
        "janda",
      ],
    },
    "crossed-arms": {
      "excludedVariations": [
        "hands-behind-head",
      ],
    },
    "hands-behind-head": {
      "excludedVariations": [
        "crossed-arms",
      ],
    },
    "twisting": {
      "excludedVariations": [],
    },
    "weighted": {
      "excludedVariations": [
        "band-resisted",
      ],
    },
    "band-resisted": {
      "excludedVariations": [
        "weighted",
      ],
    },
  },
};
