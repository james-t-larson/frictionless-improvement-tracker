const Map<String, dynamic> kettlebellSwing = {
  "pk": "a1b04c1f-2d3e-4a85-f6b1-3c8e9a2d5f07",
  "name": "Kettlebell Swing",
  "muscleGroups": ["Back", "Legs"],
  "primaryMuscles": ["gluteus maximus", "hamstrings"],
  "secondaryMuscles": ["erector spinae", "anterior deltoid", "wrist flexors"],
  "variations": {
    "two-hand": {
      "excludedVariations": [
        "American",
        "ballistic",
        "dead swing",
        "high pull",
        "single-arm",
        "snatch-grip",
        "sumo",
      ],
    },
    "single-arm": {
      "excludedVariations": [
        "American",
        "ballistic",
        "dead swing",
        "high pull",
        "snatch-grip",
        "sumo",
        "two-hand",
      ],
    },
    "American": {
      "excludedVariations": [
        "ballistic",
        "dead swing",
        "high pull",
        "single-arm",
        "snatch-grip",
        "sumo",
        "two-hand",
      ],
    },
    "sumo": {
      "excludedVariations": [
        "American",
        "ballistic",
        "dead swing",
        "high pull",
        "single-arm",
        "snatch-grip",
        "two-hand",
      ],
    },
    "high pull": {
      "excludedVariations": [
        "American",
        "ballistic",
        "dead swing",
        "single-arm",
        "snatch-grip",
        "sumo",
        "two-hand",
      ],
    },
    "dead swing": {
      "excludedVariations": [
        "American",
        "ballistic",
        "high pull",
        "single-arm",
        "snatch-grip",
        "sumo",
        "two-hand",
      ],
    },
    "ballistic": {
      "excludedVariations": [
        "American",
        "dead swing",
        "high pull",
        "single-arm",
        "snatch-grip",
        "sumo",
        "two-hand",
      ],
    },
    "snatch-grip": {
      "excludedVariations": [
        "American",
        "ballistic",
        "dead swing",
        "high pull",
        "single-arm",
        "sumo",
        "two-hand",
      ],
    },
    "banded": {"excludedVariations": []},
  },
};
