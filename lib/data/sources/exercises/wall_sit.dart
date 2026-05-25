const Map<String, dynamic> wallSit = {
  "pk": "a9b82c9a-0d1e-4a63-f4b9-1c6e7a0a3d85",
  "name": "Wall Sit",
  "muscleGroups": ["Legs", "Core"],
  "primaryMuscles": ["quadriceps femoris"],
  "secondaryMuscles": ["gluteus maximus", "hamstrings"],
  "variations": {
    "bodyweight": {
      "excludedVariations": [
        "with press",
      ],
    },
    "single-leg": {
      "excludedVariations": [
        "heels-elevated",
        "marching",
      ],
    },
    "heels-elevated": {
      "excludedVariations": [
        "marching",
        "single-leg",
      ],
    },
    "with press": {
      "excludedVariations": [
        "bodyweight",
        "overhead hold",
      ],
    },
    "overhead hold": {
      "excludedVariations": [
        "with press",
      ],
    },
    "weighted": {
      "excludedVariations": ["banded"],
    },
    "banded": {
      "excludedVariations": ["weighted"],
    },
    "stability ball": {
      "excludedVariations": [],
    },
    "marching": {
      "excludedVariations": [
        "heels-elevated",
        "single-leg",
      ],
    },
  },
};
