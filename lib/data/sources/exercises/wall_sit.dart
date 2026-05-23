const Map<String, dynamic> wallSit = {
  "pk": "a9b82c9a-0d1e-4a63-f4b9-1c6e7a0a3d85",
  "name": "Wall Sit",
  "muscleGroups": ["Legs", "Core"],
  "primaryMuscles": ["quadriceps femoris"],
  "secondaryMuscles": ["gluteus maximus", "hamstrings"],
  "variations": {
    "bodyweight": {
      "excludedVariations": [
        "heels-elevated",
        "overhead hold",
        "single-leg",
        "with press",
      ],
    },
    "single-leg": {
      "excludedVariations": [
        "bodyweight",
        "heels-elevated",
        "overhead hold",
        "with press",
      ],
    },
    "heels-elevated": {
      "excludedVariations": [
        "bodyweight",
        "overhead hold",
        "single-leg",
        "with press",
      ],
    },
    "with press": {
      "excludedVariations": [
        "bodyweight",
        "heels-elevated",
        "overhead hold",
        "single-leg",
      ],
    },
    "overhead hold": {
      "excludedVariations": [
        "bodyweight",
        "heels-elevated",
        "single-leg",
        "with press",
      ],
    },
    "weighted": {
      "excludedVariations": ["banded", "stability ball"],
    },
    "banded": {
      "excludedVariations": ["stability ball", "weighted"],
    },
    "stability ball": {
      "excludedVariations": ["banded", "weighted"],
    },
  },
};
