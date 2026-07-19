const Map<String, dynamic> hipAbduction = {
  "pk": "7e95b8b5-a6eb-41b6-a3c9-ae06a9ba7ac4",
  "name": "Hip Abduction",
  "muscleGroups": ["Legs"],
  "primaryMuscles": ["hip abductors"],
  "secondaryMuscles": ["gluteus maximus"],
  "variations": {
    "standing": {
      "excludedVariations": [
        "clamshell",
        "fire hydrant",
        "seated",
        "side-lying",
        "dumbbell"
      ],
    },
    "seated": {
      "excludedVariations": [
        "clamshell",
        "fire hydrant",
        "side-lying",
        "standing",
        "ankle weight",
        "dumbbell"
      ],
    },
    "fire hydrant": {
      "excludedVariations": [
        "clamshell",
        "seated",
        "side-lying",
        "standing",
        "machine"
      ],
    },
    "clamshell": {
      "excludedVariations": [
        "fire hydrant",
        "seated",
        "side-lying",
        "standing",
        "machine"
      ],
    },
    "side-lying": {
      "excludedVariations": [
        "clamshell",
        "fire hydrant",
        "seated",
        "standing",
        "machine"
      ],
    },
    "machine": {
      "excludedVariations": [
        "banded",
        "cable",
        "ankle weight",
        "dumbbell",
        "clamshell",
        "fire hydrant",
        "side-lying"
      ],
    },
    "cable": {
      "excludedVariations": [
        "banded", 
        "machine", 
        "ankle weight", 
        "dumbbell"
      ],
    },
    "banded": {
      "excludedVariations": [
        "cable", 
        "machine", 
        "ankle weight", 
        "dumbbell"
      ],
    },
    "ankle weight": {
      "excludedVariations": [
        "banded", 
        "cable", 
        "machine", 
        "dumbbell", 
        "seated"
      ],
    },
    "dumbbell": {
      "excludedVariations": [
        "banded", 
        "cable", 
        "machine", 
        "ankle weight", 
        "seated", 
        "standing"
      ],
    }
  },
  "namedVariations": [
    {
      "name": "Machine Hip Abduction",
      "variations": ["machine"],
      "aliases": ["Hip Abduction Machine"],
    },
    {
      "name": "Clamshell",
      "variations": ["clamshell"],
    },
    {
      "name": "Fire Hydrant",
      "variations": ["fire hydrant"],
    },
  ],
};
