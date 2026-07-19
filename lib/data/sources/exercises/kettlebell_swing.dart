const Map<String, dynamic> kettlebellSwing = {
  "pk": "a1b04c1f-2d3e-4a85-f6b1-3c8e9a2d5f07",
  "name": "Kettlebell Swing",
  "muscleGroups": ["Back", "Legs"],
  "primaryMuscles": ["gluteus maximus", "hamstrings"],
  "secondaryMuscles": ["erector spinae", "anterior deltoid", "wrist flexors"],
  "variations": {
    "two-hand": {
      "excludedVariations": [
        "single-arm",
        "alternating",
        "double"
      ]
    },
    "single-arm": {
      "excludedVariations": [
        "two-hand",
        "alternating",
        "double",
        "American"
      ]
    },
    "alternating": {
      "excludedVariations": [
        "two-hand",
        "single-arm",
        "double",
        "American",
        "banded"
      ]
    },
    "double": {
      "excludedVariations": [
        "two-hand",
        "single-arm",
        "alternating",
        "American",
        "banded"
      ]
    },
    "American": {
      "excludedVariations": [
        "single-arm",
        "alternating",
        "double",
        "high pull",
        "banded"
      ]
    },
    "sumo": {
      "excludedVariations": []
    },
    "high pull": {
      "excludedVariations": [
        "American"
      ]
    },
    "dead swing": {
      "excludedVariations": []
    },
    "banded": {
      "excludedVariations": [
        "alternating",
        "double",
        "American"
      ]
    }
  },
  "namedVariations": [
    {
      "name": "American Kettlebell Swing",
      "variations": ["American"],
    },
  ],
};
