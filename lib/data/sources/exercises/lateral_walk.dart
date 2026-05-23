const Map<String, dynamic> lateralWalk = {
  "pk": "c46c643f-d109-4720-8ce9-3b5d24b9cdec",
  "name": "Lateral Walk",
  "muscleGroups": ["Legs"],
  "primaryMuscles": ["gluteus maximus", "hip abductors"],
  "secondaryMuscles": [
    "gastrocnemius",
    "hamstrings",
    "quadriceps femoris",
    "hip adductors",
  ],
  "variations": {
    "wide-stance": {
      "excludedVariations": ["hip-level", "squat position"],
    },
    "squat position": {
      "excludedVariations": ["hip-level", "wide-stance"],
    },
    "hip-level": {
      "excludedVariations": ["squat position", "wide-stance"],
    },
    "band": {
      "excludedVariations": [
        "ankle weights",
        "barbell",
        "dumbbell",
        "kettlebell",
        "weighted vest",
      ],
    },
    "dumbbell": {
      "excludedVariations": [
        "ankle weights",
        "band",
        "barbell",
        "kettlebell",
        "weighted vest",
      ],
    },
    "kettlebell": {
      "excludedVariations": [
        "ankle weights",
        "band",
        "barbell",
        "dumbbell",
        "weighted vest",
      ],
    },
    "barbell": {
      "excludedVariations": [
        "ankle weights",
        "band",
        "dumbbell",
        "kettlebell",
        "weighted vest",
      ],
    },
    "weighted vest": {
      "excludedVariations": [
        "ankle weights",
        "band",
        "barbell",
        "dumbbell",
        "kettlebell",
      ],
    },
    "ankle weights": {
      "excludedVariations": [
        "band",
        "barbell",
        "dumbbell",
        "kettlebell",
        "weighted vest",
      ],
    },
  },
};
