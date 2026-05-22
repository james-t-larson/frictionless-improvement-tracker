const String staticExerciseJson = r'''[
  {
    "pk": "1232d6bd-1b97-4c14-b8e6-de4a40cae8db",
    "name": "Pull-Up",
    "muscleGroups": [
      "Back"
    ],
    "primaryMuscles": [
      "latissimus dorsi"
    ],
    "secondaryMuscles": [
      "biceps brachii",
      "wrist flexors",
      "infraspinatus",
      "posterior deltoid"
    ],
    "variations": {
      "bodyweight": {
        "excludedVariations": [
          "L-sit",
          "archer",
          "behind-the-neck",
          "butterfly",
          "close-grip",
          "commando",
          "muscle-up",
          "neutral-grip",
          "typewriter",
          "wide-grip"
        ]
      },
      "neutral-grip": {
        "excludedVariations": [
          "L-sit",
          "archer",
          "behind-the-neck",
          "bodyweight",
          "butterfly",
          "close-grip",
          "commando",
          "muscle-up",
          "typewriter",
          "wide-grip"
        ]
      },
      "wide-grip": {
        "excludedVariations": [
          "L-sit",
          "archer",
          "behind-the-neck",
          "bodyweight",
          "butterfly",
          "close-grip",
          "commando",
          "muscle-up",
          "neutral-grip",
          "typewriter"
        ]
      },
      "close-grip": {
        "excludedVariations": [
          "L-sit",
          "archer",
          "behind-the-neck",
          "bodyweight",
          "butterfly",
          "commando",
          "muscle-up",
          "neutral-grip",
          "typewriter",
          "wide-grip"
        ]
      },
      "butterfly": {
        "excludedVariations": [
          "L-sit",
          "archer",
          "behind-the-neck",
          "bodyweight",
          "close-grip",
          "commando",
          "muscle-up",
          "neutral-grip",
          "typewriter",
          "wide-grip"
        ]
      },
      "archer": {
        "excludedVariations": [
          "L-sit",
          "behind-the-neck",
          "bodyweight",
          "butterfly",
          "close-grip",
          "commando",
          "muscle-up",
          "neutral-grip",
          "typewriter",
          "wide-grip"
        ]
      },
      "L-sit": {
        "excludedVariations": [
          "archer",
          "behind-the-neck",
          "bodyweight",
          "butterfly",
          "close-grip",
          "commando",
          "muscle-up",
          "neutral-grip",
          "typewriter",
          "wide-grip"
        ]
      },
      "typewriter": {
        "excludedVariations": [
          "L-sit",
          "archer",
          "behind-the-neck",
          "bodyweight",
          "butterfly",
          "close-grip",
          "commando",
          "muscle-up",
          "neutral-grip",
          "wide-grip"
        ]
      },
      "commando": {
        "excludedVariations": [
          "L-sit",
          "archer",
          "behind-the-neck",
          "bodyweight",
          "butterfly",
          "close-grip",
          "muscle-up",
          "neutral-grip",
          "typewriter",
          "wide-grip"
        ]
      },
      "behind-the-neck": {
        "excludedVariations": [
          "L-sit",
          "archer",
          "bodyweight",
          "butterfly",
          "close-grip",
          "commando",
          "muscle-up",
          "neutral-grip",
          "typewriter",
          "wide-grip"
        ]
      },
      "muscle-up": {
        "excludedVariations": [
          "L-sit",
          "archer",
          "behind-the-neck",
          "bodyweight",
          "butterfly",
          "close-grip",
          "commando",
          "neutral-grip",
          "typewriter",
          "wide-grip"
        ]
      },
      "weighted": {
        "excludedVariations": [
          "assisted",
          "kipping",
          "ring",
          "towel"
        ]
      },
      "assisted": {
        "excludedVariations": [
          "kipping",
          "ring",
          "towel",
          "weighted"
        ]
      },
      "kipping": {
        "excludedVariations": [
          "assisted",
          "ring",
          "towel",
          "weighted"
        ]
      },
      "ring": {
        "excludedVariations": [
          "assisted",
          "kipping",
          "towel",
          "weighted"
        ]
      },
      "towel": {
        "excludedVariations": [
          "assisted",
          "kipping",
          "ring",
          "weighted"
        ]
      }
    }
  },
  {
    "pk": "dc033c10-988c-4558-bf74-3ab5be6c59fc",
    "name": "Squat",
    "muscleGroups": [
      "Legs"
    ],
    "primaryMuscles": [
      "gluteus maximus",
      "erector spinae",
      "quadriceps femoris",
      "hip adductors"
    ],
    "secondaryMuscles": [
      "gastrocnemius"
    ],
    "variations": {
      "pause": {
        "excludedVariations": [
          "Bulgarian split",
          "anderson",
          "back",
          "bodyweight",
          "front",
          "heel-elevated",
          "high-bar",
          "low-bar",
          "narrow-stance",
          "overhead",
          "pistol",
          "split",
          "sumo",
          "tempo",
          "wide-stance",
          "zercher"
        ]
      },
      "bodyweight": {
        "excludedVariations": [
          "Bulgarian split",
          "anderson",
          "back",
          "front",
          "heel-elevated",
          "high-bar",
          "low-bar",
          "narrow-stance",
          "overhead",
          "pause",
          "pistol",
          "split",
          "sumo",
          "tempo",
          "wide-stance",
          "zercher"
        ]
      },
      "front": {
        "excludedVariations": [
          "Bulgarian split",
          "anderson",
          "back",
          "bodyweight",
          "heel-elevated",
          "high-bar",
          "low-bar",
          "narrow-stance",
          "overhead",
          "pause",
          "pistol",
          "split",
          "sumo",
          "tempo",
          "wide-stance",
          "zercher"
        ]
      },
      "back": {
        "excludedVariations": [
          "Bulgarian split",
          "anderson",
          "bodyweight",
          "front",
          "heel-elevated",
          "high-bar",
          "low-bar",
          "narrow-stance",
          "overhead",
          "pause",
          "pistol",
          "split",
          "sumo",
          "tempo",
          "wide-stance",
          "zercher"
        ]
      },
      "split": {
        "excludedVariations": [
          "Bulgarian split",
          "anderson",
          "back",
          "bodyweight",
          "front",
          "heel-elevated",
          "high-bar",
          "low-bar",
          "narrow-stance",
          "overhead",
          "pause",
          "pistol",
          "sumo",
          "tempo",
          "wide-stance",
          "zercher"
        ]
      },
      "Bulgarian split": {
        "excludedVariations": [
          "anderson",
          "back",
          "bodyweight",
          "front",
          "heel-elevated",
          "high-bar",
          "low-bar",
          "narrow-stance",
          "overhead",
          "pause",
          "pistol",
          "split",
          "sumo",
          "tempo",
          "wide-stance",
          "zercher"
        ]
      },
      "pistol": {
        "excludedVariations": [
          "Bulgarian split",
          "anderson",
          "back",
          "bodyweight",
          "front",
          "heel-elevated",
          "high-bar",
          "low-bar",
          "narrow-stance",
          "overhead",
          "pause",
          "split",
          "sumo",
          "tempo",
          "wide-stance",
          "zercher"
        ]
      },
      "zercher": {
        "excludedVariations": [
          "Bulgarian split",
          "anderson",
          "back",
          "bodyweight",
          "front",
          "heel-elevated",
          "high-bar",
          "low-bar",
          "narrow-stance",
          "overhead",
          "pause",
          "pistol",
          "split",
          "sumo",
          "tempo",
          "wide-stance"
        ]
      },
      "overhead": {
        "excludedVariations": [
          "Bulgarian split",
          "anderson",
          "back",
          "bodyweight",
          "front",
          "heel-elevated",
          "high-bar",
          "low-bar",
          "narrow-stance",
          "pause",
          "pistol",
          "split",
          "sumo",
          "tempo",
          "wide-stance",
          "zercher"
        ]
      },
      "heel-elevated": {
        "excludedVariations": [
          "Bulgarian split",
          "anderson",
          "back",
          "bodyweight",
          "front",
          "high-bar",
          "low-bar",
          "narrow-stance",
          "overhead",
          "pause",
          "pistol",
          "split",
          "sumo",
          "tempo",
          "wide-stance",
          "zercher"
        ]
      },
      "tempo": {
        "excludedVariations": [
          "Bulgarian split",
          "anderson",
          "back",
          "bodyweight",
          "front",
          "heel-elevated",
          "high-bar",
          "low-bar",
          "narrow-stance",
          "overhead",
          "pause",
          "pistol",
          "split",
          "sumo",
          "wide-stance",
          "zercher"
        ]
      },
      "anderson": {
        "excludedVariations": [
          "Bulgarian split",
          "back",
          "bodyweight",
          "front",
          "heel-elevated",
          "high-bar",
          "low-bar",
          "narrow-stance",
          "overhead",
          "pause",
          "pistol",
          "split",
          "sumo",
          "tempo",
          "wide-stance",
          "zercher"
        ]
      },
      "wide-stance": {
        "excludedVariations": [
          "Bulgarian split",
          "anderson",
          "back",
          "bodyweight",
          "front",
          "heel-elevated",
          "high-bar",
          "low-bar",
          "narrow-stance",
          "overhead",
          "pause",
          "pistol",
          "split",
          "sumo",
          "tempo",
          "zercher"
        ]
      },
      "narrow-stance": {
        "excludedVariations": [
          "Bulgarian split",
          "anderson",
          "back",
          "bodyweight",
          "front",
          "heel-elevated",
          "high-bar",
          "low-bar",
          "overhead",
          "pause",
          "pistol",
          "split",
          "sumo",
          "tempo",
          "wide-stance",
          "zercher"
        ]
      },
      "sumo": {
        "excludedVariations": [
          "Bulgarian split",
          "anderson",
          "back",
          "bodyweight",
          "front",
          "heel-elevated",
          "high-bar",
          "low-bar",
          "narrow-stance",
          "overhead",
          "pause",
          "pistol",
          "split",
          "tempo",
          "wide-stance",
          "zercher"
        ]
      },
      "low-bar": {
        "excludedVariations": [
          "Bulgarian split",
          "anderson",
          "back",
          "bodyweight",
          "front",
          "heel-elevated",
          "high-bar",
          "narrow-stance",
          "overhead",
          "pause",
          "pistol",
          "split",
          "sumo",
          "tempo",
          "wide-stance",
          "zercher"
        ]
      },
      "high-bar": {
        "excludedVariations": [
          "Bulgarian split",
          "anderson",
          "back",
          "bodyweight",
          "front",
          "heel-elevated",
          "low-bar",
          "narrow-stance",
          "overhead",
          "pause",
          "pistol",
          "split",
          "sumo",
          "tempo",
          "wide-stance",
          "zercher"
        ]
      },
      "landmine": {
        "excludedVariations": [
          "barbell",
          "belt",
          "box",
          "dumbbell",
          "goblet",
          "safety bar"
        ]
      },
      "belt": {
        "excludedVariations": [
          "barbell",
          "box",
          "dumbbell",
          "goblet",
          "landmine",
          "safety bar"
        ]
      },
      "barbell": {
        "excludedVariations": [
          "belt",
          "box",
          "dumbbell",
          "goblet",
          "landmine",
          "safety bar"
        ]
      },
      "dumbbell": {
        "excludedVariations": [
          "barbell",
          "belt",
          "box",
          "goblet",
          "landmine",
          "safety bar"
        ]
      },
      "goblet": {
        "excludedVariations": [
          "barbell",
          "belt",
          "box",
          "dumbbell",
          "landmine",
          "safety bar"
        ]
      },
      "box": {
        "excludedVariations": [
          "barbell",
          "belt",
          "dumbbell",
          "goblet",
          "landmine",
          "safety bar"
        ]
      },
      "safety bar": {
        "excludedVariations": [
          "barbell",
          "belt",
          "box",
          "dumbbell",
          "goblet",
          "landmine"
        ]
      }
    }
  },
  {
    "pk": "7a971512-0265-490a-8ac0-871c0e1013de",
    "name": "Push-Up",
    "slug": "push-up",
    "muscleGroups": [
      "Push",
      "Chest"
    ],
    "primaryMuscles": [
      "pectoralis major",
      "anterior deltoid",
      "triceps brachii"
    ],
    "secondaryMuscles": [
      "rectus abdominis"
    ],
    "variations": {
      "standard": {
        "excludedVariations": [
          "T",
          "archer",
          "clap",
          "close-grip",
          "decline",
          "deficit",
          "diamond",
          "hindu",
          "incline",
          "one-arm",
          "pike",
          "plyometric",
          "pseudo planche",
          "spiderman",
          "staggered",
          "wide-grip"
        ]
      },
      "decline": {
        "excludedVariations": [
          "T",
          "archer",
          "clap",
          "close-grip",
          "deficit",
          "diamond",
          "hindu",
          "incline",
          "one-arm",
          "pike",
          "plyometric",
          "pseudo planche",
          "spiderman",
          "staggered",
          "standard",
          "wide-grip"
        ]
      },
      "incline": {
        "excludedVariations": [
          "T",
          "archer",
          "clap",
          "close-grip",
          "decline",
          "deficit",
          "diamond",
          "hindu",
          "one-arm",
          "pike",
          "plyometric",
          "pseudo planche",
          "spiderman",
          "staggered",
          "standard",
          "wide-grip"
        ]
      },
      "wide-grip": {
        "excludedVariations": [
          "T",
          "archer",
          "clap",
          "close-grip",
          "decline",
          "deficit",
          "diamond",
          "hindu",
          "incline",
          "one-arm",
          "pike",
          "plyometric",
          "pseudo planche",
          "spiderman",
          "staggered",
          "standard"
        ]
      },
      "close-grip": {
        "excludedVariations": [
          "T",
          "archer",
          "clap",
          "decline",
          "deficit",
          "diamond",
          "hindu",
          "incline",
          "one-arm",
          "pike",
          "plyometric",
          "pseudo planche",
          "spiderman",
          "staggered",
          "standard",
          "wide-grip"
        ]
      },
      "diamond": {
        "excludedVariations": [
          "T",
          "archer",
          "clap",
          "close-grip",
          "decline",
          "deficit",
          "hindu",
          "incline",
          "one-arm",
          "pike",
          "plyometric",
          "pseudo planche",
          "spiderman",
          "staggered",
          "standard",
          "wide-grip"
        ]
      },
      "plyometric": {
        "excludedVariations": [
          "T",
          "archer",
          "clap",
          "close-grip",
          "decline",
          "deficit",
          "diamond",
          "hindu",
          "incline",
          "one-arm",
          "pike",
          "pseudo planche",
          "spiderman",
          "staggered",
          "standard",
          "wide-grip"
        ]
      },
      "archer": {
        "excludedVariations": [
          "T",
          "clap",
          "close-grip",
          "decline",
          "deficit",
          "diamond",
          "hindu",
          "incline",
          "one-arm",
          "pike",
          "plyometric",
          "pseudo planche",
          "spiderman",
          "staggered",
          "standard",
          "wide-grip"
        ]
      },
      "pike": {
        "excludedVariations": [
          "T",
          "archer",
          "clap",
          "close-grip",
          "decline",
          "deficit",
          "diamond",
          "hindu",
          "incline",
          "one-arm",
          "plyometric",
          "pseudo planche",
          "spiderman",
          "staggered",
          "standard",
          "wide-grip"
        ]
      },
      "spiderman": {
        "excludedVariations": [
          "T",
          "archer",
          "clap",
          "close-grip",
          "decline",
          "deficit",
          "diamond",
          "hindu",
          "incline",
          "one-arm",
          "pike",
          "plyometric",
          "pseudo planche",
          "staggered",
          "standard",
          "wide-grip"
        ]
      },
      "T": {
        "excludedVariations": [
          "archer",
          "clap",
          "close-grip",
          "decline",
          "deficit",
          "diamond",
          "hindu",
          "incline",
          "one-arm",
          "pike",
          "plyometric",
          "pseudo planche",
          "spiderman",
          "staggered",
          "standard",
          "wide-grip"
        ]
      },
      "staggered": {
        "excludedVariations": [
          "T",
          "archer",
          "clap",
          "close-grip",
          "decline",
          "deficit",
          "diamond",
          "hindu",
          "incline",
          "one-arm",
          "pike",
          "plyometric",
          "pseudo planche",
          "spiderman",
          "standard",
          "wide-grip"
        ]
      },
      "hindu": {
        "excludedVariations": [
          "T",
          "archer",
          "clap",
          "close-grip",
          "decline",
          "deficit",
          "diamond",
          "incline",
          "one-arm",
          "pike",
          "plyometric",
          "pseudo planche",
          "spiderman",
          "staggered",
          "standard",
          "wide-grip"
        ]
      },
      "one-arm": {
        "excludedVariations": [
          "T",
          "archer",
          "clap",
          "close-grip",
          "decline",
          "deficit",
          "diamond",
          "hindu",
          "incline",
          "pike",
          "plyometric",
          "pseudo planche",
          "spiderman",
          "staggered",
          "standard",
          "wide-grip"
        ]
      },
      "clap": {
        "excludedVariations": [
          "T",
          "archer",
          "close-grip",
          "decline",
          "deficit",
          "diamond",
          "hindu",
          "incline",
          "one-arm",
          "pike",
          "plyometric",
          "pseudo planche",
          "spiderman",
          "staggered",
          "standard",
          "wide-grip"
        ]
      },
      "pseudo planche": {
        "excludedVariations": [
          "T",
          "archer",
          "clap",
          "close-grip",
          "decline",
          "deficit",
          "diamond",
          "hindu",
          "incline",
          "one-arm",
          "pike",
          "plyometric",
          "spiderman",
          "staggered",
          "standard",
          "wide-grip"
        ]
      },
      "deficit": {
        "excludedVariations": [
          "T",
          "archer",
          "clap",
          "close-grip",
          "decline",
          "diamond",
          "hindu",
          "incline",
          "one-arm",
          "pike",
          "plyometric",
          "pseudo planche",
          "spiderman",
          "staggered",
          "standard",
          "wide-grip"
        ]
      },
      "feet-in-rings": {
        "excludedVariations": [
          "assisted",
          "ring",
          "weighted"
        ]
      },
      "weighted": {
        "excludedVariations": [
          "assisted",
          "feet-in-rings",
          "ring"
        ]
      },
      "assisted": {
        "excludedVariations": [
          "feet-in-rings",
          "ring",
          "weighted"
        ]
      },
      "ring": {
        "excludedVariations": [
          "assisted",
          "feet-in-rings",
          "weighted"
        ]
      }
    }
  },
  {
    "pk": "6bc882f1-29e7-44c0-99b4-a36a4c91fc08",
    "name": "Face Pull",
    "slug": "face-pull",
    "muscleGroups": [
      "Shoulders",
      "Back"
    ],
    "primaryMuscles": [
      "infraspinatus",
      "trapezius",
      "posterior deltoid"
    ],
    "secondaryMuscles": [
      "lateral deltoid",
      "wrist extensors"
    ],
    "variations": {
      "single-arm": {
        "excludedVariations": [
          "chest-level",
          "high-pulley",
          "kneeling",
          "low-pulley",
          "pronated",
          "seated"
        ]
      },
      "high-pulley": {
        "excludedVariations": [
          "chest-level",
          "kneeling",
          "low-pulley",
          "pronated",
          "seated",
          "single-arm"
        ]
      },
      "low-pulley": {
        "excludedVariations": [
          "chest-level",
          "high-pulley",
          "kneeling",
          "pronated",
          "seated",
          "single-arm"
        ]
      },
      "kneeling": {
        "excludedVariations": [
          "chest-level",
          "high-pulley",
          "low-pulley",
          "pronated",
          "seated",
          "single-arm"
        ]
      },
      "seated": {
        "excludedVariations": [
          "chest-level",
          "high-pulley",
          "kneeling",
          "low-pulley",
          "pronated",
          "single-arm"
        ]
      },
      "chest-level": {
        "excludedVariations": [
          "high-pulley",
          "kneeling",
          "low-pulley",
          "pronated",
          "seated",
          "single-arm"
        ]
      },
      "pronated": {
        "excludedVariations": [
          "chest-level",
          "high-pulley",
          "kneeling",
          "low-pulley",
          "seated",
          "single-arm"
        ]
      },
      "cable": {
        "excludedVariations": [
          "band",
          "rope",
          "supinated"
        ]
      },
      "band": {
        "excludedVariations": [
          "cable",
          "rope",
          "supinated"
        ]
      },
      "rope": {
        "excludedVariations": [
          "band",
          "cable",
          "supinated"
        ]
      },
      "supinated": {
        "excludedVariations": [
          "band",
          "cable",
          "rope"
        ]
      }
    }
  },
  {
    "pk": "23cf1e36-69e0-424b-8403-fc4e30de15da",
    "name": "Bench Press",
    "muscleGroups": [
      "Push",
      "Chest"
    ],
    "primaryMuscles": [
      "pectoralis major",
      "anterior deltoid"
    ],
    "secondaryMuscles": [
      "triceps brachii"
    ],
    "variations": {
      "incline": {
        "excludedVariations": [
          "close-grip",
          "decline",
          "feet-up",
          "floor",
          "larsen",
          "neutral-grip",
          "paused",
          "reverse-grip",
          "spoto",
          "tempo",
          "touch-and-go",
          "wide-grip"
        ]
      },
      "decline": {
        "excludedVariations": [
          "close-grip",
          "feet-up",
          "floor",
          "incline",
          "larsen",
          "neutral-grip",
          "paused",
          "reverse-grip",
          "spoto",
          "tempo",
          "touch-and-go",
          "wide-grip"
        ]
      },
      "close-grip": {
        "excludedVariations": [
          "decline",
          "feet-up",
          "floor",
          "incline",
          "larsen",
          "neutral-grip",
          "paused",
          "reverse-grip",
          "spoto",
          "tempo",
          "touch-and-go",
          "wide-grip"
        ]
      },
      "wide-grip": {
        "excludedVariations": [
          "close-grip",
          "decline",
          "feet-up",
          "floor",
          "incline",
          "larsen",
          "neutral-grip",
          "paused",
          "reverse-grip",
          "spoto",
          "tempo",
          "touch-and-go"
        ]
      },
      "neutral-grip": {
        "excludedVariations": [
          "close-grip",
          "decline",
          "feet-up",
          "floor",
          "incline",
          "larsen",
          "paused",
          "reverse-grip",
          "spoto",
          "tempo",
          "touch-and-go",
          "wide-grip"
        ]
      },
      "feet-up": {
        "excludedVariations": [
          "close-grip",
          "decline",
          "floor",
          "incline",
          "larsen",
          "neutral-grip",
          "paused",
          "reverse-grip",
          "spoto",
          "tempo",
          "touch-and-go",
          "wide-grip"
        ]
      },
      "paused": {
        "excludedVariations": [
          "close-grip",
          "decline",
          "feet-up",
          "floor",
          "incline",
          "larsen",
          "neutral-grip",
          "reverse-grip",
          "spoto",
          "tempo",
          "touch-and-go",
          "wide-grip"
        ]
      },
      "floor": {
        "excludedVariations": [
          "close-grip",
          "decline",
          "feet-up",
          "incline",
          "larsen",
          "neutral-grip",
          "paused",
          "reverse-grip",
          "spoto",
          "tempo",
          "touch-and-go",
          "wide-grip"
        ]
      },
      "reverse-grip": {
        "excludedVariations": [
          "close-grip",
          "decline",
          "feet-up",
          "floor",
          "incline",
          "larsen",
          "neutral-grip",
          "paused",
          "spoto",
          "tempo",
          "touch-and-go",
          "wide-grip"
        ]
      },
      "spoto": {
        "excludedVariations": [
          "close-grip",
          "decline",
          "feet-up",
          "floor",
          "incline",
          "larsen",
          "neutral-grip",
          "paused",
          "reverse-grip",
          "tempo",
          "touch-and-go",
          "wide-grip"
        ]
      },
      "touch-and-go": {
        "excludedVariations": [
          "close-grip",
          "decline",
          "feet-up",
          "floor",
          "incline",
          "larsen",
          "neutral-grip",
          "paused",
          "reverse-grip",
          "spoto",
          "tempo",
          "wide-grip"
        ]
      },
      "larsen": {
        "excludedVariations": [
          "close-grip",
          "decline",
          "feet-up",
          "floor",
          "incline",
          "neutral-grip",
          "paused",
          "reverse-grip",
          "spoto",
          "tempo",
          "touch-and-go",
          "wide-grip"
        ]
      },
      "tempo": {
        "excludedVariations": [
          "close-grip",
          "decline",
          "feet-up",
          "floor",
          "incline",
          "larsen",
          "neutral-grip",
          "paused",
          "reverse-grip",
          "spoto",
          "touch-and-go",
          "wide-grip"
        ]
      },
      "barbell": {
        "excludedVariations": [
          "axle bar",
          "banded",
          "board",
          "chains",
          "dumbbell",
          "pin",
          "slingshot",
          "smith machine"
        ]
      },
      "dumbbell": {
        "excludedVariations": [
          "axle bar",
          "banded",
          "barbell",
          "board",
          "chains",
          "pin",
          "slingshot",
          "smith machine"
        ]
      },
      "smith machine": {
        "excludedVariations": [
          "axle bar",
          "banded",
          "barbell",
          "board",
          "chains",
          "dumbbell",
          "pin",
          "slingshot"
        ]
      },
      "board": {
        "excludedVariations": [
          "axle bar",
          "banded",
          "barbell",
          "chains",
          "dumbbell",
          "pin",
          "slingshot",
          "smith machine"
        ]
      },
      "pin": {
        "excludedVariations": [
          "axle bar",
          "banded",
          "barbell",
          "board",
          "chains",
          "dumbbell",
          "slingshot",
          "smith machine"
        ]
      },
      "axle bar": {
        "excludedVariations": [
          "banded",
          "barbell",
          "board",
          "chains",
          "dumbbell",
          "pin",
          "slingshot",
          "smith machine"
        ]
      },
      "slingshot": {
        "excludedVariations": [
          "axle bar",
          "banded",
          "barbell",
          "board",
          "chains",
          "dumbbell",
          "pin",
          "smith machine"
        ]
      },
      "banded": {
        "excludedVariations": [
          "axle bar",
          "barbell",
          "board",
          "chains",
          "dumbbell",
          "pin",
          "slingshot",
          "smith machine"
        ]
      },
      "chains": {
        "excludedVariations": [
          "axle bar",
          "banded",
          "barbell",
          "board",
          "dumbbell",
          "pin",
          "slingshot",
          "smith machine"
        ]
      }
    }
  },
  {
    "pk": "ba2387cd-2192-42d5-8895-4c8ad78b3607",
    "name": "Deadlift",
    "muscleGroups": [
      "Back",
      "Legs"
    ],
    "primaryMuscles": [
      "gluteus maximus",
      "hamstrings",
      "erector spinae"
    ],
    "secondaryMuscles": [
      "gastrocnemius",
      "wrist flexors",
      "wrist extensors",
      "trapezius",
      "quadriceps femoris"
    ],
    "variations": {
      "sumo": {
        "excludedVariations": [
          "deficit",
          "paused",
          "rack-pull",
          "romainian",
          "single-leg",
          "snatch-grip",
          "stiff-leg"
        ]
      },
      "single-leg": {
        "excludedVariations": [
          "deficit",
          "paused",
          "rack-pull",
          "romainian",
          "snatch-grip",
          "stiff-leg",
          "sumo"
        ]
      },
      "romainian": {
        "excludedVariations": [
          "deficit",
          "paused",
          "rack-pull",
          "single-leg",
          "snatch-grip",
          "stiff-leg",
          "sumo"
        ]
      },
      "stiff-leg": {
        "excludedVariations": [
          "deficit",
          "paused",
          "rack-pull",
          "romainian",
          "single-leg",
          "snatch-grip",
          "sumo"
        ]
      },
      "rack-pull": {
        "excludedVariations": [
          "deficit",
          "paused",
          "romainian",
          "single-leg",
          "snatch-grip",
          "stiff-leg",
          "sumo"
        ]
      },
      "deficit": {
        "excludedVariations": [
          "paused",
          "rack-pull",
          "romainian",
          "single-leg",
          "snatch-grip",
          "stiff-leg",
          "sumo"
        ]
      },
      "paused": {
        "excludedVariations": [
          "deficit",
          "rack-pull",
          "romainian",
          "single-leg",
          "snatch-grip",
          "stiff-leg",
          "sumo"
        ]
      },
      "snatch-grip": {
        "excludedVariations": [
          "deficit",
          "paused",
          "rack-pull",
          "romainian",
          "single-leg",
          "stiff-leg",
          "sumo"
        ]
      },
      "barbell": {
        "excludedVariations": [
          "banded",
          "block-pull",
          "dumbbell",
          "hex-bar",
          "kettlebell",
          "straps",
          "trap bar"
        ]
      },
      "dumbbell": {
        "excludedVariations": [
          "banded",
          "barbell",
          "block-pull",
          "hex-bar",
          "kettlebell",
          "straps",
          "trap bar"
        ]
      },
      "kettlebell": {
        "excludedVariations": [
          "banded",
          "barbell",
          "block-pull",
          "dumbbell",
          "hex-bar",
          "straps",
          "trap bar"
        ]
      },
      "trap bar": {
        "excludedVariations": [
          "banded",
          "barbell",
          "block-pull",
          "dumbbell",
          "hex-bar",
          "kettlebell",
          "straps"
        ]
      },
      "hex-bar": {
        "excludedVariations": [
          "banded",
          "barbell",
          "block-pull",
          "dumbbell",
          "kettlebell",
          "straps",
          "trap bar"
        ]
      },
      "banded": {
        "excludedVariations": [
          "barbell",
          "block-pull",
          "dumbbell",
          "hex-bar",
          "kettlebell",
          "straps",
          "trap bar"
        ]
      },
      "block-pull": {
        "excludedVariations": [
          "banded",
          "barbell",
          "dumbbell",
          "hex-bar",
          "kettlebell",
          "straps",
          "trap bar"
        ]
      },
      "straps": {
        "excludedVariations": [
          "banded",
          "barbell",
          "block-pull",
          "dumbbell",
          "hex-bar",
          "kettlebell",
          "trap bar"
        ]
      }
    }
  },
  {
    "pk": "859b2211-9bb0-462b-987c-620a3e37d688",
    "name": "Leg Press",
    "muscleGroups": [
      "Legs"
    ],
    "primaryMuscles": [
      "gluteus maximus",
      "quadriceps femoris",
      "hip adductors"
    ],
    "secondaryMuscles": [
      "hamstrings"
    ],
    "variations": {
      "hack squat": {
        "excludedVariations": [
          "heel-elevated",
          "high-foot",
          "low-foot",
          "narrow-stance",
          "paused",
          "single-leg",
          "toe-elevated",
          "wide-stance"
        ]
      },
      "single-leg": {
        "excludedVariations": [
          "hack squat",
          "heel-elevated",
          "high-foot",
          "low-foot",
          "narrow-stance",
          "paused",
          "toe-elevated",
          "wide-stance"
        ]
      },
      "paused": {
        "excludedVariations": [
          "hack squat",
          "heel-elevated",
          "high-foot",
          "low-foot",
          "narrow-stance",
          "single-leg",
          "toe-elevated",
          "wide-stance"
        ]
      },
      "heel-elevated": {
        "excludedVariations": [
          "hack squat",
          "high-foot",
          "low-foot",
          "narrow-stance",
          "paused",
          "single-leg",
          "toe-elevated",
          "wide-stance"
        ]
      },
      "toe-elevated": {
        "excludedVariations": [
          "hack squat",
          "heel-elevated",
          "high-foot",
          "low-foot",
          "narrow-stance",
          "paused",
          "single-leg",
          "wide-stance"
        ]
      },
      "wide-stance": {
        "excludedVariations": [
          "hack squat",
          "heel-elevated",
          "high-foot",
          "low-foot",
          "narrow-stance",
          "paused",
          "single-leg",
          "toe-elevated"
        ]
      },
      "narrow-stance": {
        "excludedVariations": [
          "hack squat",
          "heel-elevated",
          "high-foot",
          "low-foot",
          "paused",
          "single-leg",
          "toe-elevated",
          "wide-stance"
        ]
      },
      "high-foot": {
        "excludedVariations": [
          "hack squat",
          "heel-elevated",
          "low-foot",
          "narrow-stance",
          "paused",
          "single-leg",
          "toe-elevated",
          "wide-stance"
        ]
      },
      "low-foot": {
        "excludedVariations": [
          "hack squat",
          "heel-elevated",
          "high-foot",
          "narrow-stance",
          "paused",
          "single-leg",
          "toe-elevated",
          "wide-stance"
        ]
      },
      "machine": {
        "excludedVariations": [
          "banded"
        ]
      },
      "banded": {
        "excludedVariations": [
          "machine"
        ]
      }
    }
  },
  {
    "pk": "2b9085c4-ad46-466b-acc9-f863a93dbaa9",
    "name": "Curl",
    "muscleGroups": [
      "Biceps",
      "Arms"
    ],
    "primaryMuscles": [
      "biceps brachii"
    ],
    "secondaryMuscles": [
      "wrist flexors"
    ],
    "variations": {
      "bodyweight": {
        "excludedVariations": [
          "21s",
          "EZ-bar",
          "alternating",
          "close-grip",
          "cross-body",
          "decline",
          "drag",
          "incline",
          "preacher",
          "reverse",
          "seated",
          "single-arm",
          "spider",
          "standing",
          "wide-grip",
          "zottman"
        ]
      },
      "preacher": {
        "excludedVariations": [
          "21s",
          "EZ-bar",
          "alternating",
          "bodyweight",
          "close-grip",
          "cross-body",
          "decline",
          "drag",
          "incline",
          "reverse",
          "seated",
          "single-arm",
          "spider",
          "standing",
          "wide-grip",
          "zottman"
        ]
      },
      "cross-body": {
        "excludedVariations": [
          "21s",
          "EZ-bar",
          "alternating",
          "bodyweight",
          "close-grip",
          "decline",
          "drag",
          "incline",
          "preacher",
          "reverse",
          "seated",
          "single-arm",
          "spider",
          "standing",
          "wide-grip",
          "zottman"
        ]
      },
      "single-arm": {
        "excludedVariations": [
          "21s",
          "EZ-bar",
          "alternating",
          "bodyweight",
          "close-grip",
          "cross-body",
          "decline",
          "drag",
          "incline",
          "preacher",
          "reverse",
          "seated",
          "spider",
          "standing",
          "wide-grip",
          "zottman"
        ]
      },
      "incline": {
        "excludedVariations": [
          "21s",
          "EZ-bar",
          "alternating",
          "bodyweight",
          "close-grip",
          "cross-body",
          "decline",
          "drag",
          "preacher",
          "reverse",
          "seated",
          "single-arm",
          "spider",
          "standing",
          "wide-grip",
          "zottman"
        ]
      },
      "decline": {
        "excludedVariations": [
          "21s",
          "EZ-bar",
          "alternating",
          "bodyweight",
          "close-grip",
          "cross-body",
          "drag",
          "incline",
          "preacher",
          "reverse",
          "seated",
          "single-arm",
          "spider",
          "standing",
          "wide-grip",
          "zottman"
        ]
      },
      "close-grip": {
        "excludedVariations": [
          "21s",
          "EZ-bar",
          "alternating",
          "bodyweight",
          "cross-body",
          "decline",
          "drag",
          "incline",
          "preacher",
          "reverse",
          "seated",
          "single-arm",
          "spider",
          "standing",
          "wide-grip",
          "zottman"
        ]
      },
      "wide-grip": {
        "excludedVariations": [
          "21s",
          "EZ-bar",
          "alternating",
          "bodyweight",
          "close-grip",
          "cross-body",
          "decline",
          "drag",
          "incline",
          "preacher",
          "reverse",
          "seated",
          "single-arm",
          "spider",
          "standing",
          "zottman"
        ]
      },
      "EZ-bar": {
        "excludedVariations": [
          "21s",
          "alternating",
          "bodyweight",
          "close-grip",
          "cross-body",
          "decline",
          "drag",
          "incline",
          "preacher",
          "reverse",
          "seated",
          "single-arm",
          "spider",
          "standing",
          "wide-grip",
          "zottman"
        ]
      },
      "zottman": {
        "excludedVariations": [
          "21s",
          "EZ-bar",
          "alternating",
          "bodyweight",
          "close-grip",
          "cross-body",
          "decline",
          "drag",
          "incline",
          "preacher",
          "reverse",
          "seated",
          "single-arm",
          "spider",
          "standing",
          "wide-grip"
        ]
      },
      "21s": {
        "excludedVariations": [
          "EZ-bar",
          "alternating",
          "bodyweight",
          "close-grip",
          "cross-body",
          "decline",
          "drag",
          "incline",
          "preacher",
          "reverse",
          "seated",
          "single-arm",
          "spider",
          "standing",
          "wide-grip",
          "zottman"
        ]
      },
      "spider": {
        "excludedVariations": [
          "21s",
          "EZ-bar",
          "alternating",
          "bodyweight",
          "close-grip",
          "cross-body",
          "decline",
          "drag",
          "incline",
          "preacher",
          "reverse",
          "seated",
          "single-arm",
          "standing",
          "wide-grip",
          "zottman"
        ]
      },
      "seated": {
        "excludedVariations": [
          "21s",
          "EZ-bar",
          "alternating",
          "bodyweight",
          "close-grip",
          "cross-body",
          "decline",
          "drag",
          "incline",
          "preacher",
          "reverse",
          "single-arm",
          "spider",
          "standing",
          "wide-grip",
          "zottman"
        ]
      },
      "standing": {
        "excludedVariations": [
          "21s",
          "EZ-bar",
          "alternating",
          "bodyweight",
          "close-grip",
          "cross-body",
          "decline",
          "drag",
          "incline",
          "preacher",
          "reverse",
          "seated",
          "single-arm",
          "spider",
          "wide-grip",
          "zottman"
        ]
      },
      "reverse": {
        "excludedVariations": [
          "21s",
          "EZ-bar",
          "alternating",
          "bodyweight",
          "close-grip",
          "cross-body",
          "decline",
          "drag",
          "incline",
          "preacher",
          "seated",
          "single-arm",
          "spider",
          "standing",
          "wide-grip",
          "zottman"
        ]
      },
      "drag": {
        "excludedVariations": [
          "21s",
          "EZ-bar",
          "alternating",
          "bodyweight",
          "close-grip",
          "cross-body",
          "decline",
          "incline",
          "preacher",
          "reverse",
          "seated",
          "single-arm",
          "spider",
          "standing",
          "wide-grip",
          "zottman"
        ]
      },
      "alternating": {
        "excludedVariations": [
          "21s",
          "EZ-bar",
          "bodyweight",
          "close-grip",
          "cross-body",
          "decline",
          "drag",
          "incline",
          "preacher",
          "reverse",
          "seated",
          "single-arm",
          "spider",
          "standing",
          "wide-grip",
          "zottman"
        ]
      },
      "barbell": {
        "excludedVariations": [
          "band",
          "cable",
          "dumbbell",
          "kettlebell",
          "machine",
          "rope"
        ]
      },
      "dumbbell": {
        "excludedVariations": [
          "band",
          "barbell",
          "cable",
          "kettlebell",
          "machine",
          "rope"
        ]
      },
      "rope": {
        "excludedVariations": [
          "band",
          "barbell",
          "cable",
          "dumbbell",
          "kettlebell",
          "machine"
        ]
      },
      "cable": {
        "excludedVariations": [
          "band",
          "barbell",
          "dumbbell",
          "kettlebell",
          "machine",
          "rope"
        ]
      },
      "machine": {
        "excludedVariations": [
          "band",
          "barbell",
          "cable",
          "dumbbell",
          "kettlebell",
          "rope"
        ]
      },
      "band": {
        "excludedVariations": [
          "barbell",
          "cable",
          "dumbbell",
          "kettlebell",
          "machine",
          "rope"
        ]
      },
      "kettlebell": {
        "excludedVariations": [
          "band",
          "barbell",
          "cable",
          "dumbbell",
          "machine",
          "rope"
        ]
      }
    }
  },
  {
    "pk": "8a96a73c-0c69-4102-a2c9-f103c8497e7e",
    "name": "Frog Pumps",
    "muscleGroups": [
      "Glutes"
    ],
    "primaryMuscles": [
      "gluteus maximus"
    ],
    "secondaryMuscles": [
      "hamstrings",
      "hip adductors"
    ],
    "variations": {
      "single-leg": {
        "excludedVariations": [
          "feet-elevated"
        ]
      },
      "feet-elevated": {
        "excludedVariations": [
          "single-leg"
        ]
      },
      "banded": {
        "excludedVariations": [
          "barbell",
          "dumbbell",
          "plate-weighted",
          "weighted"
        ]
      },
      "weighted": {
        "excludedVariations": [
          "banded",
          "barbell",
          "dumbbell",
          "plate-weighted"
        ]
      },
      "plate-weighted": {
        "excludedVariations": [
          "banded",
          "barbell",
          "dumbbell",
          "weighted"
        ]
      },
      "barbell": {
        "excludedVariations": [
          "banded",
          "dumbbell",
          "plate-weighted",
          "weighted"
        ]
      },
      "dumbbell": {
        "excludedVariations": [
          "banded",
          "barbell",
          "plate-weighted",
          "weighted"
        ]
      }
    }
  },
  {
    "pk": "37115036-6477-4046-96dc-5c48d077a201",
    "name": "Windshield Wiper",
    "muscleGroups": [
      "Core"
    ],
    "primaryMuscles": [
      "external obliques"
    ],
    "secondaryMuscles": [
      "rectus abdominis"
    ],
    "variations": {
      "single-leg": {
        "excludedVariations": [
          "bent-knee",
          "decline",
          "feet-elevated"
        ]
      },
      "bent-knee": {
        "excludedVariations": [
          "decline",
          "feet-elevated",
          "single-leg"
        ]
      },
      "feet-elevated": {
        "excludedVariations": [
          "bent-knee",
          "decline",
          "single-leg"
        ]
      },
      "decline": {
        "excludedVariations": [
          "bent-knee",
          "feet-elevated",
          "single-leg"
        ]
      },
      "weighted": {
        "excludedVariations": []
      }
    }
  },
  {
    "pk": "102850fa-8459-4cd0-81b5-88cc982d5de4",
    "name": "Dip",
    "muscleGroups": [
      "Push",
      "Chest",
      "Triceps"
    ],
    "primaryMuscles": [
      "pectoralis major",
      "triceps brachii"
    ],
    "secondaryMuscles": [
      "subscapularis",
      "anterior deltoid"
    ],
    "variations": {
      "bodyweight": {
        "excludedVariations": [
          "chest-forward",
          "korean",
          "single-arm",
          "upright"
        ]
      },
      "chest-forward": {
        "excludedVariations": [
          "bodyweight",
          "korean",
          "single-arm",
          "upright"
        ]
      },
      "upright": {
        "excludedVariations": [
          "bodyweight",
          "chest-forward",
          "korean",
          "single-arm"
        ]
      },
      "korean": {
        "excludedVariations": [
          "bodyweight",
          "chest-forward",
          "single-arm",
          "upright"
        ]
      },
      "single-arm": {
        "excludedVariations": [
          "bodyweight",
          "chest-forward",
          "korean",
          "upright"
        ]
      },
      "weighted": {
        "excludedVariations": [
          "assisted",
          "banded",
          "bench",
          "machine",
          "parallel bars",
          "rings"
        ]
      },
      "assisted": {
        "excludedVariations": [
          "banded",
          "bench",
          "machine",
          "parallel bars",
          "rings",
          "weighted"
        ]
      },
      "rings": {
        "excludedVariations": [
          "assisted",
          "banded",
          "bench",
          "machine",
          "parallel bars",
          "weighted"
        ]
      },
      "bench": {
        "excludedVariations": [
          "assisted",
          "banded",
          "machine",
          "parallel bars",
          "rings",
          "weighted"
        ]
      },
      "machine": {
        "excludedVariations": [
          "assisted",
          "banded",
          "bench",
          "parallel bars",
          "rings",
          "weighted"
        ]
      },
      "parallel bars": {
        "excludedVariations": [
          "assisted",
          "banded",
          "bench",
          "machine",
          "rings",
          "weighted"
        ]
      },
      "banded": {
        "excludedVariations": [
          "assisted",
          "bench",
          "machine",
          "parallel bars",
          "rings",
          "weighted"
        ]
      }
    }
  },
  {
    "pk": "3bc232a6-36f1-4322-948c-61c0df58cb15",
    "name": "Arnold Press",
    "muscleGroups": [
      "Shoulders"
    ],
    "primaryMuscles": [
      "posterior deltoid",
      "lateral deltoid"
    ],
    "secondaryMuscles": [],
    "variations": {
      "seated": {
        "excludedVariations": ["standing"]
      },
      "standing": {
        "excludedVariations": ["seated"]
      },
      "single-arm": {
        "excludedVariations": []
      },
      "alternating": {
        "excludedVariations": []
      },
      "dumbbell": {
        "excludedVariations": [
          "cable"
        ]
      },
      "cable": {
        "excludedVariations": [
          "dumbbell"
        ]
      }
    }
  },
  {
    "pk": "328b8330-4a04-4f43-a255-f17cba659635",
    "name": "Back Extension",
    "muscleGroups": [
      "Back",
      "Glutes"
    ],
    "primaryMuscles": [
      "gluteus maximus",
      "hamstrings",
      "erector spinae"
    ],
    "secondaryMuscles": [
      "rectus abdominis"
    ],
    "variations": {
      "floor": {
        "excludedVariations": [
          "45-degree",
          "GHD",
          "reverse",
          "single-leg"
        ]
      },
      "single-leg": {
        "excludedVariations": [
          "45-degree",
          "GHD",
          "floor",
          "reverse"
        ]
      },
      "45-degree": {
        "excludedVariations": [
          "GHD",
          "floor",
          "reverse",
          "single-leg"
        ]
      },
      "GHD": {
        "excludedVariations": [
          "45-degree",
          "floor",
          "reverse",
          "single-leg"
        ]
      },
      "reverse": {
        "excludedVariations": [
          "45-degree",
          "GHD",
          "floor",
          "single-leg"
        ]
      },
      "weighted": {
        "excludedVariations": [
          "band",
          "barbell",
          "dumbbell",
          "machine",
          "plate"
        ]
      },
      "machine": {
        "excludedVariations": [
          "band",
          "barbell",
          "dumbbell",
          "plate",
          "weighted"
        ]
      },
      "barbell": {
        "excludedVariations": [
          "band",
          "dumbbell",
          "machine",
          "plate",
          "weighted"
        ]
      },
      "band": {
        "excludedVariations": [
          "barbell",
          "dumbbell",
          "machine",
          "plate",
          "weighted"
        ]
      },
      "dumbbell": {
        "excludedVariations": [
          "band",
          "barbell",
          "machine",
          "plate",
          "weighted"
        ]
      },
      "plate": {
        "excludedVariations": [
          "band",
          "barbell",
          "dumbbell",
          "machine",
          "weighted"
        ]
      }
    }
  },
  {
    "pk": "ab0da03b-dd54-4a7f-bb06-40c866dfa88c",
    "name": "Glute Bridge",
    "muscleGroups": [
      "Glutes"
    ],
    "primaryMuscles": [
      "gluteus maximus",
      "hamstrings"
    ],
    "secondaryMuscles": [
      "hip adductors"
    ],
    "variations": {
      "single-leg": {
        "excludedVariations": [
          "double-leg",
          "feet-elevated"
        ]
      },
      "feet-elevated": {
        "excludedVariations": [
          "double-leg",
          "single-leg"
        ]
      },
      "double-leg": {
        "excludedVariations": [
          "feet-elevated",
          "single-leg"
        ]
      },
      "weighted": {
        "excludedVariations": [
          "banded",
          "barbell",
          "dumbbell",
          "kettlebell",
          "plate"
        ]
      },
      "banded": {
        "excludedVariations": [
          "barbell",
          "dumbbell",
          "kettlebell",
          "plate",
          "weighted"
        ]
      },
      "barbell": {
        "excludedVariations": [
          "banded",
          "dumbbell",
          "kettlebell",
          "plate",
          "weighted"
        ]
      },
      "plate": {
        "excludedVariations": [
          "banded",
          "barbell",
          "dumbbell",
          "kettlebell",
          "weighted"
        ]
      },
      "dumbbell": {
        "excludedVariations": [
          "banded",
          "barbell",
          "kettlebell",
          "plate",
          "weighted"
        ]
      },
      "kettlebell": {
        "excludedVariations": [
          "banded",
          "barbell",
          "dumbbell",
          "plate",
          "weighted"
        ]
      }
    }
  },
  {
    "pk": "cbbdaae8-7600-456f-b025-12d2050b3765",
    "name": "Leg Raise",
    "muscleGroups": [
      "Core"
    ],
    "primaryMuscles": [
      "rectus abdominis",
      "wrist flexors",
      "wrist extensors"
    ],
    "secondaryMuscles": [
      "external obliques"
    ],
    "variations": {
      "hanging": {
        "excludedVariations": [
          "flutter kick",
          "knee-raise",
          "lying",
          "single-leg",
          "toes-to-bar"
        ]
      },
      "lying": {
        "excludedVariations": [
          "flutter kick",
          "hanging",
          "knee-raise",
          "single-leg",
          "toes-to-bar"
        ]
      },
      "single-leg": {
        "excludedVariations": [
          "flutter kick",
          "hanging",
          "knee-raise",
          "lying",
          "toes-to-bar"
        ]
      },
      "knee-raise": {
        "excludedVariations": [
          "flutter kick",
          "hanging",
          "lying",
          "single-leg",
          "toes-to-bar"
        ]
      },
      "toes-to-bar": {
        "excludedVariations": [
          "flutter kick",
          "hanging",
          "knee-raise",
          "lying",
          "single-leg"
        ]
      },
      "flutter kick": {
        "excludedVariations": [
          "hanging",
          "knee-raise",
          "lying",
          "single-leg",
          "toes-to-bar"
        ]
      },
      "weighted": {
        "excludedVariations": [
          "band",
          "bench",
          "cable",
          "captain's chair",
          "incline bench"
        ]
      },
      "captain's chair": {
        "excludedVariations": [
          "band",
          "bench",
          "cable",
          "incline bench",
          "weighted"
        ]
      },
      "bench": {
        "excludedVariations": [
          "band",
          "cable",
          "captain's chair",
          "incline bench",
          "weighted"
        ]
      },
      "incline bench": {
        "excludedVariations": [
          "band",
          "bench",
          "cable",
          "captain's chair",
          "weighted"
        ]
      },
      "band": {
        "excludedVariations": [
          "bench",
          "cable",
          "captain's chair",
          "incline bench",
          "weighted"
        ]
      },
      "cable": {
        "excludedVariations": [
          "band",
          "bench",
          "captain's chair",
          "incline bench",
          "weighted"
        ]
      }
    }
  },
  {
    "pk": "7e703b05-364f-4847-af0f-a1a22aab19f6",
    "name": "Burpee",
    "muscleGroups": [
      "Legs",
      "Core"
    ],
    "primaryMuscles": [
      "pectoralis major",
      "gluteus maximus",
      "quadriceps femoris",
      "anterior deltoid",
      "lateral deltoid"
    ],
    "secondaryMuscles": [
      "rectus abdominis",
      "trapezius"
    ],
    "variations": {
      "single-leg": {
        "excludedVariations": [
          "half",
          "no-jump",
          "pull-up",
          "push-up",
          "tuck"
        ]
      },
      "pull-up": {
        "excludedVariations": [
          "half",
          "no-jump",
          "push-up",
          "single-leg",
          "tuck"
        ]
      },
      "no-jump": {
        "excludedVariations": [
          "half",
          "pull-up",
          "push-up",
          "single-leg",
          "tuck"
        ]
      },
      "push-up": {
        "excludedVariations": [
          "half",
          "no-jump",
          "pull-up",
          "single-leg",
          "tuck"
        ]
      },
      "tuck": {
        "excludedVariations": [
          "half",
          "no-jump",
          "pull-up",
          "push-up",
          "single-leg"
        ]
      },
      "half": {
        "excludedVariations": [
          "no-jump",
          "pull-up",
          "push-up",
          "single-leg",
          "tuck"
        ]
      },
      "bosu": {
        "excludedVariations": [
          "box jump",
          "dumbbell",
          "weighted"
        ]
      },
      "weighted": {
        "excludedVariations": [
          "bosu",
          "box jump",
          "dumbbell"
        ]
      },
      "box jump": {
        "excludedVariations": [
          "bosu",
          "dumbbell",
          "weighted"
        ]
      },
      "dumbbell": {
        "excludedVariations": [
          "bosu",
          "box jump",
          "weighted"
        ]
      }
    }
  },
  {
    "pk": "47d61f40-0743-47af-95a5-545a6a9a4824",
    "name": "Leg Extension",
    "muscleGroups": [
      "Legs"
    ],
    "primaryMuscles": [
      "quadriceps femoris"
    ],
    "secondaryMuscles": [],
    "variations": {
      "single-leg": {
        "excludedVariations": [
          "lying",
          "paused",
          "seated",
          "sissy squat",
          "tempo"
        ]
      },
      "seated": {
        "excludedVariations": [
          "lying",
          "paused",
          "single-leg",
          "sissy squat",
          "tempo"
        ]
      },
      "lying": {
        "excludedVariations": [
          "paused",
          "seated",
          "single-leg",
          "sissy squat",
          "tempo"
        ]
      },
      "sissy squat": {
        "excludedVariations": [
          "lying",
          "paused",
          "seated",
          "single-leg",
          "tempo"
        ]
      },
      "tempo": {
        "excludedVariations": [
          "lying",
          "paused",
          "seated",
          "single-leg",
          "sissy squat"
        ]
      },
      "paused": {
        "excludedVariations": [
          "lying",
          "seated",
          "single-leg",
          "sissy squat",
          "tempo"
        ]
      },
      "machine": {
        "excludedVariations": [
          "band",
          "cable"
        ]
      },
      "cable": {
        "excludedVariations": [
          "band",
          "machine"
        ]
      },
      "band": {
        "excludedVariations": [
          "cable",
          "machine"
        ]
      }
    }
  },
  {
    "pk": "7e95b8b5-a6eb-41b6-a3c9-ae06a9ba7ac4",
    "name": "Hip Abduction",
    "muscleGroups": [
      "Legs"
    ],
    "primaryMuscles": [
      "hip abductors"
    ],
    "secondaryMuscles": [
      "gluteus maximus"
    ],
    "variations": {
      "single-leg": {
        "excludedVariations": [
          "clamshell",
          "fire hydrant",
          "lying",
          "seated",
          "side-lying",
          "standing"
        ]
      },
      "standing": {
        "excludedVariations": [
          "clamshell",
          "fire hydrant",
          "lying",
          "seated",
          "side-lying",
          "single-leg"
        ]
      },
      "seated": {
        "excludedVariations": [
          "clamshell",
          "fire hydrant",
          "lying",
          "side-lying",
          "single-leg",
          "standing"
        ]
      },
      "lying": {
        "excludedVariations": [
          "clamshell",
          "fire hydrant",
          "seated",
          "side-lying",
          "single-leg",
          "standing"
        ]
      },
      "fire hydrant": {
        "excludedVariations": [
          "clamshell",
          "lying",
          "seated",
          "side-lying",
          "single-leg",
          "standing"
        ]
      },
      "clamshell": {
        "excludedVariations": [
          "fire hydrant",
          "lying",
          "seated",
          "side-lying",
          "single-leg",
          "standing"
        ]
      },
      "side-lying": {
        "excludedVariations": [
          "clamshell",
          "fire hydrant",
          "lying",
          "seated",
          "single-leg",
          "standing"
        ]
      },
      "machine": {
        "excludedVariations": [
          "banded",
          "cable"
        ]
      },
      "cable": {
        "excludedVariations": [
          "banded",
          "machine"
        ]
      },
      "banded": {
        "excludedVariations": [
          "cable",
          "machine"
        ]
      }
    }
  },
  {
    "pk": "a06410b6-c871-45c0-aee5-db6df750f494",
    "name": "Plank",
    "muscleGroups": [
      "Core"
    ],
    "primaryMuscles": [
      "rectus abdominis",
      "erector spinae"
    ],
    "secondaryMuscles": [
      "external obliques",
      "anterior deltoid"
    ],
    "variations": {
      "forearm": {
        "excludedVariations": [
          "RKC",
          "hands",
          "long-lever",
          "reach",
          "reverse",
          "side",
          "single-leg",
          "stir the pot",
          "suitcase"
        ]
      },
      "hands": {
        "excludedVariations": [
          "RKC",
          "forearm",
          "long-lever",
          "reach",
          "reverse",
          "side",
          "single-leg",
          "stir the pot",
          "suitcase"
        ]
      },
      "side": {
        "excludedVariations": [
          "RKC",
          "forearm",
          "hands",
          "long-lever",
          "reach",
          "reverse",
          "single-leg",
          "stir the pot",
          "suitcase"
        ]
      },
      "single-leg": {
        "excludedVariations": [
          "RKC",
          "forearm",
          "hands",
          "long-lever",
          "reach",
          "reverse",
          "side",
          "stir the pot",
          "suitcase"
        ]
      },
      "RKC": {
        "excludedVariations": [
          "forearm",
          "hands",
          "long-lever",
          "reach",
          "reverse",
          "side",
          "single-leg",
          "stir the pot",
          "suitcase"
        ]
      },
      "reach": {
        "excludedVariations": [
          "RKC",
          "forearm",
          "hands",
          "long-lever",
          "reverse",
          "side",
          "single-leg",
          "stir the pot",
          "suitcase"
        ]
      },
      "suitcase": {
        "excludedVariations": [
          "RKC",
          "forearm",
          "hands",
          "long-lever",
          "reach",
          "reverse",
          "side",
          "single-leg",
          "stir the pot"
        ]
      },
      "reverse": {
        "excludedVariations": [
          "RKC",
          "forearm",
          "hands",
          "long-lever",
          "reach",
          "side",
          "single-leg",
          "stir the pot",
          "suitcase"
        ]
      },
      "long-lever": {
        "excludedVariations": [
          "RKC",
          "forearm",
          "hands",
          "reach",
          "reverse",
          "side",
          "single-leg",
          "stir the pot",
          "suitcase"
        ]
      },
      "stir the pot": {
        "excludedVariations": [
          "RKC",
          "forearm",
          "hands",
          "long-lever",
          "reach",
          "reverse",
          "side",
          "single-leg",
          "suitcase"
        ]
      },
      "weighted": {
        "excludedVariations": [
          "band",
          "bosu"
        ]
      },
      "bosu": {
        "excludedVariations": [
          "band",
          "weighted"
        ]
      },
      "band": {
        "excludedVariations": [
          "bosu",
          "weighted"
        ]
      }
    }
  },
  {
    "pk": "dee8ca71-a01b-4ffd-b85e-426080e92f1e",
    "name": "Glute Kickback",
    "muscleGroups": [
      "Glutes"
    ],
    "primaryMuscles": [
      "gluteus maximus"
    ],
    "secondaryMuscles": [
      "hamstrings",
      "hip adductors"
    ],
    "variations": {
      "single-leg": {
        "excludedVariations": [
          "bent-knee",
          "donkey kick",
          "floor",
          "quadruped",
          "straight-leg"
        ]
      },
      "floor": {
        "excludedVariations": [
          "bent-knee",
          "donkey kick",
          "quadruped",
          "single-leg",
          "straight-leg"
        ]
      },
      "donkey kick": {
        "excludedVariations": [
          "bent-knee",
          "floor",
          "quadruped",
          "single-leg",
          "straight-leg"
        ]
      },
      "quadruped": {
        "excludedVariations": [
          "bent-knee",
          "donkey kick",
          "floor",
          "single-leg",
          "straight-leg"
        ]
      },
      "straight-leg": {
        "excludedVariations": [
          "bent-knee",
          "donkey kick",
          "floor",
          "quadruped",
          "single-leg"
        ]
      },
      "bent-knee": {
        "excludedVariations": [
          "donkey kick",
          "floor",
          "quadruped",
          "single-leg",
          "straight-leg"
        ]
      },
      "machine": {
        "excludedVariations": [
          "banded",
          "cable"
        ]
      },
      "cable": {
        "excludedVariations": [
          "banded",
          "machine"
        ]
      },
      "banded": {
        "excludedVariations": [
          "cable",
          "machine"
        ]
      }
    }
  },
  {
    "pk": "dce6d67f-877e-4595-9277-3a3f0f19dc46",
    "name": "Lunge",
    "muscleGroups": [
      "Legs"
    ],
    "primaryMuscles": [
      "gluteus maximus",
      "quadriceps femoris",
      "hip adductors"
    ],
    "secondaryMuscles": [
      "gastrocnemius"
    ],
    "variations": {
      "walking": {
        "excludedVariations": [
          "back",
          "bulgarian",
          "crossover",
          "curtsy",
          "deficit",
          "explosive",
          "front",
          "overhead",
          "paused",
          "pistol",
          "reverse",
          "side",
          "split",
          "suitcase",
          "tempo"
        ]
      },
      "reverse": {
        "excludedVariations": [
          "back",
          "bulgarian",
          "crossover",
          "curtsy",
          "deficit",
          "explosive",
          "front",
          "overhead",
          "paused",
          "pistol",
          "side",
          "split",
          "suitcase",
          "tempo",
          "walking"
        ]
      },
      "side": {
        "excludedVariations": [
          "back",
          "bulgarian",
          "crossover",
          "curtsy",
          "deficit",
          "explosive",
          "front",
          "overhead",
          "paused",
          "pistol",
          "reverse",
          "split",
          "suitcase",
          "tempo",
          "walking"
        ]
      },
      "curtsy": {
        "excludedVariations": [
          "back",
          "bulgarian",
          "crossover",
          "deficit",
          "explosive",
          "front",
          "overhead",
          "paused",
          "pistol",
          "reverse",
          "side",
          "split",
          "suitcase",
          "tempo",
          "walking"
        ]
      },
      "front": {
        "excludedVariations": [
          "back",
          "bulgarian",
          "crossover",
          "curtsy",
          "deficit",
          "explosive",
          "overhead",
          "paused",
          "pistol",
          "reverse",
          "side",
          "split",
          "suitcase",
          "tempo",
          "walking"
        ]
      },
      "back": {
        "excludedVariations": [
          "bulgarian",
          "crossover",
          "curtsy",
          "deficit",
          "explosive",
          "front",
          "overhead",
          "paused",
          "pistol",
          "reverse",
          "side",
          "split",
          "suitcase",
          "tempo",
          "walking"
        ]
      },
      "split": {
        "excludedVariations": [
          "back",
          "bulgarian",
          "crossover",
          "curtsy",
          "deficit",
          "explosive",
          "front",
          "overhead",
          "paused",
          "pistol",
          "reverse",
          "side",
          "suitcase",
          "tempo",
          "walking"
        ]
      },
      "bulgarian": {
        "excludedVariations": [
          "back",
          "crossover",
          "curtsy",
          "deficit",
          "explosive",
          "front",
          "overhead",
          "paused",
          "pistol",
          "reverse",
          "side",
          "split",
          "suitcase",
          "tempo",
          "walking"
        ]
      },
      "pistol": {
        "excludedVariations": [
          "back",
          "bulgarian",
          "crossover",
          "curtsy",
          "deficit",
          "explosive",
          "front",
          "overhead",
          "paused",
          "reverse",
          "side",
          "split",
          "suitcase",
          "tempo",
          "walking"
        ]
      },
      "deficit": {
        "excludedVariations": [
          "back",
          "bulgarian",
          "crossover",
          "curtsy",
          "explosive",
          "front",
          "overhead",
          "paused",
          "pistol",
          "reverse",
          "side",
          "split",
          "suitcase",
          "tempo",
          "walking"
        ]
      },
      "paused": {
        "excludedVariations": [
          "back",
          "bulgarian",
          "crossover",
          "curtsy",
          "deficit",
          "explosive",
          "front",
          "overhead",
          "pistol",
          "reverse",
          "side",
          "split",
          "suitcase",
          "tempo",
          "walking"
        ]
      },
      "tempo": {
        "excludedVariations": [
          "back",
          "bulgarian",
          "crossover",
          "curtsy",
          "deficit",
          "explosive",
          "front",
          "overhead",
          "paused",
          "pistol",
          "reverse",
          "side",
          "split",
          "suitcase",
          "walking"
        ]
      },
      "overhead": {
        "excludedVariations": [
          "back",
          "bulgarian",
          "crossover",
          "curtsy",
          "deficit",
          "explosive",
          "front",
          "paused",
          "pistol",
          "reverse",
          "side",
          "split",
          "suitcase",
          "tempo",
          "walking"
        ]
      },
      "suitcase": {
        "excludedVariations": [
          "back",
          "bulgarian",
          "crossover",
          "curtsy",
          "deficit",
          "explosive",
          "front",
          "overhead",
          "paused",
          "pistol",
          "reverse",
          "side",
          "split",
          "tempo",
          "walking"
        ]
      },
      "crossover": {
        "excludedVariations": [
          "back",
          "bulgarian",
          "curtsy",
          "deficit",
          "explosive",
          "front",
          "overhead",
          "paused",
          "pistol",
          "reverse",
          "side",
          "split",
          "suitcase",
          "tempo",
          "walking"
        ]
      },
      "explosive": {
        "excludedVariations": [
          "back",
          "bulgarian",
          "crossover",
          "curtsy",
          "deficit",
          "front",
          "overhead",
          "paused",
          "pistol",
          "reverse",
          "side",
          "split",
          "suitcase",
          "tempo",
          "walking"
        ]
      },
      "dumbbell": {
        "excludedVariations": [
          "banded",
          "barbell",
          "goblet",
          "kettlebell",
          "weighted vest"
        ]
      },
      "barbell": {
        "excludedVariations": [
          "banded",
          "dumbbell",
          "goblet",
          "kettlebell",
          "weighted vest"
        ]
      },
      "goblet": {
        "excludedVariations": [
          "banded",
          "barbell",
          "dumbbell",
          "kettlebell",
          "weighted vest"
        ]
      },
      "kettlebell": {
        "excludedVariations": [
          "banded",
          "barbell",
          "dumbbell",
          "goblet",
          "weighted vest"
        ]
      },
      "banded": {
        "excludedVariations": [
          "barbell",
          "dumbbell",
          "goblet",
          "kettlebell",
          "weighted vest"
        ]
      },
      "weighted vest": {
        "excludedVariations": [
          "banded",
          "barbell",
          "dumbbell",
          "goblet",
          "kettlebell"
        ]
      }
    }
  },
  {
    "pk": "ed36669e-3f5c-411d-8eab-8fb757a21e93",
    "name": "Medicine Ball Throw",
    "muscleGroups": [
      "Core"
    ],
    "primaryMuscles": [
      "external obliques"
    ],
    "secondaryMuscles": [
      "rectus abdominis",
      "anterior deltoid"
    ],
    "variations": {
      "rotational": {
        "excludedVariations": [
          "chest pass",
          "kneeling",
          "overhead",
          "partner",
          "scoop toss",
          "side throw",
          "slam",
          "squat throw",
          "wall ball"
        ]
      },
      "overhead": {
        "excludedVariations": [
          "chest pass",
          "kneeling",
          "partner",
          "rotational",
          "scoop toss",
          "side throw",
          "slam",
          "squat throw",
          "wall ball"
        ]
      },
      "chest pass": {
        "excludedVariations": [
          "kneeling",
          "overhead",
          "partner",
          "rotational",
          "scoop toss",
          "side throw",
          "slam",
          "squat throw",
          "wall ball"
        ]
      },
      "slam": {
        "excludedVariations": [
          "chest pass",
          "kneeling",
          "overhead",
          "partner",
          "rotational",
          "scoop toss",
          "side throw",
          "squat throw",
          "wall ball"
        ]
      },
      "wall ball": {
        "excludedVariations": [
          "chest pass",
          "kneeling",
          "overhead",
          "partner",
          "rotational",
          "scoop toss",
          "side throw",
          "slam",
          "squat throw"
        ]
      },
      "squat throw": {
        "excludedVariations": [
          "chest pass",
          "kneeling",
          "overhead",
          "partner",
          "rotational",
          "scoop toss",
          "side throw",
          "slam",
          "wall ball"
        ]
      },
      "kneeling": {
        "excludedVariations": [
          "chest pass",
          "overhead",
          "partner",
          "rotational",
          "scoop toss",
          "side throw",
          "slam",
          "squat throw",
          "wall ball"
        ]
      },
      "partner": {
        "excludedVariations": [
          "chest pass",
          "kneeling",
          "overhead",
          "rotational",
          "scoop toss",
          "side throw",
          "slam",
          "squat throw",
          "wall ball"
        ]
      },
      "side throw": {
        "excludedVariations": [
          "chest pass",
          "kneeling",
          "overhead",
          "partner",
          "rotational",
          "scoop toss",
          "slam",
          "squat throw",
          "wall ball"
        ]
      },
      "scoop toss": {
        "excludedVariations": [
          "chest pass",
          "kneeling",
          "overhead",
          "partner",
          "rotational",
          "side throw",
          "slam",
          "squat throw",
          "wall ball"
        ]
      }
    }
  },
  {
    "pk": "a40205d6-396c-4c0b-a4b9-8ffbef49ed32",
    "name": "Row",
    "muscleGroups": [
      "Back"
    ],
    "primaryMuscles": [
      "latissimus dorsi",
      "posterior deltoid",
      "trapezius"
    ],
    "secondaryMuscles": [
      "biceps brachii",
      "wrist flexors",
      "erector spinae",
      "infraspinatus",
      "subscapularis"
    ],
    "variations": {
      "t-bar": {
        "excludedVariations": [
          "chest-supported",
          "close-grip",
          "kroc",
          "neutral-grip",
          "overhand",
          "pause",
          "pendlay",
          "seated",
          "single-arm",
          "standing",
          "underhand",
          "wide-grip",
          "yates"
        ]
      },
      "pendlay": {
        "excludedVariations": [
          "chest-supported",
          "close-grip",
          "kroc",
          "neutral-grip",
          "overhand",
          "pause",
          "seated",
          "single-arm",
          "standing",
          "t-bar",
          "underhand",
          "wide-grip",
          "yates"
        ]
      },
      "chest-supported": {
        "excludedVariations": [
          "close-grip",
          "kroc",
          "neutral-grip",
          "overhand",
          "pause",
          "pendlay",
          "seated",
          "single-arm",
          "standing",
          "t-bar",
          "underhand",
          "wide-grip",
          "yates"
        ]
      },
      "seated": {
        "excludedVariations": [
          "chest-supported",
          "close-grip",
          "kroc",
          "neutral-grip",
          "overhand",
          "pause",
          "pendlay",
          "single-arm",
          "standing",
          "t-bar",
          "underhand",
          "wide-grip",
          "yates"
        ]
      },
      "standing": {
        "excludedVariations": [
          "chest-supported",
          "close-grip",
          "kroc",
          "neutral-grip",
          "overhand",
          "pause",
          "pendlay",
          "seated",
          "single-arm",
          "t-bar",
          "underhand",
          "wide-grip",
          "yates"
        ]
      },
      "single-arm": {
        "excludedVariations": [
          "chest-supported",
          "close-grip",
          "kroc",
          "neutral-grip",
          "overhand",
          "pause",
          "pendlay",
          "seated",
          "standing",
          "t-bar",
          "underhand",
          "wide-grip",
          "yates"
        ]
      },
      "wide-grip": {
        "excludedVariations": [
          "chest-supported",
          "close-grip",
          "kroc",
          "neutral-grip",
          "overhand",
          "pause",
          "pendlay",
          "seated",
          "single-arm",
          "standing",
          "t-bar",
          "underhand",
          "yates"
        ]
      },
      "close-grip": {
        "excludedVariations": [
          "chest-supported",
          "kroc",
          "neutral-grip",
          "overhand",
          "pause",
          "pendlay",
          "seated",
          "single-arm",
          "standing",
          "t-bar",
          "underhand",
          "wide-grip",
          "yates"
        ]
      },
      "neutral-grip": {
        "excludedVariations": [
          "chest-supported",
          "close-grip",
          "kroc",
          "overhand",
          "pause",
          "pendlay",
          "seated",
          "single-arm",
          "standing",
          "t-bar",
          "underhand",
          "wide-grip",
          "yates"
        ]
      },
      "overhand": {
        "excludedVariations": [
          "chest-supported",
          "close-grip",
          "kroc",
          "neutral-grip",
          "pause",
          "pendlay",
          "seated",
          "single-arm",
          "standing",
          "t-bar",
          "underhand",
          "wide-grip",
          "yates"
        ]
      },
      "underhand": {
        "excludedVariations": [
          "chest-supported",
          "close-grip",
          "kroc",
          "neutral-grip",
          "overhand",
          "pause",
          "pendlay",
          "seated",
          "single-arm",
          "standing",
          "t-bar",
          "wide-grip",
          "yates"
        ]
      },
      "kroc": {
        "excludedVariations": [
          "chest-supported",
          "close-grip",
          "neutral-grip",
          "overhand",
          "pause",
          "pendlay",
          "seated",
          "single-arm",
          "standing",
          "t-bar",
          "underhand",
          "wide-grip",
          "yates"
        ]
      },
      "yates": {
        "excludedVariations": [
          "chest-supported",
          "close-grip",
          "kroc",
          "neutral-grip",
          "overhand",
          "pause",
          "pendlay",
          "seated",
          "single-arm",
          "standing",
          "t-bar",
          "underhand",
          "wide-grip"
        ]
      },
      "pause": {
        "excludedVariations": [
          "chest-supported",
          "close-grip",
          "kroc",
          "neutral-grip",
          "overhand",
          "pendlay",
          "seated",
          "single-arm",
          "standing",
          "t-bar",
          "underhand",
          "wide-grip",
          "yates"
        ]
      },
      "dumbbell": {
        "excludedVariations": [
          "barbell",
          "cable",
          "landmine",
          "machine",
          "ring"
        ]
      },
      "barbell": {
        "excludedVariations": [
          "cable",
          "dumbbell",
          "landmine",
          "machine",
          "ring"
        ]
      },
      "cable": {
        "excludedVariations": [
          "barbell",
          "dumbbell",
          "landmine",
          "machine",
          "ring"
        ]
      },
      "machine": {
        "excludedVariations": [
          "barbell",
          "cable",
          "dumbbell",
          "landmine",
          "ring"
        ]
      },
      "landmine": {
        "excludedVariations": [
          "barbell",
          "cable",
          "dumbbell",
          "machine",
          "ring"
        ]
      },
      "ring": {
        "excludedVariations": [
          "barbell",
          "cable",
          "dumbbell",
          "landmine",
          "machine"
        ]
      }
    }
  },
  {
    "pk": "64c75731-36c2-45ae-b8c1-c8b481f34144",
    "name": "Shoulder Press",
    "muscleGroups": [
      "Push",
      "Shoulders"
    ],
    "primaryMuscles": [
      "anterior deltoid"
    ],
    "secondaryMuscles": [
      "lateral deltoid",
      "triceps brachii"
    ],
    "variations": {
      "single-arm": {
        "excludedVariations": [
          "Bradford",
          "alternating",
          "behind-the-neck",
          "paused",
          "push press",
          "seated",
          "standing"
        ]
      },
      "seated": {
        "excludedVariations": [
          "Bradford",
          "alternating",
          "behind-the-neck",
          "paused",
          "push press",
          "single-arm",
          "standing"
        ]
      },
      "standing": {
        "excludedVariations": [
          "Bradford",
          "alternating",
          "behind-the-neck",
          "paused",
          "push press",
          "seated",
          "single-arm"
        ]
      },
      "push press": {
        "excludedVariations": [
          "Bradford",
          "alternating",
          "behind-the-neck",
          "paused",
          "seated",
          "single-arm",
          "standing"
        ]
      },
      "behind-the-neck": {
        "excludedVariations": [
          "Bradford",
          "alternating",
          "paused",
          "push press",
          "seated",
          "single-arm",
          "standing"
        ]
      },
      "paused": {
        "excludedVariations": [
          "Bradford",
          "alternating",
          "behind-the-neck",
          "push press",
          "seated",
          "single-arm",
          "standing"
        ]
      },
      "Bradford": {
        "excludedVariations": [
          "alternating",
          "behind-the-neck",
          "paused",
          "push press",
          "seated",
          "single-arm",
          "standing"
        ]
      },
      "alternating": {
        "excludedVariations": [
          "Bradford",
          "behind-the-neck",
          "paused",
          "push press",
          "seated",
          "single-arm",
          "standing"
        ]
      },
      "dumbbell": {
        "excludedVariations": [
          "barbell",
          "cable",
          "kettlebell",
          "machine",
          "pin",
          "smith machine"
        ]
      },
      "barbell": {
        "excludedVariations": [
          "cable",
          "dumbbell",
          "kettlebell",
          "machine",
          "pin",
          "smith machine"
        ]
      },
      "smith machine": {
        "excludedVariations": [
          "barbell",
          "cable",
          "dumbbell",
          "kettlebell",
          "machine",
          "pin"
        ]
      },
      "machine": {
        "excludedVariations": [
          "barbell",
          "cable",
          "dumbbell",
          "kettlebell",
          "pin",
          "smith machine"
        ]
      },
      "kettlebell": {
        "excludedVariations": [
          "barbell",
          "cable",
          "dumbbell",
          "machine",
          "pin",
          "smith machine"
        ]
      },
      "pin": {
        "excludedVariations": [
          "barbell",
          "cable",
          "dumbbell",
          "kettlebell",
          "machine",
          "smith machine"
        ]
      },
      "cable": {
        "excludedVariations": [
          "barbell",
          "dumbbell",
          "kettlebell",
          "machine",
          "pin",
          "smith machine"
        ]
      }
    }
  },
  {
    "pk": "91ee79b7-397d-4b90-8988-9a41bff9d639",
    "name": "Upright Row",
    "muscleGroups": [
      "Shoulders",
      "Back"
    ],
    "primaryMuscles": [
      "lateral deltoid"
    ],
    "secondaryMuscles": [
      "biceps brachii",
      "anterior deltoid",
      "trapezius"
    ],
    "variations": {
      "wide-grip": {
        "excludedVariations": [
          "narrow-grip",
          "single-arm"
        ]
      },
      "narrow-grip": {
        "excludedVariations": [
          "single-arm",
          "wide-grip"
        ]
      },
      "single-arm": {
        "excludedVariations": [
          "narrow-grip",
          "wide-grip"
        ]
      },
      "barbell": {
        "excludedVariations": [
          "band",
          "cable",
          "dumbbell",
          "kettlebell",
          "smith machine"
        ]
      },
      "dumbbell": {
        "excludedVariations": [
          "band",
          "barbell",
          "cable",
          "kettlebell",
          "smith machine"
        ]
      },
      "cable": {
        "excludedVariations": [
          "band",
          "barbell",
          "dumbbell",
          "kettlebell",
          "smith machine"
        ]
      },
      "kettlebell": {
        "excludedVariations": [
          "band",
          "barbell",
          "cable",
          "dumbbell",
          "smith machine"
        ]
      },
      "smith machine": {
        "excludedVariations": [
          "band",
          "barbell",
          "cable",
          "dumbbell",
          "kettlebell"
        ]
      },
      "band": {
        "excludedVariations": [
          "barbell",
          "cable",
          "dumbbell",
          "kettlebell",
          "smith machine"
        ]
      }
    }
  },
  {
    "pk": "162433b9-39f3-4e3e-aad6-81736d44c1cf",
    "name": "Lateral Raise",
    "alternativeNames": [
      "Lateral Delt Fly",
      "Lateral Fly",
      "Lateral Delt Raise"
    ],
    "muscleGroups": [
      "Shoulders"
    ],
    "primaryMuscles": [
      "posterior deltoid",
      "trapezius"
    ],
    "secondaryMuscles": [
      "wrist flexors",
      "infraspinatus",
      "lateral deltoid",
      "latissimus dorsi"
    ],
    "variations": {
      "single-arm": {
        "excludedVariations": [
          "leaning",
          "lying",
          "partial",
          "seated"
        ]
      },
      "seated": {
        "excludedVariations": [
          "leaning",
          "lying",
          "partial",
          "single-arm"
        ]
      },
      "lying": {
        "excludedVariations": [
          "leaning",
          "partial",
          "seated",
          "single-arm"
        ]
      },
      "leaning": {
        "excludedVariations": [
          "lying",
          "partial",
          "seated",
          "single-arm"
        ]
      },
      "partial": {
        "excludedVariations": [
          "leaning",
          "lying",
          "seated",
          "single-arm"
        ]
      },
      "dumbbell": {
        "excludedVariations": [
          "band",
          "behind-the-back cable",
          "cable",
          "kettlebell",
          "machine"
        ]
      },
      "cable": {
        "excludedVariations": [
          "band",
          "behind-the-back cable",
          "dumbbell",
          "kettlebell",
          "machine"
        ]
      },
      "machine": {
        "excludedVariations": [
          "band",
          "behind-the-back cable",
          "cable",
          "dumbbell",
          "kettlebell"
        ]
      },
      "band": {
        "excludedVariations": [
          "behind-the-back cable",
          "cable",
          "dumbbell",
          "kettlebell",
          "machine"
        ]
      },
      "behind-the-back cable": {
        "excludedVariations": [
          "band",
          "cable",
          "dumbbell",
          "kettlebell",
          "machine"
        ]
      },
      "kettlebell": {
        "excludedVariations": [
          "band",
          "behind-the-back cable",
          "cable",
          "dumbbell",
          "machine"
        ]
      }
    }
  },
  {
    "pk": "162433b9-39f3-4e3e-aad6-81736d44c1cf",
    "name": "Rear Delt Fly",
    "alternativeNames": [
      "Rear Delt Raise"
    ],
    "muscleGroups": [
      "Shoulders",
      "Back"
    ],
    "primaryMuscles": [
      "posterior deltoid",
      "trapezius"
    ],
    "secondaryMuscles": [
      "wrist flexors",
      "infraspinatus",
      "lateral deltoid",
      "latissimus dorsi"
    ],
    "variations": {
      "single-arm": {
        "excludedVariations": [
          "bent-over",
          "lying",
          "reverse pec deck",
          "seated"
        ]
      },
      "bent-over": {
        "excludedVariations": [
          "lying",
          "reverse pec deck",
          "seated",
          "single-arm"
        ]
      },
      "seated": {
        "excludedVariations": [
          "bent-over",
          "lying",
          "reverse pec deck",
          "single-arm"
        ]
      },
      "reverse pec deck": {
        "excludedVariations": [
          "bent-over",
          "lying",
          "seated",
          "single-arm"
        ]
      },
      "lying": {
        "excludedVariations": [
          "bent-over",
          "reverse pec deck",
          "seated",
          "single-arm"
        ]
      },
      "dumbbell": {
        "excludedVariations": [
          "band",
          "cable",
          "incline bench",
          "machine"
        ]
      },
      "cable": {
        "excludedVariations": [
          "band",
          "dumbbell",
          "incline bench",
          "machine"
        ]
      },
      "machine": {
        "excludedVariations": [
          "band",
          "cable",
          "dumbbell",
          "incline bench"
        ]
      },
      "incline bench": {
        "excludedVariations": [
          "band",
          "cable",
          "dumbbell",
          "machine"
        ]
      },
      "band": {
        "excludedVariations": [
          "cable",
          "dumbbell",
          "incline bench",
          "machine"
        ]
      }
    }
  },
  {
    "pk": "e8dc87a4-79e1-4114-90a4-418a4b67359f",
    "name": "Shrugs",
    "muscleGroups": [
      "Shoulders",
      "Back"
    ],
    "primaryMuscles": [
      "posterior deltoid",
      "trapezius"
    ],
    "secondaryMuscles": [
      "wrist flexors",
      "infraspinatus",
      "lateral deltoid",
      "latissimus dorsi"
    ],
    "variations": {
      "single-arm": {
        "excludedVariations": [
          "behind-the-back",
          "overhead"
        ]
      },
      "behind-the-back": {
        "excludedVariations": [
          "overhead",
          "single-arm"
        ]
      },
      "overhead": {
        "excludedVariations": [
          "behind-the-back",
          "single-arm"
        ]
      },
      "dumbbell": {
        "excludedVariations": [
          "band",
          "barbell",
          "cable",
          "kettlebell",
          "machine",
          "smith machine",
          "trap bar"
        ]
      },
      "barbell": {
        "excludedVariations": [
          "band",
          "cable",
          "dumbbell",
          "kettlebell",
          "machine",
          "smith machine",
          "trap bar"
        ]
      },
      "cable": {
        "excludedVariations": [
          "band",
          "barbell",
          "dumbbell",
          "kettlebell",
          "machine",
          "smith machine",
          "trap bar"
        ]
      },
      "machine": {
        "excludedVariations": [
          "band",
          "barbell",
          "cable",
          "dumbbell",
          "kettlebell",
          "smith machine",
          "trap bar"
        ]
      },
      "kettlebell": {
        "excludedVariations": [
          "band",
          "barbell",
          "cable",
          "dumbbell",
          "machine",
          "smith machine",
          "trap bar"
        ]
      },
      "trap bar": {
        "excludedVariations": [
          "band",
          "barbell",
          "cable",
          "dumbbell",
          "kettlebell",
          "machine",
          "smith machine"
        ]
      },
      "smith machine": {
        "excludedVariations": [
          "band",
          "barbell",
          "cable",
          "dumbbell",
          "kettlebell",
          "machine",
          "trap bar"
        ]
      },
      "band": {
        "excludedVariations": [
          "barbell",
          "cable",
          "dumbbell",
          "kettlebell",
          "machine",
          "smith machine",
          "trap bar"
        ]
      }
    }
  },
  {
    "pk": "e8dc87a4-79e1-4114-90a4-418a4b67359f",
    "name": "Front Delt Raise",
    "alternativeNames": [
      "Front Delt Fly"
    ],
    "muscleGroups": [
      "Shoulders"
    ],
    "primaryMuscles": [
      "posterior deltoid",
      "trapezius"
    ],
    "secondaryMuscles": [
      "wrist flexors",
      "infraspinatus",
      "lateral deltoid",
      "latissimus dorsi"
    ],
    "variations": {
      "single-arm": {
        "excludedVariations": [
          "incline",
          "prone",
          "seated"
        ]
      },
      "incline": {
        "excludedVariations": [
          "prone",
          "seated",
          "single-arm"
        ]
      },
      "prone": {
        "excludedVariations": [
          "incline",
          "seated",
          "single-arm"
        ]
      },
      "seated": {
        "excludedVariations": [
          "incline",
          "prone",
          "single-arm"
        ]
      },
      "dumbbell": {
        "excludedVariations": [
          "band",
          "barbell",
          "cable",
          "machine",
          "plate"
        ]
      },
      "cable": {
        "excludedVariations": [
          "band",
          "barbell",
          "dumbbell",
          "machine",
          "plate"
        ]
      },
      "machine": {
        "excludedVariations": [
          "band",
          "barbell",
          "cable",
          "dumbbell",
          "plate"
        ]
      },
      "barbell": {
        "excludedVariations": [
          "band",
          "cable",
          "dumbbell",
          "machine",
          "plate"
        ]
      },
      "plate": {
        "excludedVariations": [
          "band",
          "barbell",
          "cable",
          "dumbbell",
          "machine"
        ]
      },
      "band": {
        "excludedVariations": [
          "barbell",
          "cable",
          "dumbbell",
          "machine",
          "plate"
        ]
      }
    }
  },
  {
    "pk": "e8dc87a4-79e1-4114-90a4-418a4b67359f",
    "name": "Rear Delt Row",
    "muscleGroups": [
      "Shoulders",
      "Back"
    ],
    "primaryMuscles": [
      "posterior deltoid",
      "trapezius"
    ],
    "secondaryMuscles": [
      "wrist flexors",
      "infraspinatus",
      "lateral deltoid",
      "latissimus dorsi"
    ],
    "variations": {
      "single-arm": {
        "excludedVariations": [
          "close-grip",
          "prone",
          "wide-grip"
        ]
      },
      "prone": {
        "excludedVariations": [
          "close-grip",
          "single-arm",
          "wide-grip"
        ]
      },
      "wide-grip": {
        "excludedVariations": [
          "close-grip",
          "prone",
          "single-arm"
        ]
      },
      "close-grip": {
        "excludedVariations": [
          "prone",
          "single-arm",
          "wide-grip"
        ]
      },
      "dumbbell": {
        "excludedVariations": [
          "band",
          "barbell",
          "cable",
          "kettlebell",
          "machine"
        ]
      },
      "barbell": {
        "excludedVariations": [
          "band",
          "cable",
          "dumbbell",
          "kettlebell",
          "machine"
        ]
      },
      "cable": {
        "excludedVariations": [
          "band",
          "barbell",
          "dumbbell",
          "kettlebell",
          "machine"
        ]
      },
      "machine": {
        "excludedVariations": [
          "band",
          "barbell",
          "cable",
          "dumbbell",
          "kettlebell"
        ]
      },
      "band": {
        "excludedVariations": [
          "barbell",
          "cable",
          "dumbbell",
          "kettlebell",
          "machine"
        ]
      },
      "kettlebell": {
        "excludedVariations": [
          "band",
          "barbell",
          "cable",
          "dumbbell",
          "machine"
        ]
      }
    }
  },
  {
    "pk": "c5116ba3-8a9d-4318-80e5-678a927cf916",
    "name": "Floor Press",
    "muscleGroups": [
      "Push",
      "Chest"
    ],
    "primaryMuscles": [
      "pectoralis major",
      "anterior deltoid"
    ],
    "secondaryMuscles": [
      "triceps brachii"
    ],
    "variations": {
      "single-arm": {
        "excludedVariations": [
          "close-grip",
          "neutral-grip",
          "paused"
        ]
      },
      "close-grip": {
        "excludedVariations": [
          "neutral-grip",
          "paused",
          "single-arm"
        ]
      },
      "paused": {
        "excludedVariations": [
          "close-grip",
          "neutral-grip",
          "single-arm"
        ]
      },
      "neutral-grip": {
        "excludedVariations": [
          "close-grip",
          "paused",
          "single-arm"
        ]
      },
      "dumbbell": {
        "excludedVariations": [
          "banded",
          "barbell",
          "kettlebell"
        ]
      },
      "barbell": {
        "excludedVariations": [
          "banded",
          "dumbbell",
          "kettlebell"
        ]
      },
      "kettlebell": {
        "excludedVariations": [
          "banded",
          "barbell",
          "dumbbell"
        ]
      },
      "banded": {
        "excludedVariations": [
          "barbell",
          "dumbbell",
          "kettlebell"
        ]
      }
    }
  },
  {
    "pk": "8431323c-ca05-4424-9e2f-995e85f4f9e3",
    "name": "Power Clean",
    "muscleGroups": [
      "Back"
    ],
    "primaryMuscles": [
      "gluteus maximus",
      "erector spinae"
    ],
    "secondaryMuscles": [
      "wrist extensors",
      "hamstrings",
      "hip adductors",
      "trapezius"
    ],
    "variations": {
      "hang": {
        "excludedVariations": [
          "clean and jerk",
          "clean and press",
          "clean and push jerk",
          "clean and push press",
          "close-grip",
          "low-hang",
          "mid-thigh",
          "pause at knee",
          "paused",
          "sumo",
          "tall",
          "wide-grip"
        ]
      },
      "wide-grip": {
        "excludedVariations": [
          "clean and jerk",
          "clean and press",
          "clean and push jerk",
          "clean and push press",
          "close-grip",
          "hang",
          "low-hang",
          "mid-thigh",
          "pause at knee",
          "paused",
          "sumo",
          "tall"
        ]
      },
      "clean and press": {
        "excludedVariations": [
          "clean and jerk",
          "clean and push jerk",
          "clean and push press",
          "close-grip",
          "hang",
          "low-hang",
          "mid-thigh",
          "pause at knee",
          "paused",
          "sumo",
          "tall",
          "wide-grip"
        ]
      },
      "clean and jerk": {
        "excludedVariations": [
          "clean and press",
          "clean and push jerk",
          "clean and push press",
          "close-grip",
          "hang",
          "low-hang",
          "mid-thigh",
          "pause at knee",
          "paused",
          "sumo",
          "tall",
          "wide-grip"
        ]
      },
      "close-grip": {
        "excludedVariations": [
          "clean and jerk",
          "clean and press",
          "clean and push jerk",
          "clean and push press",
          "hang",
          "low-hang",
          "mid-thigh",
          "pause at knee",
          "paused",
          "sumo",
          "tall",
          "wide-grip"
        ]
      },
      "sumo": {
        "excludedVariations": [
          "clean and jerk",
          "clean and press",
          "clean and push jerk",
          "clean and push press",
          "close-grip",
          "hang",
          "low-hang",
          "mid-thigh",
          "pause at knee",
          "paused",
          "tall",
          "wide-grip"
        ]
      },
      "clean and push press": {
        "excludedVariations": [
          "clean and jerk",
          "clean and press",
          "clean and push jerk",
          "close-grip",
          "hang",
          "low-hang",
          "mid-thigh",
          "pause at knee",
          "paused",
          "sumo",
          "tall",
          "wide-grip"
        ]
      },
      "clean and push jerk": {
        "excludedVariations": [
          "clean and jerk",
          "clean and press",
          "clean and push press",
          "close-grip",
          "hang",
          "low-hang",
          "mid-thigh",
          "pause at knee",
          "paused",
          "sumo",
          "tall",
          "wide-grip"
        ]
      },
      "tall": {
        "excludedVariations": [
          "clean and jerk",
          "clean and press",
          "clean and push jerk",
          "clean and push press",
          "close-grip",
          "hang",
          "low-hang",
          "mid-thigh",
          "pause at knee",
          "paused",
          "sumo",
          "wide-grip"
        ]
      },
      "low-hang": {
        "excludedVariations": [
          "clean and jerk",
          "clean and press",
          "clean and push jerk",
          "clean and push press",
          "close-grip",
          "hang",
          "mid-thigh",
          "pause at knee",
          "paused",
          "sumo",
          "tall",
          "wide-grip"
        ]
      },
      "mid-thigh": {
        "excludedVariations": [
          "clean and jerk",
          "clean and press",
          "clean and push jerk",
          "clean and push press",
          "close-grip",
          "hang",
          "low-hang",
          "pause at knee",
          "paused",
          "sumo",
          "tall",
          "wide-grip"
        ]
      },
      "paused": {
        "excludedVariations": [
          "clean and jerk",
          "clean and press",
          "clean and push jerk",
          "clean and push press",
          "close-grip",
          "hang",
          "low-hang",
          "mid-thigh",
          "pause at knee",
          "sumo",
          "tall",
          "wide-grip"
        ]
      },
      "pause at knee": {
        "excludedVariations": [
          "clean and jerk",
          "clean and press",
          "clean and push jerk",
          "clean and push press",
          "close-grip",
          "hang",
          "low-hang",
          "mid-thigh",
          "paused",
          "sumo",
          "tall",
          "wide-grip"
        ]
      },
      "dumbbell": {
        "excludedVariations": [
          "block",
          "kettlebell"
        ]
      },
      "kettlebell": {
        "excludedVariations": [
          "block",
          "dumbbell"
        ]
      },
      "block": {
        "excludedVariations": [
          "dumbbell",
          "kettlebell"
        ]
      }
    }
  },
  {
    "pk": "e4ada608-1354-43e6-99cb-c7af0c76edde",
    "name": "V-Up",
    "muscleGroups": [
      "Core"
    ],
    "primaryMuscles": [
      "rectus abdominis"
    ],
    "secondaryMuscles": [],
    "variations": {
      "single-leg": {
        "excludedVariations": [
          "bent-knee",
          "full",
          "hollow body",
          "tuck"
        ]
      },
      "bent-knee": {
        "excludedVariations": [
          "full",
          "hollow body",
          "single-leg",
          "tuck"
        ]
      },
      "hollow body": {
        "excludedVariations": [
          "bent-knee",
          "full",
          "single-leg",
          "tuck"
        ]
      },
      "tuck": {
        "excludedVariations": [
          "bent-knee",
          "full",
          "hollow body",
          "single-leg"
        ]
      },
      "full": {
        "excludedVariations": [
          "bent-knee",
          "hollow body",
          "single-leg",
          "tuck"
        ]
      },
      "weighted": {
        "excludedVariations": [
          "band-resisted"
        ]
      },
      "band-resisted": {
        "excludedVariations": [
          "weighted"
        ]
      }
    }
  },
  {
    "pk": "288eae8d-af58-42db-9f10-16b599e11876",
    "name": "Hack Squat",
    "muscleGroups": [
      "Legs"
    ],
    "primaryMuscles": [
      "quadriceps femoris"
    ],
    "secondaryMuscles": [
      "gastrocnemius",
      "wrist flexors",
      "gluteus maximus",
      "erector spinae",
      "hip adductors",
      "trapezius"
    ],
    "variations": {
      "reverse": {
        "excludedVariations": [
          "heel-elevated",
          "narrow-stance",
          "paused",
          "wide-stance"
        ]
      },
      "narrow-stance": {
        "excludedVariations": [
          "heel-elevated",
          "paused",
          "reverse",
          "wide-stance"
        ]
      },
      "wide-stance": {
        "excludedVariations": [
          "heel-elevated",
          "narrow-stance",
          "paused",
          "reverse"
        ]
      },
      "paused": {
        "excludedVariations": [
          "heel-elevated",
          "narrow-stance",
          "reverse",
          "wide-stance"
        ]
      },
      "heel-elevated": {
        "excludedVariations": [
          "narrow-stance",
          "paused",
          "reverse",
          "wide-stance"
        ]
      },
      "barbell": {
        "excludedVariations": [
          "banded",
          "dumbbell",
          "machine",
          "safety bar",
          "smith machine"
        ]
      },
      "dumbbell": {
        "excludedVariations": [
          "banded",
          "barbell",
          "machine",
          "safety bar",
          "smith machine"
        ]
      },
      "machine": {
        "excludedVariations": [
          "banded",
          "barbell",
          "dumbbell",
          "safety bar",
          "smith machine"
        ]
      },
      "smith machine": {
        "excludedVariations": [
          "banded",
          "barbell",
          "dumbbell",
          "machine",
          "safety bar"
        ]
      },
      "banded": {
        "excludedVariations": [
          "barbell",
          "dumbbell",
          "machine",
          "safety bar",
          "smith machine"
        ]
      },
      "safety bar": {
        "excludedVariations": [
          "banded",
          "barbell",
          "dumbbell",
          "machine",
          "smith machine"
        ]
      }
    }
  },
  {
    "pk": "a189b026-3641-426f-b9a2-d32678ccb99f",
    "name": "Lat Pulldown",
    "muscleGroups": [
      "Back"
    ],
    "primaryMuscles": [
      "latissimus dorsi"
    ],
    "secondaryMuscles": [
      "infraspinatus",
      "subscapularis",
      "posterior deltoid"
    ],
    "variations": {
      "straight arm": {
        "excludedVariations": [
          "bar",
          "bent-arm",
          "close-grip",
          "kneeling",
          "neutral-grip",
          "overhand-grip",
          "seated",
          "single-arm",
          "standing",
          "underhand-grip",
          "wide-grip"
        ]
      },
      "single-arm": {
        "excludedVariations": [
          "bar",
          "bent-arm",
          "close-grip",
          "kneeling",
          "neutral-grip",
          "overhand-grip",
          "seated",
          "standing",
          "straight arm",
          "underhand-grip",
          "wide-grip"
        ]
      },
      "seated": {
        "excludedVariations": [
          "bar",
          "bent-arm",
          "close-grip",
          "kneeling",
          "neutral-grip",
          "overhand-grip",
          "single-arm",
          "standing",
          "straight arm",
          "underhand-grip",
          "wide-grip"
        ]
      },
      "standing": {
        "excludedVariations": [
          "bar",
          "bent-arm",
          "close-grip",
          "kneeling",
          "neutral-grip",
          "overhand-grip",
          "seated",
          "single-arm",
          "straight arm",
          "underhand-grip",
          "wide-grip"
        ]
      },
      "kneeling": {
        "excludedVariations": [
          "bar",
          "bent-arm",
          "close-grip",
          "neutral-grip",
          "overhand-grip",
          "seated",
          "single-arm",
          "standing",
          "straight arm",
          "underhand-grip",
          "wide-grip"
        ]
      },
      "bent-arm": {
        "excludedVariations": [
          "bar",
          "close-grip",
          "kneeling",
          "neutral-grip",
          "overhand-grip",
          "seated",
          "single-arm",
          "standing",
          "straight arm",
          "underhand-grip",
          "wide-grip"
        ]
      },
      "wide-grip": {
        "excludedVariations": [
          "bar",
          "bent-arm",
          "close-grip",
          "kneeling",
          "neutral-grip",
          "overhand-grip",
          "seated",
          "single-arm",
          "standing",
          "straight arm",
          "underhand-grip"
        ]
      },
      "close-grip": {
        "excludedVariations": [
          "bar",
          "bent-arm",
          "kneeling",
          "neutral-grip",
          "overhand-grip",
          "seated",
          "single-arm",
          "standing",
          "straight arm",
          "underhand-grip",
          "wide-grip"
        ]
      },
      "neutral-grip": {
        "excludedVariations": [
          "bar",
          "bent-arm",
          "close-grip",
          "kneeling",
          "overhand-grip",
          "seated",
          "single-arm",
          "standing",
          "straight arm",
          "underhand-grip",
          "wide-grip"
        ]
      },
      "overhand-grip": {
        "excludedVariations": [
          "bar",
          "bent-arm",
          "close-grip",
          "kneeling",
          "neutral-grip",
          "seated",
          "single-arm",
          "standing",
          "straight arm",
          "underhand-grip",
          "wide-grip"
        ]
      },
      "underhand-grip": {
        "excludedVariations": [
          "bar",
          "bent-arm",
          "close-grip",
          "kneeling",
          "neutral-grip",
          "overhand-grip",
          "seated",
          "single-arm",
          "standing",
          "straight arm",
          "wide-grip"
        ]
      },
      "bar": {
        "excludedVariations": [
          "bent-arm",
          "close-grip",
          "kneeling",
          "neutral-grip",
          "overhand-grip",
          "seated",
          "single-arm",
          "standing",
          "straight arm",
          "underhand-grip",
          "wide-grip"
        ]
      },
      "cable": {
        "excludedVariations": [
          "band",
          "dumbbell",
          "rope"
        ]
      },
      "dumbbell": {
        "excludedVariations": [
          "band",
          "cable",
          "rope"
        ]
      },
      "band": {
        "excludedVariations": [
          "cable",
          "dumbbell",
          "rope"
        ]
      },
      "rope": {
        "excludedVariations": [
          "band",
          "cable",
          "dumbbell"
        ]
      }
    }
  },
  {
    "pk": "c46c643f-d109-4720-8ce9-3b5d24b9cdec",
    "name": "Lateral Walk",
    "muscleGroups": [
      "Legs"
    ],
    "primaryMuscles": [
      "gluteus maximus",
      "hip abductors"
    ],
    "secondaryMuscles": [
      "gastrocnemius",
      "hamstrings",
      "quadriceps femoris",
      "hip adductors"
    ],
    "variations": {
      "wide-stance": {
        "excludedVariations": [
          "hip-level",
          "squat position"
        ]
      },
      "squat position": {
        "excludedVariations": [
          "hip-level",
          "wide-stance"
        ]
      },
      "hip-level": {
        "excludedVariations": [
          "squat position",
          "wide-stance"
        ]
      },
      "band": {
        "excludedVariations": [
          "ankle weights",
          "barbell",
          "dumbbell",
          "kettlebell",
          "weighted vest"
        ]
      },
      "dumbbell": {
        "excludedVariations": [
          "ankle weights",
          "band",
          "barbell",
          "kettlebell",
          "weighted vest"
        ]
      },
      "kettlebell": {
        "excludedVariations": [
          "ankle weights",
          "band",
          "barbell",
          "dumbbell",
          "weighted vest"
        ]
      },
      "barbell": {
        "excludedVariations": [
          "ankle weights",
          "band",
          "dumbbell",
          "kettlebell",
          "weighted vest"
        ]
      },
      "weighted vest": {
        "excludedVariations": [
          "ankle weights",
          "band",
          "barbell",
          "dumbbell",
          "kettlebell"
        ]
      },
      "ankle weights": {
        "excludedVariations": [
          "band",
          "barbell",
          "dumbbell",
          "kettlebell",
          "weighted vest"
        ]
      }
    }
  },
  {
    "pk": "13ce59d9-4fd0-4aea-857a-3afc186c3074",
    "name": "Sit-Up",
    "muscleGroups": [
      "Core"
    ],
    "primaryMuscles": [
      "rectus abdominis"
    ],
    "secondaryMuscles": [
      "external obliques"
    ],
    "variations": {
      "standard": {
        "excludedVariations": [
          "GHD",
          "anchor",
          "crossed-arms",
          "decline",
          "hands-behind-head",
          "incline",
          "janda",
          "twisting"
        ]
      },
      "decline": {
        "excludedVariations": [
          "GHD",
          "anchor",
          "crossed-arms",
          "hands-behind-head",
          "incline",
          "janda",
          "standard",
          "twisting"
        ]
      },
      "incline": {
        "excludedVariations": [
          "GHD",
          "anchor",
          "crossed-arms",
          "decline",
          "hands-behind-head",
          "janda",
          "standard",
          "twisting"
        ]
      },
      "anchor": {
        "excludedVariations": [
          "GHD",
          "crossed-arms",
          "decline",
          "hands-behind-head",
          "incline",
          "janda",
          "standard",
          "twisting"
        ]
      },
      "crossed-arms": {
        "excludedVariations": [
          "GHD",
          "anchor",
          "decline",
          "hands-behind-head",
          "incline",
          "janda",
          "standard",
          "twisting"
        ]
      },
      "hands-behind-head": {
        "excludedVariations": [
          "GHD",
          "anchor",
          "crossed-arms",
          "decline",
          "incline",
          "janda",
          "standard",
          "twisting"
        ]
      },
      "twisting": {
        "excludedVariations": [
          "GHD",
          "anchor",
          "crossed-arms",
          "decline",
          "hands-behind-head",
          "incline",
          "janda",
          "standard"
        ]
      },
      "janda": {
        "excludedVariations": [
          "GHD",
          "anchor",
          "crossed-arms",
          "decline",
          "hands-behind-head",
          "incline",
          "standard",
          "twisting"
        ]
      },
      "GHD": {
        "excludedVariations": [
          "anchor",
          "crossed-arms",
          "decline",
          "hands-behind-head",
          "incline",
          "janda",
          "standard",
          "twisting"
        ]
      },
      "weighted": {
        "excludedVariations": [
          "band-resisted",
          "feet-in-rings"
        ]
      },
      "band-resisted": {
        "excludedVariations": [
          "feet-in-rings",
          "weighted"
        ]
      },
      "feet-in-rings": {
        "excludedVariations": [
          "band-resisted",
          "weighted"
        ]
      }
    }
  },
  {
    "pk": "0c5940e6-419e-476b-a1eb-39302e0aebe5",
    "name": "Chest Fly",
    "muscleGroups": [
      "Chest"
    ],
    "primaryMuscles": [
      "pectoralis major"
    ],
    "secondaryMuscles": [
      "biceps brachii",
      "wrist flexors",
      "anterior deltoid"
    ],
    "variations": {
      "incline": {
        "excludedVariations": [
          "decline",
          "flat",
          "overhand-grip",
          "pec-dec",
          "underhand-grip"
        ]
      },
      "decline": {
        "excludedVariations": [
          "flat",
          "incline",
          "overhand-grip",
          "pec-dec",
          "underhand-grip"
        ]
      },
      "flat": {
        "excludedVariations": [
          "decline",
          "incline",
          "overhand-grip",
          "pec-dec",
          "underhand-grip"
        ]
      },
      "overhand-grip": {
        "excludedVariations": [
          "decline",
          "flat",
          "incline",
          "pec-dec",
          "underhand-grip"
        ]
      },
      "underhand-grip": {
        "excludedVariations": [
          "decline",
          "flat",
          "incline",
          "overhand-grip",
          "pec-dec"
        ]
      },
      "pec-dec": {
        "excludedVariations": [
          "band",
          "cable crossover",
          "decline",
          "dumbbell",
          "flat",
          "incline",
          "overhand-grip",
          "underhand-grip"
        ]
      },
      "dumbbell": {
        "excludedVariations": [
          "band",
          "cable crossover",
          "pec-dec"
        ]
      },
      "cable crossover": {
        "excludedVariations": [
          "band",
          "dumbbell",
          "pec-dec"
        ]
      },
      "band": {
        "excludedVariations": [
          "cable crossover",
          "dumbbell",
          "pec-dec"
        ]
      }
    }
  },
  {
    "pk": "e13cf8a4-6b48-4d9e-9a24-a30d5f98d713",
    "name": "Mountain Climbers",
    "muscleGroups": [
      "Core"
    ],
    "primaryMuscles": [
      "rectus abdominis"
    ],
    "secondaryMuscles": [
      "external obliques"
    ],
    "variations": {
      "slow": {
        "excludedVariations": [
          "cross-body",
          "elevated"
        ]
      },
      "cross-body": {
        "excludedVariations": [
          "elevated",
          "slow"
        ]
      },
      "elevated": {
        "excludedVariations": [
          "cross-body",
          "slow"
        ]
      },
      "resistance band": {
        "excludedVariations": [
          "bosu",
          "slider",
          "weighted vest"
        ]
      },
      "slider": {
        "excludedVariations": [
          "bosu",
          "resistance band",
          "weighted vest"
        ]
      },
      "bosu": {
        "excludedVariations": [
          "resistance band",
          "slider",
          "weighted vest"
        ]
      },
      "weighted vest": {
        "excludedVariations": [
          "bosu",
          "resistance band",
          "slider"
        ]
      }
    }
  },
  {
    "pk": "edb21df1-0a7a-49f8-94e3-fa47138af935",
    "name": "Tricep Pushdown",
    "muscleGroups": [
      "Triceps"
    ],
    "primaryMuscles": [
      "triceps brachii"
    ],
    "secondaryMuscles": [],
    "variations": {
      "single-arm": {
        "excludedVariations": [
          "bar",
          "close-grip",
          "kneeling",
          "neutral-grip",
          "overhand-grip",
          "standing",
          "underhand-grip",
          "wide-grip"
        ]
      },
      "standing": {
        "excludedVariations": [
          "bar",
          "close-grip",
          "kneeling",
          "neutral-grip",
          "overhand-grip",
          "single-arm",
          "underhand-grip",
          "wide-grip"
        ]
      },
      "kneeling": {
        "excludedVariations": [
          "bar",
          "close-grip",
          "neutral-grip",
          "overhand-grip",
          "single-arm",
          "standing",
          "underhand-grip",
          "wide-grip"
        ]
      },
      "wide-grip": {
        "excludedVariations": [
          "bar",
          "close-grip",
          "kneeling",
          "neutral-grip",
          "overhand-grip",
          "single-arm",
          "standing",
          "underhand-grip"
        ]
      },
      "close-grip": {
        "excludedVariations": [
          "bar",
          "kneeling",
          "neutral-grip",
          "overhand-grip",
          "single-arm",
          "standing",
          "underhand-grip",
          "wide-grip"
        ]
      },
      "neutral-grip": {
        "excludedVariations": [
          "bar",
          "close-grip",
          "kneeling",
          "overhand-grip",
          "single-arm",
          "standing",
          "underhand-grip",
          "wide-grip"
        ]
      },
      "overhand-grip": {
        "excludedVariations": [
          "bar",
          "close-grip",
          "kneeling",
          "neutral-grip",
          "single-arm",
          "standing",
          "underhand-grip",
          "wide-grip"
        ]
      },
      "underhand-grip": {
        "excludedVariations": [
          "bar",
          "close-grip",
          "kneeling",
          "neutral-grip",
          "overhand-grip",
          "single-arm",
          "standing",
          "wide-grip"
        ]
      },
      "bar": {
        "excludedVariations": [
          "close-grip",
          "kneeling",
          "neutral-grip",
          "overhand-grip",
          "single-arm",
          "standing",
          "underhand-grip",
          "wide-grip"
        ]
      },
      "cable": {
        "excludedVariations": [
          "band",
          "rope"
        ]
      },
      "rope": {
        "excludedVariations": [
          "band",
          "cable"
        ]
      },
      "band": {
        "excludedVariations": [
          "cable",
          "rope"
        ]
      }
    }
  },
  {
    "pk": "03ded3cd-bba0-4f04-9afd-f7e321aec282",
    "name": "Lat Pulldown",
    "muscleGroups": [
      "Back"
    ],
    "primaryMuscles": [
      "latissimus dorsi"
    ],
    "secondaryMuscles": [
      "biceps brachii",
      "wrist flexors",
      "infraspinatus",
      "subscapularis",
      "posterior deltoid"
    ],
    "variations": {
      "single-arm": {
        "excludedVariations": [
          "bar",
          "close-grip",
          "kneeling",
          "neutral-grip",
          "overhand-grip",
          "underhand-grip",
          "wide-grip"
        ]
      },
      "kneeling": {
        "excludedVariations": [
          "bar",
          "close-grip",
          "neutral-grip",
          "overhand-grip",
          "single-arm",
          "underhand-grip",
          "wide-grip"
        ]
      },
      "wide-grip": {
        "excludedVariations": [
          "bar",
          "close-grip",
          "kneeling",
          "neutral-grip",
          "overhand-grip",
          "single-arm",
          "underhand-grip"
        ]
      },
      "close-grip": {
        "excludedVariations": [
          "bar",
          "kneeling",
          "neutral-grip",
          "overhand-grip",
          "single-arm",
          "underhand-grip",
          "wide-grip"
        ]
      },
      "neutral-grip": {
        "excludedVariations": [
          "bar",
          "close-grip",
          "kneeling",
          "overhand-grip",
          "single-arm",
          "underhand-grip",
          "wide-grip"
        ]
      },
      "overhand-grip": {
        "excludedVariations": [
          "bar",
          "close-grip",
          "kneeling",
          "neutral-grip",
          "single-arm",
          "underhand-grip",
          "wide-grip"
        ]
      },
      "underhand-grip": {
        "excludedVariations": [
          "bar",
          "close-grip",
          "kneeling",
          "neutral-grip",
          "overhand-grip",
          "single-arm",
          "wide-grip"
        ]
      },
      "bar": {
        "excludedVariations": [
          "close-grip",
          "kneeling",
          "neutral-grip",
          "overhand-grip",
          "single-arm",
          "underhand-grip",
          "wide-grip"
        ]
      },
      "cable": {
        "excludedVariations": [
          "rope"
        ]
      },
      "rope": {
        "excludedVariations": [
          "cable"
        ]
      }
    }
  },
  {
    "pk": "f1c844bd-28c8-4191-9b2a-d0233e6941e1",
    "name": "Wrist Curl",
    "muscleGroups": [
      "Arms"
    ],
    "primaryMuscles": [
      "wrist flexors"
    ],
    "secondaryMuscles": [],
    "variations": {
      "single-arm": {
        "excludedVariations": [
          "EZ-bar",
          "behind-the-back",
          "pronated",
          "reverse",
          "seated",
          "standing"
        ]
      },
      "behind-the-back": {
        "excludedVariations": [
          "EZ-bar",
          "pronated",
          "reverse",
          "seated",
          "single-arm",
          "standing"
        ]
      },
      "seated": {
        "excludedVariations": [
          "EZ-bar",
          "behind-the-back",
          "pronated",
          "reverse",
          "single-arm",
          "standing"
        ]
      },
      "standing": {
        "excludedVariations": [
          "EZ-bar",
          "behind-the-back",
          "pronated",
          "reverse",
          "seated",
          "single-arm"
        ]
      },
      "EZ-bar": {
        "excludedVariations": [
          "behind-the-back",
          "pronated",
          "reverse",
          "seated",
          "single-arm",
          "standing"
        ]
      },
      "reverse": {
        "excludedVariations": [
          "EZ-bar",
          "behind-the-back",
          "pronated",
          "seated",
          "single-arm",
          "standing"
        ]
      },
      "pronated": {
        "excludedVariations": [
          "EZ-bar",
          "behind-the-back",
          "reverse",
          "seated",
          "single-arm",
          "standing"
        ]
      },
      "barbell": {
        "excludedVariations": [
          "band",
          "cable",
          "dumbbell"
        ]
      },
      "dumbbell": {
        "excludedVariations": [
          "band",
          "barbell",
          "cable"
        ]
      },
      "cable": {
        "excludedVariations": [
          "band",
          "barbell",
          "dumbbell"
        ]
      },
      "band": {
        "excludedVariations": [
          "barbell",
          "cable",
          "dumbbell"
        ]
      }
    }
  },
  {
    "pk": "a3f7c812-1d45-4b89-93c0-7e2d4f6a1b85",
    "name": "Overhead Press",
    "muscleGroups": [
      "Push",
      "Shoulders"
    ],
    "primaryMuscles": [
      "anterior deltoid",
      "lateral deltoid"
    ],
    "secondaryMuscles": [
      "triceps brachii",
      "trapezius",
      "subscapularis"
    ],
    "variations": {
      "push press": {
        "excludedVariations": [
          "Bradford",
          "Z-press",
          "alternating",
          "behind-the-neck",
          "paused",
          "push jerk",
          "seated",
          "single-arm",
          "split jerk",
          "standing",
          "strict"
        ]
      },
      "strict": {
        "excludedVariations": [
          "Bradford",
          "Z-press",
          "alternating",
          "behind-the-neck",
          "paused",
          "push jerk",
          "push press",
          "seated",
          "single-arm",
          "split jerk",
          "standing"
        ]
      },
      "seated": {
        "excludedVariations": [
          "Bradford",
          "Z-press",
          "alternating",
          "behind-the-neck",
          "paused",
          "push jerk",
          "push press",
          "single-arm",
          "split jerk",
          "standing",
          "strict"
        ]
      },
      "standing": {
        "excludedVariations": [
          "Bradford",
          "Z-press",
          "alternating",
          "behind-the-neck",
          "paused",
          "push jerk",
          "push press",
          "seated",
          "single-arm",
          "split jerk",
          "strict"
        ]
      },
      "single-arm": {
        "excludedVariations": [
          "Bradford",
          "Z-press",
          "alternating",
          "behind-the-neck",
          "paused",
          "push jerk",
          "push press",
          "seated",
          "split jerk",
          "standing",
          "strict"
        ]
      },
      "behind-the-neck": {
        "excludedVariations": [
          "Bradford",
          "Z-press",
          "alternating",
          "paused",
          "push jerk",
          "push press",
          "seated",
          "single-arm",
          "split jerk",
          "standing",
          "strict"
        ]
      },
      "paused": {
        "excludedVariations": [
          "Bradford",
          "Z-press",
          "alternating",
          "behind-the-neck",
          "push jerk",
          "push press",
          "seated",
          "single-arm",
          "split jerk",
          "standing",
          "strict"
        ]
      },
      "Bradford": {
        "excludedVariations": [
          "Z-press",
          "alternating",
          "behind-the-neck",
          "paused",
          "push jerk",
          "push press",
          "seated",
          "single-arm",
          "split jerk",
          "standing",
          "strict"
        ]
      },
      "alternating": {
        "excludedVariations": [
          "Bradford",
          "Z-press",
          "behind-the-neck",
          "paused",
          "push jerk",
          "push press",
          "seated",
          "single-arm",
          "split jerk",
          "standing",
          "strict"
        ]
      },
      "push jerk": {
        "excludedVariations": [
          "Bradford",
          "Z-press",
          "alternating",
          "behind-the-neck",
          "paused",
          "push press",
          "seated",
          "single-arm",
          "split jerk",
          "standing",
          "strict"
        ]
      },
      "split jerk": {
        "excludedVariations": [
          "Bradford",
          "Z-press",
          "alternating",
          "behind-the-neck",
          "paused",
          "push jerk",
          "push press",
          "seated",
          "single-arm",
          "standing",
          "strict"
        ]
      },
      "Z-press": {
        "excludedVariations": [
          "Bradford",
          "alternating",
          "behind-the-neck",
          "paused",
          "push jerk",
          "push press",
          "seated",
          "single-arm",
          "split jerk",
          "standing",
          "strict"
        ]
      },
      "barbell": {
        "excludedVariations": [
          "dumbbell",
          "kettlebell",
          "landmine",
          "pin"
        ]
      },
      "dumbbell": {
        "excludedVariations": [
          "barbell",
          "kettlebell",
          "landmine",
          "pin"
        ]
      },
      "kettlebell": {
        "excludedVariations": [
          "barbell",
          "dumbbell",
          "landmine",
          "pin"
        ]
      },
      "landmine": {
        "excludedVariations": [
          "barbell",
          "dumbbell",
          "kettlebell",
          "pin"
        ]
      },
      "pin": {
        "excludedVariations": [
          "barbell",
          "dumbbell",
          "kettlebell",
          "landmine"
        ]
      }
    }
  },
  {
    "pk": "b9e2a547-3c68-4f10-a1d7-5c8b0e3d2f94",
    "name": "Hip Thrust",
    "muscleGroups": [
      "Glutes"
    ],
    "primaryMuscles": [
      "gluteus maximus"
    ],
    "secondaryMuscles": [
      "hamstrings",
      "hip adductors"
    ],
    "variations": {
      "single-leg": {
        "excludedVariations": [
          "B-stance",
          "american",
          "feet-elevated",
          "narrow-stance",
          "paused",
          "wide-stance"
        ]
      },
      "paused": {
        "excludedVariations": [
          "B-stance",
          "american",
          "feet-elevated",
          "narrow-stance",
          "single-leg",
          "wide-stance"
        ]
      },
      "feet-elevated": {
        "excludedVariations": [
          "B-stance",
          "american",
          "narrow-stance",
          "paused",
          "single-leg",
          "wide-stance"
        ]
      },
      "narrow-stance": {
        "excludedVariations": [
          "B-stance",
          "american",
          "feet-elevated",
          "paused",
          "single-leg",
          "wide-stance"
        ]
      },
      "wide-stance": {
        "excludedVariations": [
          "B-stance",
          "american",
          "feet-elevated",
          "narrow-stance",
          "paused",
          "single-leg"
        ]
      },
      "american": {
        "excludedVariations": [
          "B-stance",
          "feet-elevated",
          "narrow-stance",
          "paused",
          "single-leg",
          "wide-stance"
        ]
      },
      "B-stance": {
        "excludedVariations": [
          "american",
          "feet-elevated",
          "narrow-stance",
          "paused",
          "single-leg",
          "wide-stance"
        ]
      },
      "barbell": {
        "excludedVariations": [
          "banded",
          "dumbbell",
          "machine",
          "plate",
          "smith machine"
        ]
      },
      "dumbbell": {
        "excludedVariations": [
          "banded",
          "barbell",
          "machine",
          "plate",
          "smith machine"
        ]
      },
      "banded": {
        "excludedVariations": [
          "barbell",
          "dumbbell",
          "machine",
          "plate",
          "smith machine"
        ]
      },
      "machine": {
        "excludedVariations": [
          "banded",
          "barbell",
          "dumbbell",
          "plate",
          "smith machine"
        ]
      },
      "smith machine": {
        "excludedVariations": [
          "banded",
          "barbell",
          "dumbbell",
          "machine",
          "plate"
        ]
      },
      "plate": {
        "excludedVariations": [
          "banded",
          "barbell",
          "dumbbell",
          "machine",
          "smith machine"
        ]
      }
    }
  },
  {
    "pk": "c1d83b6a-7f29-4e5c-b2a8-9d0e5f7c3b21",
    "name": "Romanian Deadlift",
    "muscleGroups": [
      "Legs",
      "Glutes"
    ],
    "primaryMuscles": [
      "hamstrings",
      "gluteus maximus"
    ],
    "secondaryMuscles": [
      "erector spinae",
      "gastrocnemius"
    ],
    "variations": {
      "single-leg": {
        "excludedVariations": [
          "B-stance",
          "deficit",
          "paused",
          "snatch-grip",
          "stiff-leg",
          "wide-grip"
        ]
      },
      "paused": {
        "excludedVariations": [
          "B-stance",
          "deficit",
          "single-leg",
          "snatch-grip",
          "stiff-leg",
          "wide-grip"
        ]
      },
      "stiff-leg": {
        "excludedVariations": [
          "B-stance",
          "deficit",
          "paused",
          "single-leg",
          "snatch-grip",
          "wide-grip"
        ]
      },
      "wide-grip": {
        "excludedVariations": [
          "B-stance",
          "deficit",
          "paused",
          "single-leg",
          "snatch-grip",
          "stiff-leg"
        ]
      },
      "snatch-grip": {
        "excludedVariations": [
          "B-stance",
          "deficit",
          "paused",
          "single-leg",
          "stiff-leg",
          "wide-grip"
        ]
      },
      "B-stance": {
        "excludedVariations": [
          "deficit",
          "paused",
          "single-leg",
          "snatch-grip",
          "stiff-leg",
          "wide-grip"
        ]
      },
      "deficit": {
        "excludedVariations": [
          "B-stance",
          "paused",
          "single-leg",
          "snatch-grip",
          "stiff-leg",
          "wide-grip"
        ]
      },
      "barbell": {
        "excludedVariations": [
          "banded",
          "cable",
          "dumbbell",
          "kettlebell",
          "trap bar"
        ]
      },
      "dumbbell": {
        "excludedVariations": [
          "banded",
          "barbell",
          "cable",
          "kettlebell",
          "trap bar"
        ]
      },
      "kettlebell": {
        "excludedVariations": [
          "banded",
          "barbell",
          "cable",
          "dumbbell",
          "trap bar"
        ]
      },
      "cable": {
        "excludedVariations": [
          "banded",
          "barbell",
          "dumbbell",
          "kettlebell",
          "trap bar"
        ]
      },
      "trap bar": {
        "excludedVariations": [
          "banded",
          "barbell",
          "cable",
          "dumbbell",
          "kettlebell"
        ]
      },
      "banded": {
        "excludedVariations": [
          "barbell",
          "cable",
          "dumbbell",
          "kettlebell",
          "trap bar"
        ]
      }
    }
  },
  {
    "pk": "d4c96e3f-8a1b-4d72-c3e9-2f5a7b0d4c68",
    "name": "Nordic Curl",
    "muscleGroups": [
      "Legs"
    ],
    "primaryMuscles": [
      "hamstrings"
    ],
    "secondaryMuscles": [
      "gluteus maximus",
      "gastrocnemius"
    ],
    "variations": {
      "bodyweight": {
        "excludedVariations": [
          "GHD",
          "eccentric",
          "feet-anchored"
        ]
      },
      "eccentric": {
        "excludedVariations": [
          "GHD",
          "bodyweight",
          "feet-anchored"
        ]
      },
      "GHD": {
        "excludedVariations": [
          "bodyweight",
          "eccentric",
          "feet-anchored"
        ]
      },
      "feet-anchored": {
        "excludedVariations": [
          "GHD",
          "bodyweight",
          "eccentric"
        ]
      },
      "weighted": {
        "excludedVariations": [
          "band-assisted",
          "machine",
          "partner-assisted"
        ]
      },
      "partner-assisted": {
        "excludedVariations": [
          "band-assisted",
          "machine",
          "weighted"
        ]
      },
      "machine": {
        "excludedVariations": [
          "band-assisted",
          "partner-assisted",
          "weighted"
        ]
      },
      "band-assisted": {
        "excludedVariations": [
          "machine",
          "partner-assisted",
          "weighted"
        ]
      }
    }
  },
  {
    "pk": "e7f04a19-2b3c-4e85-d6f1-3a8c9e2d5b07",
    "name": "Good Morning",
    "muscleGroups": [
      "Glutes",
      "Back"
    ],
    "primaryMuscles": [
      "hamstrings",
      "erector spinae"
    ],
    "secondaryMuscles": [
      "gluteus maximus",
      "rectus abdominis"
    ],
    "variations": {
      "seated": {
        "excludedVariations": [
          "good morning squat",
          "paused",
          "single-leg",
          "suspended",
          "wide-grip"
        ]
      },
      "single-leg": {
        "excludedVariations": [
          "good morning squat",
          "paused",
          "seated",
          "suspended",
          "wide-grip"
        ]
      },
      "good morning squat": {
        "excludedVariations": [
          "paused",
          "seated",
          "single-leg",
          "suspended",
          "wide-grip"
        ]
      },
      "suspended": {
        "excludedVariations": [
          "good morning squat",
          "paused",
          "seated",
          "single-leg",
          "wide-grip"
        ]
      },
      "wide-grip": {
        "excludedVariations": [
          "good morning squat",
          "paused",
          "seated",
          "single-leg",
          "suspended"
        ]
      },
      "paused": {
        "excludedVariations": [
          "good morning squat",
          "seated",
          "single-leg",
          "suspended",
          "wide-grip"
        ]
      },
      "barbell": {
        "excludedVariations": [
          "banded",
          "cable",
          "dumbbell",
          "safety bar",
          "smith machine"
        ]
      },
      "banded": {
        "excludedVariations": [
          "barbell",
          "cable",
          "dumbbell",
          "safety bar",
          "smith machine"
        ]
      },
      "dumbbell": {
        "excludedVariations": [
          "banded",
          "barbell",
          "cable",
          "safety bar",
          "smith machine"
        ]
      },
      "cable": {
        "excludedVariations": [
          "banded",
          "barbell",
          "dumbbell",
          "safety bar",
          "smith machine"
        ]
      },
      "smith machine": {
        "excludedVariations": [
          "banded",
          "barbell",
          "cable",
          "dumbbell",
          "safety bar"
        ]
      },
      "safety bar": {
        "excludedVariations": [
          "banded",
          "barbell",
          "cable",
          "dumbbell",
          "smith machine"
        ]
      }
    }
  },
  {
    "pk": "f2a15b28-3c4d-4f96-e7a2-4b9d0f3e6c18",
    "name": "Step-Up",
    "muscleGroups": [
      "Legs"
    ],
    "primaryMuscles": [
      "gluteus maximus",
      "quadriceps femoris"
    ],
    "secondaryMuscles": [
      "hamstrings",
      "gastrocnemius"
    ],
    "variations": {
      "bodyweight": {
        "excludedVariations": [
          "Bulgarian",
          "crossover",
          "deficit",
          "explosive",
          "lateral",
          "paused",
          "single-leg"
        ]
      },
      "lateral": {
        "excludedVariations": [
          "Bulgarian",
          "bodyweight",
          "crossover",
          "deficit",
          "explosive",
          "paused",
          "single-leg"
        ]
      },
      "single-leg": {
        "excludedVariations": [
          "Bulgarian",
          "bodyweight",
          "crossover",
          "deficit",
          "explosive",
          "lateral",
          "paused"
        ]
      },
      "crossover": {
        "excludedVariations": [
          "Bulgarian",
          "bodyweight",
          "deficit",
          "explosive",
          "lateral",
          "paused",
          "single-leg"
        ]
      },
      "explosive": {
        "excludedVariations": [
          "Bulgarian",
          "bodyweight",
          "crossover",
          "deficit",
          "lateral",
          "paused",
          "single-leg"
        ]
      },
      "deficit": {
        "excludedVariations": [
          "Bulgarian",
          "bodyweight",
          "crossover",
          "explosive",
          "lateral",
          "paused",
          "single-leg"
        ]
      },
      "Bulgarian": {
        "excludedVariations": [
          "bodyweight",
          "crossover",
          "deficit",
          "explosive",
          "lateral",
          "paused",
          "single-leg"
        ]
      },
      "paused": {
        "excludedVariations": [
          "Bulgarian",
          "bodyweight",
          "crossover",
          "deficit",
          "explosive",
          "lateral",
          "single-leg"
        ]
      },
      "dumbbell": {
        "excludedVariations": [
          "barbell",
          "goblet",
          "kettlebell",
          "weighted vest"
        ]
      },
      "barbell": {
        "excludedVariations": [
          "dumbbell",
          "goblet",
          "kettlebell",
          "weighted vest"
        ]
      },
      "weighted vest": {
        "excludedVariations": [
          "barbell",
          "dumbbell",
          "goblet",
          "kettlebell"
        ]
      },
      "kettlebell": {
        "excludedVariations": [
          "barbell",
          "dumbbell",
          "goblet",
          "weighted vest"
        ]
      },
      "goblet": {
        "excludedVariations": [
          "barbell",
          "dumbbell",
          "kettlebell",
          "weighted vest"
        ]
      }
    }
  },
  {
    "pk": "a3b26c39-4d5e-4a07-f8b3-5c0e1a4f7d29",
    "name": "Leg Curl",
    "muscleGroups": [
      "Legs"
    ],
    "primaryMuscles": [
      "hamstrings"
    ],
    "secondaryMuscles": [
      "gastrocnemius",
      "gluteus maximus"
    ],
    "variations": {
      "single-leg": {
        "excludedVariations": [
          "nordic",
          "paused",
          "prone",
          "standing",
          "tempo"
        ]
      },
      "nordic": {
        "excludedVariations": [
          "paused",
          "prone",
          "single-leg",
          "standing",
          "tempo"
        ]
      },
      "prone": {
        "excludedVariations": [
          "nordic",
          "paused",
          "single-leg",
          "standing",
          "tempo"
        ]
      },
      "standing": {
        "excludedVariations": [
          "nordic",
          "paused",
          "prone",
          "single-leg",
          "tempo"
        ]
      },
      "paused": {
        "excludedVariations": [
          "nordic",
          "prone",
          "single-leg",
          "standing",
          "tempo"
        ]
      },
      "tempo": {
        "excludedVariations": [
          "nordic",
          "paused",
          "prone",
          "single-leg",
          "standing"
        ]
      },
      "lying machine": {
        "excludedVariations": [
          "band",
          "cable",
          "dumbbell",
          "seated machine",
          "slider",
          "stability ball"
        ]
      },
      "seated machine": {
        "excludedVariations": [
          "band",
          "cable",
          "dumbbell",
          "lying machine",
          "slider",
          "stability ball"
        ]
      },
      "cable": {
        "excludedVariations": [
          "band",
          "dumbbell",
          "lying machine",
          "seated machine",
          "slider",
          "stability ball"
        ]
      },
      "dumbbell": {
        "excludedVariations": [
          "band",
          "cable",
          "lying machine",
          "seated machine",
          "slider",
          "stability ball"
        ]
      },
      "band": {
        "excludedVariations": [
          "cable",
          "dumbbell",
          "lying machine",
          "seated machine",
          "slider",
          "stability ball"
        ]
      },
      "slider": {
        "excludedVariations": [
          "band",
          "cable",
          "dumbbell",
          "lying machine",
          "seated machine",
          "stability ball"
        ]
      },
      "stability ball": {
        "excludedVariations": [
          "band",
          "cable",
          "dumbbell",
          "lying machine",
          "seated machine",
          "slider"
        ]
      }
    }
  },
  {
    "pk": "b4c37d4a-5e6f-4b18-a9c4-6d1f2b5a8e30",
    "name": "Calf Raise",
    "muscleGroups": [
      "Legs"
    ],
    "primaryMuscles": [
      "gastrocnemius"
    ],
    "secondaryMuscles": [],
    "variations": {
      "standing": {
        "excludedVariations": [
          "donkey",
          "eccentric",
          "heel-elevated",
          "leg press",
          "offset",
          "paused",
          "seated",
          "single-leg",
          "tempo",
          "toe press"
        ]
      },
      "seated": {
        "excludedVariations": [
          "donkey",
          "eccentric",
          "heel-elevated",
          "leg press",
          "offset",
          "paused",
          "single-leg",
          "standing",
          "tempo",
          "toe press"
        ]
      },
      "single-leg": {
        "excludedVariations": [
          "donkey",
          "eccentric",
          "heel-elevated",
          "leg press",
          "offset",
          "paused",
          "seated",
          "standing",
          "tempo",
          "toe press"
        ]
      },
      "donkey": {
        "excludedVariations": [
          "eccentric",
          "heel-elevated",
          "leg press",
          "offset",
          "paused",
          "seated",
          "single-leg",
          "standing",
          "tempo",
          "toe press"
        ]
      },
      "leg press": {
        "excludedVariations": [
          "donkey",
          "eccentric",
          "heel-elevated",
          "offset",
          "paused",
          "seated",
          "single-leg",
          "standing",
          "tempo",
          "toe press"
        ]
      },
      "toe press": {
        "excludedVariations": [
          "donkey",
          "eccentric",
          "heel-elevated",
          "leg press",
          "offset",
          "paused",
          "seated",
          "single-leg",
          "standing",
          "tempo"
        ]
      },
      "offset": {
        "excludedVariations": [
          "donkey",
          "eccentric",
          "heel-elevated",
          "leg press",
          "paused",
          "seated",
          "single-leg",
          "standing",
          "tempo",
          "toe press"
        ]
      },
      "paused": {
        "excludedVariations": [
          "donkey",
          "eccentric",
          "heel-elevated",
          "leg press",
          "offset",
          "seated",
          "single-leg",
          "standing",
          "tempo",
          "toe press"
        ]
      },
      "tempo": {
        "excludedVariations": [
          "donkey",
          "eccentric",
          "heel-elevated",
          "leg press",
          "offset",
          "paused",
          "seated",
          "single-leg",
          "standing",
          "toe press"
        ]
      },
      "heel-elevated": {
        "excludedVariations": [
          "donkey",
          "eccentric",
          "leg press",
          "offset",
          "paused",
          "seated",
          "single-leg",
          "standing",
          "tempo",
          "toe press"
        ]
      },
      "eccentric": {
        "excludedVariations": [
          "donkey",
          "heel-elevated",
          "leg press",
          "offset",
          "paused",
          "seated",
          "single-leg",
          "standing",
          "tempo",
          "toe press"
        ]
      },
      "machine": {
        "excludedVariations": [
          "band-resisted",
          "barbell",
          "dumbbell"
        ]
      },
      "barbell": {
        "excludedVariations": [
          "band-resisted",
          "dumbbell",
          "machine"
        ]
      },
      "dumbbell": {
        "excludedVariations": [
          "band-resisted",
          "barbell",
          "machine"
        ]
      },
      "band-resisted": {
        "excludedVariations": [
          "barbell",
          "dumbbell",
          "machine"
        ]
      }
    }
  },
  {
    "pk": "c5d48e5b-6f7a-4c29-b0d5-7e2a3c6b9f41",
    "name": "Chin-Up",
    "muscleGroups": [
      "Back",
      "Biceps"
    ],
    "primaryMuscles": [
      "latissimus dorsi",
      "biceps brachii"
    ],
    "secondaryMuscles": [
      "wrist flexors",
      "posterior deltoid",
      "infraspinatus"
    ],
    "variations": {
      "bodyweight": {
        "excludedVariations": [
          "L-sit",
          "close-grip",
          "neutral-grip",
          "typewriter",
          "wide-grip"
        ]
      },
      "close-grip": {
        "excludedVariations": [
          "L-sit",
          "bodyweight",
          "neutral-grip",
          "typewriter",
          "wide-grip"
        ]
      },
      "neutral-grip": {
        "excludedVariations": [
          "L-sit",
          "bodyweight",
          "close-grip",
          "typewriter",
          "wide-grip"
        ]
      },
      "wide-grip": {
        "excludedVariations": [
          "L-sit",
          "bodyweight",
          "close-grip",
          "neutral-grip",
          "typewriter"
        ]
      },
      "L-sit": {
        "excludedVariations": [
          "bodyweight",
          "close-grip",
          "neutral-grip",
          "typewriter",
          "wide-grip"
        ]
      },
      "typewriter": {
        "excludedVariations": [
          "L-sit",
          "bodyweight",
          "close-grip",
          "neutral-grip",
          "wide-grip"
        ]
      },
      "weighted": {
        "excludedVariations": [
          "assisted",
          "band-resisted",
          "kipping",
          "ring",
          "supinated"
        ]
      },
      "assisted": {
        "excludedVariations": [
          "band-resisted",
          "kipping",
          "ring",
          "supinated",
          "weighted"
        ]
      },
      "ring": {
        "excludedVariations": [
          "assisted",
          "band-resisted",
          "kipping",
          "supinated",
          "weighted"
        ]
      },
      "band-resisted": {
        "excludedVariations": [
          "assisted",
          "kipping",
          "ring",
          "supinated",
          "weighted"
        ]
      },
      "kipping": {
        "excludedVariations": [
          "assisted",
          "band-resisted",
          "ring",
          "supinated",
          "weighted"
        ]
      },
      "supinated": {
        "excludedVariations": [
          "assisted",
          "band-resisted",
          "kipping",
          "ring",
          "weighted"
        ]
      }
    }
  },
  {
    "pk": "d6e59f6c-7a8b-4d30-c1e6-8f3b4d7c0a52",
    "name": "Inverted Row",
    "muscleGroups": [
      "Back"
    ],
    "primaryMuscles": [
      "latissimus dorsi",
      "posterior deltoid"
    ],
    "secondaryMuscles": [
      "biceps brachii",
      "trapezius",
      "wrist flexors"
    ],
    "variations": {
      "bodyweight": {
        "excludedVariations": [
          "close-grip",
          "feet-elevated",
          "neutral",
          "overhand",
          "pronated",
          "single-arm",
          "underhand",
          "wide-grip"
        ]
      },
      "wide-grip": {
        "excludedVariations": [
          "bodyweight",
          "close-grip",
          "feet-elevated",
          "neutral",
          "overhand",
          "pronated",
          "single-arm",
          "underhand"
        ]
      },
      "close-grip": {
        "excludedVariations": [
          "bodyweight",
          "feet-elevated",
          "neutral",
          "overhand",
          "pronated",
          "single-arm",
          "underhand",
          "wide-grip"
        ]
      },
      "underhand": {
        "excludedVariations": [
          "bodyweight",
          "close-grip",
          "feet-elevated",
          "neutral",
          "overhand",
          "pronated",
          "single-arm",
          "wide-grip"
        ]
      },
      "feet-elevated": {
        "excludedVariations": [
          "bodyweight",
          "close-grip",
          "neutral",
          "overhand",
          "pronated",
          "single-arm",
          "underhand",
          "wide-grip"
        ]
      },
      "overhand": {
        "excludedVariations": [
          "bodyweight",
          "close-grip",
          "feet-elevated",
          "neutral",
          "pronated",
          "single-arm",
          "underhand",
          "wide-grip"
        ]
      },
      "neutral": {
        "excludedVariations": [
          "bodyweight",
          "close-grip",
          "feet-elevated",
          "overhand",
          "pronated",
          "single-arm",
          "underhand",
          "wide-grip"
        ]
      },
      "pronated": {
        "excludedVariations": [
          "bodyweight",
          "close-grip",
          "feet-elevated",
          "neutral",
          "overhand",
          "single-arm",
          "underhand",
          "wide-grip"
        ]
      },
      "single-arm": {
        "excludedVariations": [
          "bodyweight",
          "close-grip",
          "feet-elevated",
          "neutral",
          "overhand",
          "pronated",
          "underhand",
          "wide-grip"
        ]
      },
      "weighted": {
        "excludedVariations": [
          "barbell",
          "rings",
          "suspension trainer"
        ]
      },
      "suspension trainer": {
        "excludedVariations": [
          "barbell",
          "rings",
          "weighted"
        ]
      },
      "barbell": {
        "excludedVariations": [
          "rings",
          "suspension trainer",
          "weighted"
        ]
      },
      "rings": {
        "excludedVariations": [
          "barbell",
          "suspension trainer",
          "weighted"
        ]
      }
    }
  },
  {
    "pk": "e7f60a7d-8b9c-4e41-d2f7-9a4c5e8d1b63",
    "name": "Seal Row",
    "muscleGroups": [
      "Back"
    ],
    "primaryMuscles": [
      "latissimus dorsi",
      "posterior deltoid"
    ],
    "secondaryMuscles": [
      "biceps brachii",
      "trapezius",
      "infraspinatus"
    ],
    "variations": {
      "wide-grip": {
        "excludedVariations": [
          "close-grip",
          "neutral-grip",
          "single-arm"
        ]
      },
      "close-grip": {
        "excludedVariations": [
          "neutral-grip",
          "single-arm",
          "wide-grip"
        ]
      },
      "neutral-grip": {
        "excludedVariations": [
          "close-grip",
          "single-arm",
          "wide-grip"
        ]
      },
      "single-arm": {
        "excludedVariations": [
          "close-grip",
          "neutral-grip",
          "wide-grip"
        ]
      },
      "barbell": {
        "excludedVariations": [
          "cable",
          "dumbbell",
          "machine"
        ]
      },
      "dumbbell": {
        "excludedVariations": [
          "barbell",
          "cable",
          "machine"
        ]
      },
      "machine": {
        "excludedVariations": [
          "barbell",
          "cable",
          "dumbbell"
        ]
      },
      "cable": {
        "excludedVariations": [
          "barbell",
          "dumbbell",
          "machine"
        ]
      }
    }
  },
  {
    "pk": "f8a71b8e-9c0d-4f52-e3a8-0b5d6f9e2c74",
    "name": "Chest-Supported Row",
    "muscleGroups": [
      "Back"
    ],
    "primaryMuscles": [
      "latissimus dorsi",
      "posterior deltoid"
    ],
    "secondaryMuscles": [
      "biceps brachii",
      "trapezius",
      "wrist flexors"
    ],
    "variations": {
      "single-arm": {
        "excludedVariations": [
          "close-grip",
          "incline",
          "neutral-grip",
          "prone",
          "wide-grip"
        ]
      },
      "wide-grip": {
        "excludedVariations": [
          "close-grip",
          "incline",
          "neutral-grip",
          "prone",
          "single-arm"
        ]
      },
      "close-grip": {
        "excludedVariations": [
          "incline",
          "neutral-grip",
          "prone",
          "single-arm",
          "wide-grip"
        ]
      },
      "neutral-grip": {
        "excludedVariations": [
          "close-grip",
          "incline",
          "prone",
          "single-arm",
          "wide-grip"
        ]
      },
      "prone": {
        "excludedVariations": [
          "close-grip",
          "incline",
          "neutral-grip",
          "single-arm",
          "wide-grip"
        ]
      },
      "incline": {
        "excludedVariations": [
          "close-grip",
          "neutral-grip",
          "prone",
          "single-arm",
          "wide-grip"
        ]
      },
      "dumbbell": {
        "excludedVariations": [
          "barbell",
          "cable",
          "machine"
        ]
      },
      "barbell": {
        "excludedVariations": [
          "cable",
          "dumbbell",
          "machine"
        ]
      },
      "machine": {
        "excludedVariations": [
          "barbell",
          "cable",
          "dumbbell"
        ]
      },
      "cable": {
        "excludedVariations": [
          "barbell",
          "dumbbell",
          "machine"
        ]
      }
    }
  },
  {
    "pk": "a9b82c9f-0d1e-4a63-f4b9-1c6e7a0f3d85",
    "name": "Cable Row",
    "muscleGroups": [
      "Back"
    ],
    "primaryMuscles": [
      "latissimus dorsi",
      "posterior deltoid"
    ],
    "secondaryMuscles": [
      "biceps brachii",
      "trapezius",
      "erector spinae",
      "wrist flexors"
    ],
    "variations": {
      "seated": {
        "excludedVariations": [
          "close-grip",
          "face-away",
          "half-kneeling",
          "kneeling",
          "neutral-grip",
          "overhand",
          "single-arm",
          "split-stance",
          "standing",
          "underhand",
          "wide-grip"
        ]
      },
      "standing": {
        "excludedVariations": [
          "close-grip",
          "face-away",
          "half-kneeling",
          "kneeling",
          "neutral-grip",
          "overhand",
          "seated",
          "single-arm",
          "split-stance",
          "underhand",
          "wide-grip"
        ]
      },
      "single-arm": {
        "excludedVariations": [
          "close-grip",
          "face-away",
          "half-kneeling",
          "kneeling",
          "neutral-grip",
          "overhand",
          "seated",
          "split-stance",
          "standing",
          "underhand",
          "wide-grip"
        ]
      },
      "wide-grip": {
        "excludedVariations": [
          "close-grip",
          "face-away",
          "half-kneeling",
          "kneeling",
          "neutral-grip",
          "overhand",
          "seated",
          "single-arm",
          "split-stance",
          "standing",
          "underhand"
        ]
      },
      "close-grip": {
        "excludedVariations": [
          "face-away",
          "half-kneeling",
          "kneeling",
          "neutral-grip",
          "overhand",
          "seated",
          "single-arm",
          "split-stance",
          "standing",
          "underhand",
          "wide-grip"
        ]
      },
      "neutral-grip": {
        "excludedVariations": [
          "close-grip",
          "face-away",
          "half-kneeling",
          "kneeling",
          "overhand",
          "seated",
          "single-arm",
          "split-stance",
          "standing",
          "underhand",
          "wide-grip"
        ]
      },
      "kneeling": {
        "excludedVariations": [
          "close-grip",
          "face-away",
          "half-kneeling",
          "neutral-grip",
          "overhand",
          "seated",
          "single-arm",
          "split-stance",
          "standing",
          "underhand",
          "wide-grip"
        ]
      },
      "half-kneeling": {
        "excludedVariations": [
          "close-grip",
          "face-away",
          "kneeling",
          "neutral-grip",
          "overhand",
          "seated",
          "single-arm",
          "split-stance",
          "standing",
          "underhand",
          "wide-grip"
        ]
      },
      "split-stance": {
        "excludedVariations": [
          "close-grip",
          "face-away",
          "half-kneeling",
          "kneeling",
          "neutral-grip",
          "overhand",
          "seated",
          "single-arm",
          "standing",
          "underhand",
          "wide-grip"
        ]
      },
      "overhand": {
        "excludedVariations": [
          "close-grip",
          "face-away",
          "half-kneeling",
          "kneeling",
          "neutral-grip",
          "seated",
          "single-arm",
          "split-stance",
          "standing",
          "underhand",
          "wide-grip"
        ]
      },
      "underhand": {
        "excludedVariations": [
          "close-grip",
          "face-away",
          "half-kneeling",
          "kneeling",
          "neutral-grip",
          "overhand",
          "seated",
          "single-arm",
          "split-stance",
          "standing",
          "wide-grip"
        ]
      },
      "face-away": {
        "excludedVariations": [
          "close-grip",
          "half-kneeling",
          "kneeling",
          "neutral-grip",
          "overhand",
          "seated",
          "single-arm",
          "split-stance",
          "standing",
          "underhand",
          "wide-grip"
        ]
      },
      "rope": {
        "excludedVariations": []
      }
    }
  },
  {
    "pk": "c1d04e1b-2f3a-4c85-b6d1-3e8a9c2b5f07",
    "name": "Tricep Extension",
    "muscleGroups": [
      "Triceps"
    ],
    "primaryMuscles": [
      "triceps brachii"
    ],
    "secondaryMuscles": [],
    "variations": {
      "EZ-bar": {
        "excludedVariations": [
          "behind-the-head",
          "kickback",
          "lying",
          "overhead",
          "seated",
          "single-arm",
          "standing"
        ]
      },
      "single-arm": {
        "excludedVariations": [
          "EZ-bar",
          "behind-the-head",
          "kickback",
          "lying",
          "overhead",
          "seated",
          "standing"
        ]
      },
      "overhead": {
        "excludedVariations": [
          "EZ-bar",
          "behind-the-head",
          "kickback",
          "lying",
          "seated",
          "single-arm",
          "standing"
        ]
      },
      "lying": {
        "excludedVariations": [
          "EZ-bar",
          "behind-the-head",
          "kickback",
          "overhead",
          "seated",
          "single-arm",
          "standing"
        ]
      },
      "seated": {
        "excludedVariations": [
          "EZ-bar",
          "behind-the-head",
          "kickback",
          "lying",
          "overhead",
          "single-arm",
          "standing"
        ]
      },
      "standing": {
        "excludedVariations": [
          "EZ-bar",
          "behind-the-head",
          "kickback",
          "lying",
          "overhead",
          "seated",
          "single-arm"
        ]
      },
      "kickback": {
        "excludedVariations": [
          "EZ-bar",
          "behind-the-head",
          "lying",
          "overhead",
          "seated",
          "single-arm",
          "standing"
        ]
      },
      "behind-the-head": {
        "excludedVariations": [
          "EZ-bar",
          "kickback",
          "lying",
          "overhead",
          "seated",
          "single-arm",
          "standing"
        ]
      },
      "cable": {
        "excludedVariations": [
          "band",
          "barbell",
          "dumbbell",
          "rope"
        ]
      },
      "dumbbell": {
        "excludedVariations": [
          "band",
          "barbell",
          "cable",
          "rope"
        ]
      },
      "barbell": {
        "excludedVariations": [
          "band",
          "cable",
          "dumbbell",
          "rope"
        ]
      },
      "rope": {
        "excludedVariations": [
          "band",
          "barbell",
          "cable",
          "dumbbell"
        ]
      },
      "band": {
        "excludedVariations": [
          "barbell",
          "cable",
          "dumbbell",
          "rope"
        ]
      }
    }
  },
  {
    "pk": "d2e15f2c-3a4b-4d96-c7e2-4f9b0d3c6a18",
    "name": "Skull Crusher",
    "muscleGroups": [
      "Triceps"
    ],
    "primaryMuscles": [
      "triceps brachii"
    ],
    "secondaryMuscles": [],
    "variations": {
      "EZ-bar": {
        "excludedVariations": [
          "floor",
          "neutral-grip",
          "single-arm"
        ]
      },
      "single-arm": {
        "excludedVariations": [
          "EZ-bar",
          "floor",
          "neutral-grip"
        ]
      },
      "floor": {
        "excludedVariations": [
          "EZ-bar",
          "neutral-grip",
          "single-arm"
        ]
      },
      "neutral-grip": {
        "excludedVariations": [
          "EZ-bar",
          "floor",
          "single-arm"
        ]
      },
      "barbell": {
        "excludedVariations": [
          "band",
          "cable",
          "decline bench",
          "dumbbell",
          "flat bench",
          "incline bench"
        ]
      },
      "dumbbell": {
        "excludedVariations": [
          "band",
          "barbell",
          "cable",
          "decline bench",
          "flat bench",
          "incline bench"
        ]
      },
      "cable": {
        "excludedVariations": [
          "band",
          "barbell",
          "decline bench",
          "dumbbell",
          "flat bench",
          "incline bench"
        ]
      },
      "band": {
        "excludedVariations": [
          "barbell",
          "cable",
          "decline bench",
          "dumbbell",
          "flat bench",
          "incline bench"
        ]
      },
      "flat bench": {
        "excludedVariations": [
          "band",
          "barbell",
          "cable",
          "decline bench",
          "dumbbell",
          "incline bench"
        ]
      },
      "incline bench": {
        "excludedVariations": [
          "band",
          "barbell",
          "cable",
          "decline bench",
          "dumbbell",
          "flat bench"
        ]
      },
      "decline bench": {
        "excludedVariations": [
          "band",
          "barbell",
          "cable",
          "dumbbell",
          "flat bench",
          "incline bench"
        ]
      }
    }
  },
  {
    "pk": "c7d60e7b-8f9a-4c41-b2d7-9e4a5c8b1f63",
    "name": "Wrist Extension",
    "muscleGroups": [
      "Arms"
    ],
    "primaryMuscles": [
      "wrist extensors"
    ],
    "secondaryMuscles": [],
    "variations": {
      "single-arm": {
        "excludedVariations": [
          "EZ-bar",
          "pronated",
          "reverse wrist curl",
          "seated",
          "standing"
        ]
      },
      "seated": {
        "excludedVariations": [
          "EZ-bar",
          "pronated",
          "reverse wrist curl",
          "single-arm",
          "standing"
        ]
      },
      "standing": {
        "excludedVariations": [
          "EZ-bar",
          "pronated",
          "reverse wrist curl",
          "seated",
          "single-arm"
        ]
      },
      "EZ-bar": {
        "excludedVariations": [
          "pronated",
          "reverse wrist curl",
          "seated",
          "single-arm",
          "standing"
        ]
      },
      "reverse wrist curl": {
        "excludedVariations": [
          "EZ-bar",
          "pronated",
          "seated",
          "single-arm",
          "standing"
        ]
      },
      "pronated": {
        "excludedVariations": [
          "EZ-bar",
          "reverse wrist curl",
          "seated",
          "single-arm",
          "standing"
        ]
      },
      "barbell": {
        "excludedVariations": [
          "band",
          "cable",
          "dumbbell"
        ]
      },
      "dumbbell": {
        "excludedVariations": [
          "band",
          "barbell",
          "cable"
        ]
      },
      "cable": {
        "excludedVariations": [
          "band",
          "barbell",
          "dumbbell"
        ]
      },
      "band": {
        "excludedVariations": [
          "barbell",
          "cable",
          "dumbbell"
        ]
      }
    }
  },
  {
    "pk": "d8e71f8c-9a0b-4d52-c3e8-0f5b6d9c2a74",
    "name": "Farmer's Carry",
    "muscleGroups": [
      "Shoulders",
      "Back"
    ],
    "primaryMuscles": [
      "wrist flexors",
      "trapezius"
    ],
    "secondaryMuscles": [
      "erector spinae",
      "lateral deltoid",
      "gluteus maximus"
    ],
    "variations": {
      "single-arm": {
        "excludedVariations": [
          "mixed-grip",
          "overhead",
          "suitcase carry",
          "waiter's carry"
        ]
      },
      "overhead": {
        "excludedVariations": [
          "mixed-grip",
          "single-arm",
          "suitcase carry",
          "waiter's carry"
        ]
      },
      "waiter's carry": {
        "excludedVariations": [
          "mixed-grip",
          "overhead",
          "single-arm",
          "suitcase carry"
        ]
      },
      "suitcase carry": {
        "excludedVariations": [
          "mixed-grip",
          "overhead",
          "single-arm",
          "waiter's carry"
        ]
      },
      "mixed-grip": {
        "excludedVariations": [
          "overhead",
          "single-arm",
          "suitcase carry",
          "waiter's carry"
        ]
      },
      "dumbbell": {
        "excludedVariations": [
          "axle bar",
          "barbell",
          "double kettlebell",
          "kettlebell",
          "trap bar",
          "yoke"
        ]
      },
      "barbell": {
        "excludedVariations": [
          "axle bar",
          "double kettlebell",
          "dumbbell",
          "kettlebell",
          "trap bar",
          "yoke"
        ]
      },
      "kettlebell": {
        "excludedVariations": [
          "axle bar",
          "barbell",
          "double kettlebell",
          "dumbbell",
          "trap bar",
          "yoke"
        ]
      },
      "trap bar": {
        "excludedVariations": [
          "axle bar",
          "barbell",
          "double kettlebell",
          "dumbbell",
          "kettlebell",
          "yoke"
        ]
      },
      "yoke": {
        "excludedVariations": [
          "axle bar",
          "barbell",
          "double kettlebell",
          "dumbbell",
          "kettlebell",
          "trap bar"
        ]
      },
      "axle bar": {
        "excludedVariations": [
          "barbell",
          "double kettlebell",
          "dumbbell",
          "kettlebell",
          "trap bar",
          "yoke"
        ]
      },
      "double kettlebell": {
        "excludedVariations": [
          "axle bar",
          "barbell",
          "dumbbell",
          "kettlebell",
          "trap bar",
          "yoke"
        ]
      }
    }
  },
  {
    "pk": "e9f82a9d-0b1c-4e63-d4f9-1a6c7e0d3b85",
    "name": "Snatch",
    "muscleGroups": [
      "Back"
    ],
    "primaryMuscles": [
      "gluteus maximus",
      "hamstrings",
      "erector spinae"
    ],
    "secondaryMuscles": [
      "trapezius",
      "anterior deltoid",
      "quadriceps femoris",
      "wrist extensors"
    ],
    "variations": {
      "hang": {
        "excludedVariations": [
          "drop snatch",
          "muscle snatch",
          "overhead squat",
          "paused",
          "power",
          "snatch balance",
          "squat",
          "wide-grip"
        ]
      },
      "power": {
        "excludedVariations": [
          "drop snatch",
          "hang",
          "muscle snatch",
          "overhead squat",
          "paused",
          "snatch balance",
          "squat",
          "wide-grip"
        ]
      },
      "squat": {
        "excludedVariations": [
          "drop snatch",
          "hang",
          "muscle snatch",
          "overhead squat",
          "paused",
          "power",
          "snatch balance",
          "wide-grip"
        ]
      },
      "muscle snatch": {
        "excludedVariations": [
          "drop snatch",
          "hang",
          "overhead squat",
          "paused",
          "power",
          "snatch balance",
          "squat",
          "wide-grip"
        ]
      },
      "overhead squat": {
        "excludedVariations": [
          "drop snatch",
          "hang",
          "muscle snatch",
          "paused",
          "power",
          "snatch balance",
          "squat",
          "wide-grip"
        ]
      },
      "snatch balance": {
        "excludedVariations": [
          "drop snatch",
          "hang",
          "muscle snatch",
          "overhead squat",
          "paused",
          "power",
          "squat",
          "wide-grip"
        ]
      },
      "drop snatch": {
        "excludedVariations": [
          "hang",
          "muscle snatch",
          "overhead squat",
          "paused",
          "power",
          "snatch balance",
          "squat",
          "wide-grip"
        ]
      },
      "paused": {
        "excludedVariations": [
          "drop snatch",
          "hang",
          "muscle snatch",
          "overhead squat",
          "power",
          "snatch balance",
          "squat",
          "wide-grip"
        ]
      },
      "wide-grip": {
        "excludedVariations": [
          "drop snatch",
          "hang",
          "muscle snatch",
          "overhead squat",
          "paused",
          "power",
          "snatch balance",
          "squat"
        ]
      },
      "barbell": {
        "excludedVariations": [
          "block",
          "dumbbell",
          "kettlebell"
        ]
      },
      "dumbbell": {
        "excludedVariations": [
          "barbell",
          "block",
          "kettlebell"
        ]
      },
      "kettlebell": {
        "excludedVariations": [
          "barbell",
          "block",
          "dumbbell"
        ]
      },
      "block": {
        "excludedVariations": [
          "barbell",
          "dumbbell",
          "kettlebell"
        ]
      }
    }
  },
  {
    "pk": "f0a93b0e-1c2d-4f74-e5a0-2b7d8f1e4c96",
    "name": "Clean",
    "muscleGroups": [
      "Back"
    ],
    "primaryMuscles": [
      "gluteus maximus",
      "hamstrings",
      "erector spinae"
    ],
    "secondaryMuscles": [
      "trapezius",
      "quadriceps femoris",
      "wrist extensors"
    ],
    "variations": {
      "hang": {
        "excludedVariations": [
          "clean pull",
          "clean shrug",
          "deficit",
          "low-hang",
          "paused",
          "power",
          "single-arm",
          "squat",
          "tall clean"
        ]
      },
      "power": {
        "excludedVariations": [
          "clean pull",
          "clean shrug",
          "deficit",
          "hang",
          "low-hang",
          "paused",
          "single-arm",
          "squat",
          "tall clean"
        ]
      },
      "squat": {
        "excludedVariations": [
          "clean pull",
          "clean shrug",
          "deficit",
          "hang",
          "low-hang",
          "paused",
          "power",
          "single-arm",
          "tall clean"
        ]
      },
      "single-arm": {
        "excludedVariations": [
          "clean pull",
          "clean shrug",
          "deficit",
          "hang",
          "low-hang",
          "paused",
          "power",
          "squat",
          "tall clean"
        ]
      },
      "clean pull": {
        "excludedVariations": [
          "clean shrug",
          "deficit",
          "hang",
          "low-hang",
          "paused",
          "power",
          "single-arm",
          "squat",
          "tall clean"
        ]
      },
      "tall clean": {
        "excludedVariations": [
          "clean pull",
          "clean shrug",
          "deficit",
          "hang",
          "low-hang",
          "paused",
          "power",
          "single-arm",
          "squat"
        ]
      },
      "clean shrug": {
        "excludedVariations": [
          "clean pull",
          "deficit",
          "hang",
          "low-hang",
          "paused",
          "power",
          "single-arm",
          "squat",
          "tall clean"
        ]
      },
      "low-hang": {
        "excludedVariations": [
          "clean pull",
          "clean shrug",
          "deficit",
          "hang",
          "paused",
          "power",
          "single-arm",
          "squat",
          "tall clean"
        ]
      },
      "paused": {
        "excludedVariations": [
          "clean pull",
          "clean shrug",
          "deficit",
          "hang",
          "low-hang",
          "power",
          "single-arm",
          "squat",
          "tall clean"
        ]
      },
      "deficit": {
        "excludedVariations": [
          "clean pull",
          "clean shrug",
          "hang",
          "low-hang",
          "paused",
          "power",
          "single-arm",
          "squat",
          "tall clean"
        ]
      },
      "dumbbell": {
        "excludedVariations": [
          "block",
          "kettlebell"
        ]
      },
      "kettlebell": {
        "excludedVariations": [
          "block",
          "dumbbell"
        ]
      },
      "block": {
        "excludedVariations": [
          "dumbbell",
          "kettlebell"
        ]
      }
    }
  },
  {
    "pk": "a1b04c1f-2d3e-4a85-f6b1-3c8e9a2d5f07",
    "name": "Kettlebell Swing",
    "muscleGroups": [
      "Back",
      "Glutes"
    ],
    "primaryMuscles": [
      "gluteus maximus",
      "hamstrings"
    ],
    "secondaryMuscles": [
      "erector spinae",
      "anterior deltoid",
      "wrist flexors"
    ],
    "variations": {
      "two-hand": {
        "excludedVariations": [
          "American",
          "ballistic",
          "dead swing",
          "high pull",
          "single-arm",
          "snatch-grip",
          "sumo"
        ]
      },
      "single-arm": {
        "excludedVariations": [
          "American",
          "ballistic",
          "dead swing",
          "high pull",
          "snatch-grip",
          "sumo",
          "two-hand"
        ]
      },
      "American": {
        "excludedVariations": [
          "ballistic",
          "dead swing",
          "high pull",
          "single-arm",
          "snatch-grip",
          "sumo",
          "two-hand"
        ]
      },
      "sumo": {
        "excludedVariations": [
          "American",
          "ballistic",
          "dead swing",
          "high pull",
          "single-arm",
          "snatch-grip",
          "two-hand"
        ]
      },
      "high pull": {
        "excludedVariations": [
          "American",
          "ballistic",
          "dead swing",
          "single-arm",
          "snatch-grip",
          "sumo",
          "two-hand"
        ]
      },
      "dead swing": {
        "excludedVariations": [
          "American",
          "ballistic",
          "high pull",
          "single-arm",
          "snatch-grip",
          "sumo",
          "two-hand"
        ]
      },
      "ballistic": {
        "excludedVariations": [
          "American",
          "dead swing",
          "high pull",
          "single-arm",
          "snatch-grip",
          "sumo",
          "two-hand"
        ]
      },
      "snatch-grip": {
        "excludedVariations": [
          "American",
          "ballistic",
          "dead swing",
          "high pull",
          "single-arm",
          "sumo",
          "two-hand"
        ]
      },
      "banded": {
        "excludedVariations": []
      }
    }
  },
  {
    "pk": "b2c15d2a-3e4f-4b96-a7c2-4d9f0b3e6a18",
    "name": "Landmine Press",
    "muscleGroups": [
      "Push",
      "Shoulders",
      "Chest"
    ],
    "primaryMuscles": [
      "anterior deltoid",
      "pectoralis major"
    ],
    "secondaryMuscles": [
      "triceps brachii",
      "lateral deltoid"
    ],
    "variations": {
      "single-arm": {
        "excludedVariations": [
          "alternating",
          "bilateral",
          "half-kneeling",
          "kneeling",
          "push press",
          "rotational",
          "split-stance",
          "squat-to-press",
          "standing"
        ]
      },
      "kneeling": {
        "excludedVariations": [
          "alternating",
          "bilateral",
          "half-kneeling",
          "push press",
          "rotational",
          "single-arm",
          "split-stance",
          "squat-to-press",
          "standing"
        ]
      },
      "standing": {
        "excludedVariations": [
          "alternating",
          "bilateral",
          "half-kneeling",
          "kneeling",
          "push press",
          "rotational",
          "single-arm",
          "split-stance",
          "squat-to-press"
        ]
      },
      "half-kneeling": {
        "excludedVariations": [
          "alternating",
          "bilateral",
          "kneeling",
          "push press",
          "rotational",
          "single-arm",
          "split-stance",
          "squat-to-press",
          "standing"
        ]
      },
      "push press": {
        "excludedVariations": [
          "alternating",
          "bilateral",
          "half-kneeling",
          "kneeling",
          "rotational",
          "single-arm",
          "split-stance",
          "squat-to-press",
          "standing"
        ]
      },
      "bilateral": {
        "excludedVariations": [
          "alternating",
          "half-kneeling",
          "kneeling",
          "push press",
          "rotational",
          "single-arm",
          "split-stance",
          "squat-to-press",
          "standing"
        ]
      },
      "alternating": {
        "excludedVariations": [
          "bilateral",
          "half-kneeling",
          "kneeling",
          "push press",
          "rotational",
          "single-arm",
          "split-stance",
          "squat-to-press",
          "standing"
        ]
      },
      "rotational": {
        "excludedVariations": [
          "alternating",
          "bilateral",
          "half-kneeling",
          "kneeling",
          "push press",
          "single-arm",
          "split-stance",
          "squat-to-press",
          "standing"
        ]
      },
      "squat-to-press": {
        "excludedVariations": [
          "alternating",
          "bilateral",
          "half-kneeling",
          "kneeling",
          "push press",
          "rotational",
          "single-arm",
          "split-stance",
          "standing"
        ]
      },
      "split-stance": {
        "excludedVariations": [
          "alternating",
          "bilateral",
          "half-kneeling",
          "kneeling",
          "push press",
          "rotational",
          "single-arm",
          "squat-to-press",
          "standing"
        ]
      }
    }
  },
  {
    "pk": "f6a59b6e-7c8d-4f30-e1a6-8b3d4f7c0e52",
    "name": "Pullover",
    "muscleGroups": [
      "Chest",
      "Back"
    ],
    "primaryMuscles": [
      "pectoralis major",
      "latissimus dorsi"
    ],
    "secondaryMuscles": [
      "triceps brachii",
      "posterior deltoid"
    ],
    "variations": {
      "decline": {
        "excludedVariations": [
          "EZ-bar",
          "bent-arm",
          "single-arm",
          "straight-arm"
        ]
      },
      "single-arm": {
        "excludedVariations": [
          "EZ-bar",
          "bent-arm",
          "decline",
          "straight-arm"
        ]
      },
      "EZ-bar": {
        "excludedVariations": [
          "bent-arm",
          "decline",
          "single-arm",
          "straight-arm"
        ]
      },
      "straight-arm": {
        "excludedVariations": [
          "EZ-bar",
          "bent-arm",
          "decline",
          "single-arm"
        ]
      },
      "bent-arm": {
        "excludedVariations": [
          "EZ-bar",
          "decline",
          "single-arm",
          "straight-arm"
        ]
      },
      "dumbbell": {
        "excludedVariations": [
          "barbell",
          "cable",
          "flat bench",
          "machine"
        ]
      },
      "flat bench": {
        "excludedVariations": [
          "barbell",
          "cable",
          "dumbbell",
          "machine"
        ]
      },
      "cable": {
        "excludedVariations": [
          "barbell",
          "dumbbell",
          "flat bench",
          "machine"
        ]
      },
      "barbell": {
        "excludedVariations": [
          "cable",
          "dumbbell",
          "flat bench",
          "machine"
        ]
      },
      "machine": {
        "excludedVariations": [
          "barbell",
          "cable",
          "dumbbell",
          "flat bench"
        ]
      }
    }
  },
  {
    "pk": "b8c71d8a-9e0f-4b52-a3c8-0d5f6b9e2c74",
    "name": "Meadows Row",
    "muscleGroups": [
      "Back"
    ],
    "primaryMuscles": [
      "latissimus dorsi",
      "posterior deltoid"
    ],
    "secondaryMuscles": [
      "biceps brachii",
      "wrist flexors",
      "trapezius"
    ],
    "variations": {
      "overhand": {
        "excludedVariations": [
          "chest-supported",
          "heavy",
          "kneeling",
          "neutral-grip",
          "single-arm",
          "staggered-stance",
          "underhand"
        ]
      },
      "underhand": {
        "excludedVariations": [
          "chest-supported",
          "heavy",
          "kneeling",
          "neutral-grip",
          "overhand",
          "single-arm",
          "staggered-stance"
        ]
      },
      "neutral-grip": {
        "excludedVariations": [
          "chest-supported",
          "heavy",
          "kneeling",
          "overhand",
          "single-arm",
          "staggered-stance",
          "underhand"
        ]
      },
      "kneeling": {
        "excludedVariations": [
          "chest-supported",
          "heavy",
          "neutral-grip",
          "overhand",
          "single-arm",
          "staggered-stance",
          "underhand"
        ]
      },
      "chest-supported": {
        "excludedVariations": [
          "heavy",
          "kneeling",
          "neutral-grip",
          "overhand",
          "single-arm",
          "staggered-stance",
          "underhand"
        ]
      },
      "staggered-stance": {
        "excludedVariations": [
          "chest-supported",
          "heavy",
          "kneeling",
          "neutral-grip",
          "overhand",
          "single-arm",
          "underhand"
        ]
      },
      "heavy": {
        "excludedVariations": [
          "chest-supported",
          "kneeling",
          "neutral-grip",
          "overhand",
          "single-arm",
          "staggered-stance",
          "underhand"
        ]
      },
      "single-arm": {
        "excludedVariations": [
          "chest-supported",
          "heavy",
          "kneeling",
          "neutral-grip",
          "overhand",
          "staggered-stance",
          "underhand"
        ]
      }
    }
  },
  {
    "pk": "d0e93f0c-1a2b-4d74-c5e0-2f7a8d1e4f96",
    "name": "Band Pull-Apart",
    "muscleGroups": [
      "Shoulders"
    ],
    "primaryMuscles": [
      "posterior deltoid",
      "infraspinatus"
    ],
    "secondaryMuscles": [
      "trapezius",
      "lateral deltoid"
    ],
    "variations": {
      "overhand": {
        "excludedVariations": [
          "chest-level",
          "narrow-grip",
          "overhead",
          "single-arm",
          "underhand",
          "wide-grip"
        ]
      },
      "underhand": {
        "excludedVariations": [
          "chest-level",
          "narrow-grip",
          "overhand",
          "overhead",
          "single-arm",
          "wide-grip"
        ]
      },
      "wide-grip": {
        "excludedVariations": [
          "chest-level",
          "narrow-grip",
          "overhand",
          "overhead",
          "single-arm",
          "underhand"
        ]
      },
      "narrow-grip": {
        "excludedVariations": [
          "chest-level",
          "overhand",
          "overhead",
          "single-arm",
          "underhand",
          "wide-grip"
        ]
      },
      "chest-level": {
        "excludedVariations": [
          "narrow-grip",
          "overhand",
          "overhead",
          "single-arm",
          "underhand",
          "wide-grip"
        ]
      },
      "overhead": {
        "excludedVariations": [
          "chest-level",
          "narrow-grip",
          "overhand",
          "single-arm",
          "underhand",
          "wide-grip"
        ]
      },
      "single-arm": {
        "excludedVariations": [
          "chest-level",
          "narrow-grip",
          "overhand",
          "overhead",
          "underhand",
          "wide-grip"
        ]
      }
    }
  },
  {
    "pk": "e1f04a1d-2b3c-4e85-d6f1-3a8d9e2f5a07",
    "name": "Cable External Rotation",
    "muscleGroups": [
      "Shoulders"
    ],
    "primaryMuscles": [
      "infraspinatus"
    ],
    "secondaryMuscles": [
      "posterior deltoid"
    ],
    "variations": {
      "standing": {
        "excludedVariations": [
          "90-degree abduction",
          "doorway",
          "lying",
          "prone",
          "seated",
          "side-lying",
          "single-arm"
        ]
      },
      "seated": {
        "excludedVariations": [
          "90-degree abduction",
          "doorway",
          "lying",
          "prone",
          "side-lying",
          "single-arm",
          "standing"
        ]
      },
      "single-arm": {
        "excludedVariations": [
          "90-degree abduction",
          "doorway",
          "lying",
          "prone",
          "seated",
          "side-lying",
          "standing"
        ]
      },
      "lying": {
        "excludedVariations": [
          "90-degree abduction",
          "doorway",
          "prone",
          "seated",
          "side-lying",
          "single-arm",
          "standing"
        ]
      },
      "90-degree abduction": {
        "excludedVariations": [
          "doorway",
          "lying",
          "prone",
          "seated",
          "side-lying",
          "single-arm",
          "standing"
        ]
      },
      "side-lying": {
        "excludedVariations": [
          "90-degree abduction",
          "doorway",
          "lying",
          "prone",
          "seated",
          "single-arm",
          "standing"
        ]
      },
      "prone": {
        "excludedVariations": [
          "90-degree abduction",
          "doorway",
          "lying",
          "seated",
          "side-lying",
          "single-arm",
          "standing"
        ]
      },
      "doorway": {
        "excludedVariations": [
          "90-degree abduction",
          "lying",
          "prone",
          "seated",
          "side-lying",
          "single-arm",
          "standing"
        ]
      },
      "band": {
        "excludedVariations": []
      }
    }
  },
  {
    "pk": "f2a15b2e-3c4d-4f96-e7a2-4b9e0f3a6b18",
    "name": "Internal Rotation",
    "muscleGroups": [
      "Shoulders"
    ],
    "primaryMuscles": [
      "subscapularis"
    ],
    "secondaryMuscles": [
      "anterior deltoid"
    ],
    "variations": {
      "standing": {
        "excludedVariations": [
          "90-degree abduction",
          "lying",
          "prone",
          "seated",
          "side-lying",
          "single-arm"
        ]
      },
      "seated": {
        "excludedVariations": [
          "90-degree abduction",
          "lying",
          "prone",
          "side-lying",
          "single-arm",
          "standing"
        ]
      },
      "single-arm": {
        "excludedVariations": [
          "90-degree abduction",
          "lying",
          "prone",
          "seated",
          "side-lying",
          "standing"
        ]
      },
      "lying": {
        "excludedVariations": [
          "90-degree abduction",
          "prone",
          "seated",
          "side-lying",
          "single-arm",
          "standing"
        ]
      },
      "90-degree abduction": {
        "excludedVariations": [
          "lying",
          "prone",
          "seated",
          "side-lying",
          "single-arm",
          "standing"
        ]
      },
      "side-lying": {
        "excludedVariations": [
          "90-degree abduction",
          "lying",
          "prone",
          "seated",
          "single-arm",
          "standing"
        ]
      },
      "prone": {
        "excludedVariations": [
          "90-degree abduction",
          "lying",
          "seated",
          "side-lying",
          "single-arm",
          "standing"
        ]
      },
      "cable": {
        "excludedVariations": [
          "band"
        ]
      },
      "band": {
        "excludedVariations": [
          "cable"
        ]
      }
    }
  },
  {
    "pk": "d6e59f6d-7a8b-4d30-c1e6-8f3b4d7e0a52",
    "name": "Rack Pull",
    "muscleGroups": [
      "Back"
    ],
    "primaryMuscles": [
      "erector spinae",
      "gluteus maximus"
    ],
    "secondaryMuscles": [
      "trapezius",
      "hamstrings",
      "wrist flexors"
    ],
    "variations": {
      "below-knee": {
        "excludedVariations": [
          "above-knee",
          "deficit",
          "mixed-grip",
          "overhand",
          "paused",
          "snatch-grip",
          "sumo",
          "wide-grip"
        ]
      },
      "above-knee": {
        "excludedVariations": [
          "below-knee",
          "deficit",
          "mixed-grip",
          "overhand",
          "paused",
          "snatch-grip",
          "sumo",
          "wide-grip"
        ]
      },
      "sumo": {
        "excludedVariations": [
          "above-knee",
          "below-knee",
          "deficit",
          "mixed-grip",
          "overhand",
          "paused",
          "snatch-grip",
          "wide-grip"
        ]
      },
      "wide-grip": {
        "excludedVariations": [
          "above-knee",
          "below-knee",
          "deficit",
          "mixed-grip",
          "overhand",
          "paused",
          "snatch-grip",
          "sumo"
        ]
      },
      "snatch-grip": {
        "excludedVariations": [
          "above-knee",
          "below-knee",
          "deficit",
          "mixed-grip",
          "overhand",
          "paused",
          "sumo",
          "wide-grip"
        ]
      },
      "mixed-grip": {
        "excludedVariations": [
          "above-knee",
          "below-knee",
          "deficit",
          "overhand",
          "paused",
          "snatch-grip",
          "sumo",
          "wide-grip"
        ]
      },
      "overhand": {
        "excludedVariations": [
          "above-knee",
          "below-knee",
          "deficit",
          "mixed-grip",
          "paused",
          "snatch-grip",
          "sumo",
          "wide-grip"
        ]
      },
      "deficit": {
        "excludedVariations": [
          "above-knee",
          "below-knee",
          "mixed-grip",
          "overhand",
          "paused",
          "snatch-grip",
          "sumo",
          "wide-grip"
        ]
      },
      "paused": {
        "excludedVariations": [
          "above-knee",
          "below-knee",
          "deficit",
          "mixed-grip",
          "overhand",
          "snatch-grip",
          "sumo",
          "wide-grip"
        ]
      },
      "barbell": {
        "excludedVariations": [
          "straps"
        ]
      },
      "straps": {
        "excludedVariations": [
          "barbell"
        ]
      }
    }
  },
  {
    "pk": "e7f60a7e-8b9c-4e41-d2f7-9a4c5e8f1b63",
    "name": "Hip Adduction",
    "muscleGroups": [
      "Legs"
    ],
    "primaryMuscles": [
      "hip adductors"
    ],
    "secondaryMuscles": [
      "gluteus maximus"
    ],
    "variations": {
      "seated": {
        "excludedVariations": [
          "Copenhagen plank",
          "lying",
          "side-lying",
          "single-leg",
          "standing"
        ]
      },
      "standing": {
        "excludedVariations": [
          "Copenhagen plank",
          "lying",
          "seated",
          "side-lying",
          "single-leg"
        ]
      },
      "lying": {
        "excludedVariations": [
          "Copenhagen plank",
          "seated",
          "side-lying",
          "single-leg",
          "standing"
        ]
      },
      "Copenhagen plank": {
        "excludedVariations": [
          "lying",
          "seated",
          "side-lying",
          "single-leg",
          "standing"
        ]
      },
      "side-lying": {
        "excludedVariations": [
          "Copenhagen plank",
          "lying",
          "seated",
          "single-leg",
          "standing"
        ]
      },
      "single-leg": {
        "excludedVariations": [
          "Copenhagen plank",
          "lying",
          "seated",
          "side-lying",
          "standing"
        ]
      },
      "machine": {
        "excludedVariations": [
          "banded",
          "cable"
        ]
      },
      "cable": {
        "excludedVariations": [
          "banded",
          "machine"
        ]
      },
      "banded": {
        "excludedVariations": [
          "cable",
          "machine"
        ]
      }
    }
  },
  {
    "pk": "f8a71b8f-9c0d-4f52-e3a8-0b5d6f9f2c74",
    "name": "Box Jump",
    "muscleGroups": [
      "Legs"
    ],
    "primaryMuscles": [
      "gluteus maximus",
      "quadriceps femoris"
    ],
    "secondaryMuscles": [
      "hamstrings",
      "gastrocnemius"
    ],
    "variations": {
      "standard": {
        "excludedVariations": [
          "broad jump",
          "depth jump",
          "lateral",
          "rotational",
          "single-leg",
          "step-down"
        ]
      },
      "depth jump": {
        "excludedVariations": [
          "broad jump",
          "lateral",
          "rotational",
          "single-leg",
          "standard",
          "step-down"
        ]
      },
      "single-leg": {
        "excludedVariations": [
          "broad jump",
          "depth jump",
          "lateral",
          "rotational",
          "standard",
          "step-down"
        ]
      },
      "lateral": {
        "excludedVariations": [
          "broad jump",
          "depth jump",
          "rotational",
          "single-leg",
          "standard",
          "step-down"
        ]
      },
      "rotational": {
        "excludedVariations": [
          "broad jump",
          "depth jump",
          "lateral",
          "single-leg",
          "standard",
          "step-down"
        ]
      },
      "broad jump": {
        "excludedVariations": [
          "depth jump",
          "lateral",
          "rotational",
          "single-leg",
          "standard",
          "step-down"
        ]
      },
      "step-down": {
        "excludedVariations": [
          "broad jump",
          "depth jump",
          "lateral",
          "rotational",
          "single-leg",
          "standard"
        ]
      },
      "weighted": {
        "excludedVariations": [
          "banded",
          "hurdle"
        ]
      },
      "banded": {
        "excludedVariations": [
          "hurdle",
          "weighted"
        ]
      },
      "hurdle": {
        "excludedVariations": [
          "banded",
          "weighted"
        ]
      }
    }
  },
  {
    "pk": "a9b82c9a-0d1e-4a63-f4b9-1c6e7a0a3d85",
    "name": "Wall Sit",
    "muscleGroups": [
      "Legs",
      "Core"
    ],
    "primaryMuscles": [
      "quadriceps femoris"
    ],
    "secondaryMuscles": [
      "gluteus maximus",
      "hamstrings"
    ],
    "variations": {
      "bodyweight": {
        "excludedVariations": [
          "heels-elevated",
          "overhead hold",
          "single-leg",
          "with press"
        ]
      },
      "single-leg": {
        "excludedVariations": [
          "bodyweight",
          "heels-elevated",
          "overhead hold",
          "with press"
        ]
      },
      "heels-elevated": {
        "excludedVariations": [
          "bodyweight",
          "overhead hold",
          "single-leg",
          "with press"
        ]
      },
      "with press": {
        "excludedVariations": [
          "bodyweight",
          "heels-elevated",
          "overhead hold",
          "single-leg"
        ]
      },
      "overhead hold": {
        "excludedVariations": [
          "bodyweight",
          "heels-elevated",
          "single-leg",
          "with press"
        ]
      },
      "weighted": {
        "excludedVariations": [
          "banded",
          "stability ball"
        ]
      },
      "banded": {
        "excludedVariations": [
          "stability ball",
          "weighted"
        ]
      },
      "stability ball": {
        "excludedVariations": [
          "banded",
          "weighted"
        ]
      }
    }
  },
  {
    "pk": "b0c93d0b-1e2f-4b74-a5c0-2d7f8b1b4e96",
    "name": "Dead Bug",
    "muscleGroups": [
      "Core"
    ],
    "primaryMuscles": [
      "rectus abdominis"
    ],
    "secondaryMuscles": [
      "external obliques",
      "erector spinae"
    ],
    "variations": {
      "bodyweight": {
        "excludedVariations": [
          "contralateral",
          "single-arm",
          "single-leg"
        ]
      },
      "single-arm": {
        "excludedVariations": [
          "bodyweight",
          "contralateral",
          "single-leg"
        ]
      },
      "single-leg": {
        "excludedVariations": [
          "bodyweight",
          "contralateral",
          "single-arm"
        ]
      },
      "contralateral": {
        "excludedVariations": [
          "bodyweight",
          "single-arm",
          "single-leg"
        ]
      },
      "weighted": {
        "excludedVariations": [
          "band",
          "dumbbell",
          "stability ball"
        ]
      },
      "band": {
        "excludedVariations": [
          "dumbbell",
          "stability ball",
          "weighted"
        ]
      },
      "stability ball": {
        "excludedVariations": [
          "band",
          "dumbbell",
          "weighted"
        ]
      },
      "dumbbell": {
        "excludedVariations": [
          "band",
          "stability ball",
          "weighted"
        ]
      }
    }
  },
  {
    "pk": "c1d04e1c-2f3a-4c85-b6d1-3e8a9c2c5f07",
    "name": "Pallof Press",
    "muscleGroups": [
      "Core"
    ],
    "primaryMuscles": [
      "external obliques",
      "rectus abdominis"
    ],
    "secondaryMuscles": [
      "anterior deltoid",
      "erector spinae"
    ],
    "variations": {
      "kneeling": {
        "excludedVariations": [
          "half-kneeling",
          "isometric",
          "overhead",
          "push",
          "rotation",
          "single-arm",
          "split-stance",
          "standing"
        ]
      },
      "standing": {
        "excludedVariations": [
          "half-kneeling",
          "isometric",
          "kneeling",
          "overhead",
          "push",
          "rotation",
          "single-arm",
          "split-stance"
        ]
      },
      "half-kneeling": {
        "excludedVariations": [
          "isometric",
          "kneeling",
          "overhead",
          "push",
          "rotation",
          "single-arm",
          "split-stance",
          "standing"
        ]
      },
      "single-arm": {
        "excludedVariations": [
          "half-kneeling",
          "isometric",
          "kneeling",
          "overhead",
          "push",
          "rotation",
          "split-stance",
          "standing"
        ]
      },
      "push": {
        "excludedVariations": [
          "half-kneeling",
          "isometric",
          "kneeling",
          "overhead",
          "rotation",
          "single-arm",
          "split-stance",
          "standing"
        ]
      },
      "overhead": {
        "excludedVariations": [
          "half-kneeling",
          "isometric",
          "kneeling",
          "push",
          "rotation",
          "single-arm",
          "split-stance",
          "standing"
        ]
      },
      "rotation": {
        "excludedVariations": [
          "half-kneeling",
          "isometric",
          "kneeling",
          "overhead",
          "push",
          "single-arm",
          "split-stance",
          "standing"
        ]
      },
      "isometric": {
        "excludedVariations": [
          "half-kneeling",
          "kneeling",
          "overhead",
          "push",
          "rotation",
          "single-arm",
          "split-stance",
          "standing"
        ]
      },
      "split-stance": {
        "excludedVariations": [
          "half-kneeling",
          "isometric",
          "kneeling",
          "overhead",
          "push",
          "rotation",
          "single-arm",
          "standing"
        ]
      },
      "cable": {
        "excludedVariations": [
          "band"
        ]
      },
      "band": {
        "excludedVariations": [
          "cable"
        ]
      }
    }
  },
  {
    "pk": "d2e15f2d-3a4b-4d96-c7e2-4f9b0d3d6a18",
    "name": "Ab Wheel Rollout",
    "muscleGroups": [
      "Core"
    ],
    "primaryMuscles": [
      "rectus abdominis"
    ],
    "secondaryMuscles": [
      "external obliques",
      "erector spinae",
      "anterior deltoid"
    ],
    "variations": {
      "kneeling": {
        "excludedVariations": [
          "feet-elevated",
          "pike",
          "single-arm",
          "standing"
        ]
      },
      "standing": {
        "excludedVariations": [
          "feet-elevated",
          "kneeling",
          "pike",
          "single-arm"
        ]
      },
      "single-arm": {
        "excludedVariations": [
          "feet-elevated",
          "kneeling",
          "pike",
          "standing"
        ]
      },
      "pike": {
        "excludedVariations": [
          "feet-elevated",
          "kneeling",
          "single-arm",
          "standing"
        ]
      },
      "feet-elevated": {
        "excludedVariations": [
          "kneeling",
          "pike",
          "single-arm",
          "standing"
        ]
      },
      "barbell": {
        "excludedVariations": [
          "band-assisted",
          "weighted"
        ]
      },
      "band-assisted": {
        "excludedVariations": [
          "barbell",
          "weighted"
        ]
      },
      "weighted": {
        "excludedVariations": [
          "band-assisted",
          "barbell"
        ]
      }
    }
  },
  {
    "pk": "e3f26a3e-4b5c-4e07-d8f3-5a0c1e4e7b29",
    "name": "Russian Twist",
    "muscleGroups": [
      "Core"
    ],
    "primaryMuscles": [
      "external obliques"
    ],
    "secondaryMuscles": [
      "rectus abdominis"
    ],
    "variations": {
      "bodyweight": {
        "excludedVariations": [
          "decline",
          "feet-elevated"
        ]
      },
      "feet-elevated": {
        "excludedVariations": [
          "bodyweight",
          "decline"
        ]
      },
      "decline": {
        "excludedVariations": [
          "bodyweight",
          "feet-elevated"
        ]
      },
      "weighted": {
        "excludedVariations": [
          "band-resisted",
          "cable",
          "kettlebell",
          "medicine ball",
          "plate"
        ]
      },
      "medicine ball": {
        "excludedVariations": [
          "band-resisted",
          "cable",
          "kettlebell",
          "plate",
          "weighted"
        ]
      },
      "cable": {
        "excludedVariations": [
          "band-resisted",
          "kettlebell",
          "medicine ball",
          "plate",
          "weighted"
        ]
      },
      "plate": {
        "excludedVariations": [
          "band-resisted",
          "cable",
          "kettlebell",
          "medicine ball",
          "weighted"
        ]
      },
      "kettlebell": {
        "excludedVariations": [
          "band-resisted",
          "cable",
          "medicine ball",
          "plate",
          "weighted"
        ]
      },
      "band-resisted": {
        "excludedVariations": [
          "cable",
          "kettlebell",
          "medicine ball",
          "plate",
          "weighted"
        ]
      }
    }
  },
  {
    "pk": "f4a37b4f-5c6d-4f18-e9a4-6b1d2f5f8c30",
    "name": "Knee Raise",
    "muscleGroups": [
      "Core"
    ],
    "primaryMuscles": [
      "rectus abdominis"
    ],
    "secondaryMuscles": [
      "external obliques",
      "wrist flexors",
      "iliopsoas"
    ],
    "variations": {
      "hanging": {
        "excludedVariations": [
          "bodyweight",
          "incline",
          "lying",
          "straight-leg",
          "toes-to-bar"
        ]
      },
      "bodyweight": {
        "excludedVariations": [
          "hanging",
          "incline",
          "lying",
          "straight-leg",
          "toes-to-bar"
        ]
      },
      "straight-leg": {
        "excludedVariations": [
          "bodyweight",
          "hanging",
          "incline",
          "lying",
          "toes-to-bar"
        ]
      },
      "toes-to-bar": {
        "excludedVariations": [
          "bodyweight",
          "hanging",
          "incline",
          "lying",
          "straight-leg"
        ]
      },
      "lying": {
        "excludedVariations": [
          "bodyweight",
          "hanging",
          "incline",
          "straight-leg",
          "toes-to-bar"
        ]
      },
      "incline": {
        "excludedVariations": [
          "bodyweight",
          "hanging",
          "lying",
          "straight-leg",
          "toes-to-bar"
        ]
      },
      "weighted": {
        "excludedVariations": [
          "band",
          "cable",
          "captain's chair",
          "parallel bars"
        ]
      },
      "captain's chair": {
        "excludedVariations": [
          "band",
          "cable",
          "parallel bars",
          "weighted"
        ]
      },
      "parallel bars": {
        "excludedVariations": [
          "band",
          "cable",
          "captain's chair",
          "weighted"
        ]
      },
      "cable": {
        "excludedVariations": [
          "band",
          "captain's chair",
          "parallel bars",
          "weighted"
        ]
      },
      "band": {
        "excludedVariations": [
          "cable",
          "captain's chair",
          "parallel bars",
          "weighted"
        ]
      }
    }
  },
  {
    "pk": "a5b48c50-6d7e-4a29-f0b5-7c2e3a6a9d41",
    "name": "Landmine Rotation",
    "muscleGroups": [
      "Core",
      "Shoulders"
    ],
    "primaryMuscles": [
      "external obliques"
    ],
    "secondaryMuscles": [
      "rectus abdominis",
      "anterior deltoid",
      "erector spinae"
    ],
    "variations": {
      "standing": {
        "excludedVariations": [
          "bilateral",
          "chop",
          "half-kneeling",
          "kneeling",
          "lift",
          "rotational push-press",
          "single-arm"
        ]
      },
      "kneeling": {
        "excludedVariations": [
          "bilateral",
          "chop",
          "half-kneeling",
          "lift",
          "rotational push-press",
          "single-arm",
          "standing"
        ]
      },
      "half-kneeling": {
        "excludedVariations": [
          "bilateral",
          "chop",
          "kneeling",
          "lift",
          "rotational push-press",
          "single-arm",
          "standing"
        ]
      },
      "single-arm": {
        "excludedVariations": [
          "bilateral",
          "chop",
          "half-kneeling",
          "kneeling",
          "lift",
          "rotational push-press",
          "standing"
        ]
      },
      "bilateral": {
        "excludedVariations": [
          "chop",
          "half-kneeling",
          "kneeling",
          "lift",
          "rotational push-press",
          "single-arm",
          "standing"
        ]
      },
      "chop": {
        "excludedVariations": [
          "bilateral",
          "half-kneeling",
          "kneeling",
          "lift",
          "rotational push-press",
          "single-arm",
          "standing"
        ]
      },
      "lift": {
        "excludedVariations": [
          "bilateral",
          "chop",
          "half-kneeling",
          "kneeling",
          "rotational push-press",
          "single-arm",
          "standing"
        ]
      },
      "rotational push-press": {
        "excludedVariations": [
          "bilateral",
          "chop",
          "half-kneeling",
          "kneeling",
          "lift",
          "single-arm",
          "standing"
        ]
      }
    }
  },
  {
    "pk": "b6c59d51-7e8f-4b30-a1c6-8d3f4b7b0e52",
    "name": "Cable Crunch",
    "muscleGroups": [
      "Core"
    ],
    "primaryMuscles": [
      "rectus abdominis"
    ],
    "secondaryMuscles": [
      "external obliques"
    ],
    "variations": {
      "kneeling": {
        "excludedVariations": [
          "oblique",
          "reverse",
          "seated",
          "side-lying",
          "single-arm",
          "standing"
        ]
      },
      "standing": {
        "excludedVariations": [
          "kneeling",
          "oblique",
          "reverse",
          "seated",
          "side-lying",
          "single-arm"
        ]
      },
      "single-arm": {
        "excludedVariations": [
          "kneeling",
          "oblique",
          "reverse",
          "seated",
          "side-lying",
          "standing"
        ]
      },
      "oblique": {
        "excludedVariations": [
          "kneeling",
          "reverse",
          "seated",
          "side-lying",
          "single-arm",
          "standing"
        ]
      },
      "reverse": {
        "excludedVariations": [
          "kneeling",
          "oblique",
          "seated",
          "side-lying",
          "single-arm",
          "standing"
        ]
      },
      "side-lying": {
        "excludedVariations": [
          "kneeling",
          "oblique",
          "reverse",
          "seated",
          "single-arm",
          "standing"
        ]
      },
      "seated": {
        "excludedVariations": [
          "kneeling",
          "oblique",
          "reverse",
          "side-lying",
          "single-arm",
          "standing"
        ]
      },
      "rope": {
        "excludedVariations": [
          "band"
        ]
      },
      "band": {
        "excludedVariations": [
          "rope"
        ]
      }
    }
  },
  {
    "pk": "c7d60e52-8f9a-4c41-b2d7-9e4a5c8c1f63",
    "name": "Reverse Hyperextension",
    "muscleGroups": [
      "Glutes",
      "Back"
    ],
    "primaryMuscles": [
      "gluteus maximus",
      "hamstrings",
      "erector spinae"
    ],
    "secondaryMuscles": [],
    "variations": {
      "GHD": {
        "excludedVariations": [
          "hip extension",
          "single-leg"
        ]
      },
      "single-leg": {
        "excludedVariations": [
          "GHD",
          "hip extension"
        ]
      },
      "hip extension": {
        "excludedVariations": [
          "GHD",
          "single-leg"
        ]
      },
      "machine": {
        "excludedVariations": [
          "banded",
          "flat bench",
          "parallel bars",
          "swiss ball",
          "weighted"
        ]
      },
      "flat bench": {
        "excludedVariations": [
          "banded",
          "machine",
          "parallel bars",
          "swiss ball",
          "weighted"
        ]
      },
      "weighted": {
        "excludedVariations": [
          "banded",
          "flat bench",
          "machine",
          "parallel bars",
          "swiss ball"
        ]
      },
      "banded": {
        "excludedVariations": [
          "flat bench",
          "machine",
          "parallel bars",
          "swiss ball",
          "weighted"
        ]
      },
      "swiss ball": {
        "excludedVariations": [
          "banded",
          "flat bench",
          "machine",
          "parallel bars",
          "weighted"
        ]
      },
      "parallel bars": {
        "excludedVariations": [
          "banded",
          "flat bench",
          "machine",
          "swiss ball",
          "weighted"
        ]
      }
    }
  },
  {
    "pk": "d8e71f53-9a0b-4d52-c3e8-0f5b6d9d2a74",
    "name": "Sled Push",
    "muscleGroups": [
      "Legs"
    ],
    "primaryMuscles": [
      "gluteus maximus",
      "quadriceps femoris"
    ],
    "secondaryMuscles": [
      "hamstrings",
      "gastrocnemius",
      "anterior deltoid"
    ],
    "variations": {
      "loaded": {
        "excludedVariations": [
          "backward",
          "heavy",
          "high-handles",
          "lateral",
          "low-handles",
          "single-arm",
          "sprint"
        ]
      },
      "sprint": {
        "excludedVariations": [
          "backward",
          "heavy",
          "high-handles",
          "lateral",
          "loaded",
          "low-handles",
          "single-arm"
        ]
      },
      "low-handles": {
        "excludedVariations": [
          "backward",
          "heavy",
          "high-handles",
          "lateral",
          "loaded",
          "single-arm",
          "sprint"
        ]
      },
      "high-handles": {
        "excludedVariations": [
          "backward",
          "heavy",
          "lateral",
          "loaded",
          "low-handles",
          "single-arm",
          "sprint"
        ]
      },
      "single-arm": {
        "excludedVariations": [
          "backward",
          "heavy",
          "high-handles",
          "lateral",
          "loaded",
          "low-handles",
          "sprint"
        ]
      },
      "backward": {
        "excludedVariations": [
          "heavy",
          "high-handles",
          "lateral",
          "loaded",
          "low-handles",
          "single-arm",
          "sprint"
        ]
      },
      "heavy": {
        "excludedVariations": [
          "backward",
          "high-handles",
          "lateral",
          "loaded",
          "low-handles",
          "single-arm",
          "sprint"
        ]
      },
      "lateral": {
        "excludedVariations": [
          "backward",
          "heavy",
          "high-handles",
          "loaded",
          "low-handles",
          "single-arm",
          "sprint"
        ]
      },
      "prowler": {
        "excludedVariations": [
          "banded"
        ]
      },
      "banded": {
        "excludedVariations": [
          "prowler"
        ]
      }
    }
  },
  {
    "pk": "e9f82a54-0b1c-4e63-d4f9-1a6c7e0e3b85",
    "name": "Sled Pull",
    "muscleGroups": [
      "Legs",
      "Back"
    ],
    "primaryMuscles": [
      "hamstrings",
      "gluteus maximus"
    ],
    "secondaryMuscles": [
      "erector spinae",
      "wrist flexors"
    ],
    "variations": {
      "strap": {
        "excludedVariations": [
          "ankle strap",
          "backward drag",
          "face-down",
          "hip harness",
          "seated",
          "single-arm",
          "sprinting",
          "walking"
        ]
      },
      "walking": {
        "excludedVariations": [
          "ankle strap",
          "backward drag",
          "face-down",
          "hip harness",
          "seated",
          "single-arm",
          "sprinting",
          "strap"
        ]
      },
      "sprinting": {
        "excludedVariations": [
          "ankle strap",
          "backward drag",
          "face-down",
          "hip harness",
          "seated",
          "single-arm",
          "strap",
          "walking"
        ]
      },
      "face-down": {
        "excludedVariations": [
          "ankle strap",
          "backward drag",
          "hip harness",
          "seated",
          "single-arm",
          "sprinting",
          "strap",
          "walking"
        ]
      },
      "backward drag": {
        "excludedVariations": [
          "ankle strap",
          "face-down",
          "hip harness",
          "seated",
          "single-arm",
          "sprinting",
          "strap",
          "walking"
        ]
      },
      "hip harness": {
        "excludedVariations": [
          "ankle strap",
          "backward drag",
          "face-down",
          "seated",
          "single-arm",
          "sprinting",
          "strap",
          "walking"
        ]
      },
      "ankle strap": {
        "excludedVariations": [
          "backward drag",
          "face-down",
          "hip harness",
          "seated",
          "single-arm",
          "sprinting",
          "strap",
          "walking"
        ]
      },
      "single-arm": {
        "excludedVariations": [
          "ankle strap",
          "backward drag",
          "face-down",
          "hip harness",
          "seated",
          "sprinting",
          "strap",
          "walking"
        ]
      },
      "seated": {
        "excludedVariations": [
          "ankle strap",
          "backward drag",
          "face-down",
          "hip harness",
          "single-arm",
          "sprinting",
          "strap",
          "walking"
        ]
      },
      "rope": {
        "excludedVariations": []
      }
    }
  }
]''';
