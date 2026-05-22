const String staticExerciseJson = r'''[
  {
    "pk": "1232d6bd-1b97-4c14-b8e6-de4a40cae8db",
    "name": "Pull-Up",
    "workoutGroups": [
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
    "movementVariations": [
      "bodyweight",
      "neutral-grip",
      "wide-grip",
      "close-grip",
      "butterfly",
      "archer",
      "L-sit",
      "typewriter",
      "commando",
      "behind-the-neck",
      "muscle-up"
    ],
    "equipment": [
      "weighted",
      "assisted",
      "kipping",
      "ring",
      "towel"
    ]
  },
  {
    "pk": "dc033c10-988c-4558-bf74-3ab5be6c59fc",
    "name": "Squat",
    "workoutGroups": [
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
    "movementVariations": [
      "pause",
      "bodyweight",
      "front",
      "back",
      "split",
      "Bulgarian split",
      "pistol",
      "zercher",
      "overhead",
      "heel-elevated",
      "tempo",
      "anderson",
      "wide-stance",
      "narrow-stance",
      "sumo",
      "low-bar",
      "high-bar"
    ],
    "equipment": [
      "landmine",
      "belt",
      "barbell",
      "dumbbell",
      "goblet",
      "box",
      "safety bar"
    ]
  },
  {
    "pk": "7a971512-0265-490a-8ac0-871c0e1013de",
    "name": "Push-Up",
    "slug": "push-up",
    "workoutGroups": [
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
    "movementVariations": [
      "standard",
      "decline",
      "incline",
      "wide-grip",
      "close-grip",
      "diamond",
      "plyometric",
      "archer",
      "pike",
      "spiderman",
      "T",
      "staggered",
      "hindu",
      "one-arm",
      "clap",
      "pseudo planche",
      "deficit"
    ],
    "equipment": [
      "feet-in-rings",
      "weighted",
      "assisted",
      "ring"
    ]
  },
  {
    "pk": "6bc882f1-29e7-44c0-99b4-a36a4c91fc08",
    "name": "Face Pull",
    "slug": "face-pull",
    "workoutGroups": [
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
    "movementVariations": [
      "single-arm",
      "high-pulley",
      "low-pulley",
      "kneeling",
      "seated",
      "chest-level",
      "pronated"
    ],
    "equipment": [
      "cable",
      "band",
      "rope",
      "supinated"
    ]
  },
  {
    "pk": "23cf1e36-69e0-424b-8403-fc4e30de15da",
    "name": "Bench Press",
    "workoutGroups": [
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
    "movementVariations": [
      "incline",
      "decline",
      "close-grip",
      "wide-grip",
      "neutral-grip",
      "feet-up",
      "paused",
      "floor",
      "reverse-grip",
      "spoto",
      "touch-and-go",
      "larsen",
      "tempo"
    ],
    "equipment": [
      "barbell",
      "dumbbell",
      "smith machine",
      "board",
      "pin",
      "axle bar",
      "slingshot",
      "banded",
      "chains"
    ]
  },
  {
    "pk": "ba2387cd-2192-42d5-8895-4c8ad78b3607",
    "name": "Deadlift",
    "workoutGroups": [
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
    "movementVariations": [
      "sumo",
      "single-leg",
      "romainian",
      "stiff-leg",
      "rack-pull",
      "deficit",
      "paused",
      "snatch-grip"
    ],
    "equipment": [
      "barbell",
      "dumbbell",
      "kettlebell",
      "trap bar",
      "hex-bar",
      "banded",
      "block-pull",
      "straps"
    ]
  },
  {
    "pk": "859b2211-9bb0-462b-987c-620a3e37d688",
    "name": "Leg Press",
    "workoutGroups": [
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
    "movementVariations": [
      "hack squat",
      "single-leg",
      "paused",
      "heel-elevated",
      "toe-elevated",
      "wide-stance",
      "narrow-stance",
      "high-foot",
      "low-foot"
    ],
    "equipment": [
      "machine",
      "banded"
    ]
  },
  {
    "pk": "2b9085c4-ad46-466b-acc9-f863a93dbaa9",
    "name": "Curl",
    "workoutGroups": [
      "Biceps",
      "Arms"
    ],
    "primaryMuscles": [
      "biceps brachii"
    ],
    "secondaryMuscles": [
      "wrist flexors"
    ],
    "movementVariations": [
      "bodyweight",
      "preacher",
      "cross-body",
      "single-arm",
      "incline",
      "decline",
      "close-grip",
      "wide-grip",
      "EZ-bar",
      "zottman",
      "21s",
      "spider",
      "seated",
      "standing",
      "reverse",
      "drag",
      "alternating"
    ],
    "equipment": [
      "barbell",
      "dumbbell",
      "rope",
      "cable",
      "machine",
      "band",
      "kettlebell"
    ]
  },
  {
    "pk": "8a96a73c-0c69-4102-a2c9-f103c8497e7e",
    "name": "Frog Pumps",
    "workoutGroups": [
      "Glutes"
    ],
    "primaryMuscles": [
      "gluteus maximus"
    ],
    "secondaryMuscles": [
      "hamstrings",
      "hip adductors"
    ],
    "movementVariations": [
      "single-leg",
      "feet-elevated"
    ],
    "equipment": [
      "banded",
      "weighted",
      "plate-weighted",
      "barbell",
      "dumbbell"
    ]
  },
  {
    "pk": "37115036-6477-4046-96dc-5c48d077a201",
    "name": "Windshield Wiper",
    "workoutGroups": [
      "Core"
    ],
    "primaryMuscles": [
      "external obliques"
    ],
    "secondaryMuscles": [
      "rectus abdominis"
    ],
    "movementVariations": [
      "single-leg",
      "bent-knee",
      "feet-elevated",
      "decline"
    ],
    "equipment": [
      "weighted"
    ]
  },
  {
    "pk": "102850fa-8459-4cd0-81b5-88cc982d5de4",
    "name": "Dip",
    "workoutGroups": [
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
    "movementVariations": [
      "bodyweight",
      "chest-forward",
      "upright",
      "korean",
      "single-arm"
    ],
    "equipment": [
      "weighted",
      "assisted",
      "rings",
      "bench",
      "machine",
      "parallel bars",
      "banded"
    ]
  },
  {
    "pk": "3bc232a6-36f1-4322-948c-61c0df58cb15",
    "name": "Arnold Press",
    "workoutGroups": [
      "Shoulders"
    ],
    "primaryMuscles": [
      "posterior deltoid",
      "lateral deltoid"
    ],
    "secondaryMuscles": [],
    "movementVariations": [
      "seated",
      "standing",
      "single-arm",
      "alternating"
    ],
    "equipment": [
      "dumbbell",
      "cable"
    ]
  },
  {
    "pk": "328b8330-4a04-4f43-a255-f17cba659635",
    "name": "Back Extension",
    "workoutGroups": [
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
    "movementVariations": [
      "floor",
      "single-leg",
      "45-degree",
      "GHD",
      "reverse"
    ],
    "equipment": [
      "weighted",
      "machine",
      "barbell",
      "band",
      "dumbbell",
      "plate"
    ]
  },
  {
    "pk": "ab0da03b-dd54-4a7f-bb06-40c866dfa88c",
    "name": "Glute Bridge",
    "workoutGroups": [
      "Glutes"
    ],
    "primaryMuscles": [
      "gluteus maximus",
      "hamstrings"
    ],
    "secondaryMuscles": [
      "hip adductors"
    ],
    "movementVariations": [
      "single-leg",
      "feet-elevated",
      "double-leg"
    ],
    "equipment": [
      "weighted",
      "banded",
      "barbell",
      "plate",
      "dumbbell",
      "kettlebell"
    ]
  },
  {
    "pk": "cbbdaae8-7600-456f-b025-12d2050b3765",
    "name": "Leg Raise",
    "workoutGroups": [
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
    "movementVariations": [
      "hanging",
      "lying",
      "single-leg",
      "knee-raise",
      "toes-to-bar",
      "flutter kick"
    ],
    "equipment": [
      "weighted",
      "captain's chair",
      "bench",
      "incline bench",
      "band",
      "cable"
    ]
  },
  {
    "pk": "7e703b05-364f-4847-af0f-a1a22aab19f6",
    "name": "Burpee",
    "workoutGroups": [
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
    "movementVariations": [
      "single-leg",
      "pull-up",
      "no-jump",
      "push-up",
      "tuck",
      "half"
    ],
    "equipment": [
      "bosu",
      "weighted",
      "box jump",
      "dumbbell"
    ]
  },
  {
    "pk": "47d61f40-0743-47af-95a5-545a6a9a4824",
    "name": "Leg Extension",
    "workoutGroups": [
      "Legs"
    ],
    "primaryMuscles": [
      "quadriceps femoris"
    ],
    "secondaryMuscles": [],
    "movementVariations": [
      "single-leg",
      "seated",
      "lying",
      "sissy squat",
      "tempo",
      "paused"
    ],
    "equipment": [
      "machine",
      "cable",
      "band"
    ]
  },
  {
    "pk": "7e95b8b5-a6eb-41b6-a3c9-ae06a9ba7ac4",
    "name": "Hip Abduction",
    "workoutGroups": [
      "Legs"
    ],
    "primaryMuscles": [
      "hip abductors"
    ],
    "secondaryMuscles": [
      "gluteus maximus"
    ],
    "movementVariations": [
      "single-leg",
      "standing",
      "seated",
      "lying",
      "fire hydrant",
      "clamshell",
      "side-lying"
    ],
    "equipment": [
      "machine",
      "cable",
      "banded"
    ]
  },
  {
    "pk": "a06410b6-c871-45c0-aee5-db6df750f494",
    "name": "Plank",
    "workoutGroups": [
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
    "movementVariations": [
      "forearm",
      "hands",
      "side",
      "single-leg",
      "RKC",
      "reach",
      "suitcase",
      "reverse",
      "long-lever",
      "stir the pot"
    ],
    "equipment": [
      "weighted",
      "bosu",
      "band"
    ]
  },
  {
    "pk": "dee8ca71-a01b-4ffd-b85e-426080e92f1e",
    "name": "Glute Kickback",
    "workoutGroups": [
      "Glutes"
    ],
    "primaryMuscles": [
      "gluteus maximus"
    ],
    "secondaryMuscles": [
      "hamstrings",
      "hip adductors"
    ],
    "movementVariations": [
      "single-leg",
      "floor",
      "donkey kick",
      "quadruped",
      "straight-leg",
      "bent-knee"
    ],
    "equipment": [
      "machine",
      "cable",
      "banded"
    ]
  },
  {
    "pk": "dce6d67f-877e-4595-9277-3a3f0f19dc46",
    "name": "Lunge",
    "workoutGroups": [
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
    "movementVariations": [
      "walking",
      "reverse",
      "side",
      "curtsy",
      "front",
      "back",
      "split",
      "bulgarian",
      "pistol",
      "deficit",
      "paused",
      "tempo",
      "overhead",
      "suitcase",
      "crossover",
      "explosive"
    ],
    "equipment": [
      "dumbbell",
      "barbell",
      "goblet",
      "kettlebell",
      "banded",
      "weighted vest"
    ]
  },
  {
    "pk": "ed36669e-3f5c-411d-8eab-8fb757a21e93",
    "name": "Medicine Ball Throw",
    "workoutGroups": [
      "Core"
    ],
    "primaryMuscles": [
      "external obliques"
    ],
    "secondaryMuscles": [
      "rectus abdominis",
      "anterior deltoid"
    ],
    "movementVariations": [
      "rotational",
      "overhead",
      "chest pass",
      "slam",
      "wall ball",
      "squat throw",
      "kneeling",
      "partner",
      "side throw",
      "scoop toss"
    ],
    "equipment": []
  },
  {
    "pk": "a40205d6-396c-4c0b-a4b9-8ffbef49ed32",
    "name": "Row",
    "workoutGroups": [
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
    "movementVariations": [
      "t-bar",
      "pendlay",
      "chest-supported",
      "seated",
      "standing",
      "single-arm",
      "wide-grip",
      "close-grip",
      "neutral-grip",
      "overhand",
      "underhand",
      "kroc",
      "yates",
      "pause"
    ],
    "equipment": [
      "dumbbell",
      "barbell",
      "cable",
      "machine",
      "landmine",
      "ring"
    ]
  },
  {
    "pk": "64c75731-36c2-45ae-b8c1-c8b481f34144",
    "name": "Shoulder Press",
    "workoutGroups": [
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
    "movementVariations": [
      "single-arm",
      "seated",
      "standing",
      "push press",
      "behind-the-neck",
      "paused",
      "Bradford",
      "alternating"
    ],
    "equipment": [
      "dumbbell",
      "barbell",
      "smith machine",
      "machine",
      "kettlebell",
      "pin",
      "cable"
    ]
  },
  {
    "pk": "91ee79b7-397d-4b90-8988-9a41bff9d639",
    "name": "Upright Row",
    "workoutGroups": [
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
    "movementVariations": [
      "wide-grip",
      "narrow-grip",
      "single-arm"
    ],
    "equipment": [
      "barbell",
      "dumbbell",
      "cable",
      "kettlebell",
      "smith machine",
      "band"
    ]
  },
  {
    "pk": "162433b9-39f3-4e3e-aad6-81736d44c1cf",
    "name": "Lateral Raise",
    "alternativeNames": [
      "Lateral Delt Fly",
      "Lateral Fly",
      "Lateral Delt Raise"
    ],
    "workoutGroups": [
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
    "movementVariations": [
      "single-arm",
      "seated",
      "lying",
      "leaning",
      "partial"
    ],
    "equipment": [
      "dumbbell",
      "cable",
      "machine",
      "band",
      "behind-the-back cable",
      "kettlebell"
    ]
  },
  {
    "pk": "162433b9-39f3-4e3e-aad6-81736d44c1cf",
    "name": "Rear Delt Fly",
    "alternativeNames": [
      "Rear Delt Raise"
    ],
    "workoutGroups": [
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
    "movementVariations": [
      "single-arm",
      "bent-over",
      "seated",
      "reverse pec deck",
      "lying"
    ],
    "equipment": [
      "dumbbell",
      "cable",
      "machine",
      "incline bench",
      "band"
    ]
  },
  {
    "pk": "e8dc87a4-79e1-4114-90a4-418a4b67359f",
    "name": "Shrugs",
    "workoutGroups": [
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
    "movementVariations": [
      "single-arm",
      "behind-the-back",
      "overhead"
    ],
    "equipment": [
      "dumbbell",
      "barbell",
      "cable",
      "machine",
      "kettlebell",
      "trap bar",
      "smith machine",
      "band"
    ]
  },
  {
    "pk": "e8dc87a4-79e1-4114-90a4-418a4b67359f",
    "name": "Front Delt Raise",
    "alternativeNames": [
      "Front Delt Fly"
    ],
    "workoutGroups": [
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
    "movementVariations": [
      "single-arm",
      "incline",
      "prone",
      "seated"
    ],
    "equipment": [
      "dumbbell",
      "cable",
      "machine",
      "barbell",
      "plate",
      "band"
    ]
  },
  {
    "pk": "e8dc87a4-79e1-4114-90a4-418a4b67359f",
    "name": "Rear Delt Row",
    "workoutGroups": [
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
    "movementVariations": [
      "single-arm",
      "prone",
      "wide-grip",
      "close-grip"
    ],
    "equipment": [
      "dumbbell",
      "barbell",
      "cable",
      "machine",
      "band",
      "kettlebell"
    ]
  },
  {
    "pk": "c5116ba3-8a9d-4318-80e5-678a927cf916",
    "name": "Floor Press",
    "workoutGroups": [
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
    "movementVariations": [
      "single-arm",
      "close-grip",
      "paused",
      "neutral-grip"
    ],
    "equipment": [
      "dumbbell",
      "barbell",
      "kettlebell",
      "banded"
    ]
  },
  {
    "pk": "8431323c-ca05-4424-9e2f-995e85f4f9e3",
    "name": "Power Clean",
    "workoutGroups": [
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
    "movementVariations": [
      "hang",
      "wide-grip",
      "clean and press",
      "clean and jerk",
      "close-grip",
      "sumo",
      "clean and push press",
      "clean and push jerk",
      "tall",
      "low-hang",
      "mid-thigh",
      "paused",
      "pause at knee"
    ],
    "equipment": [
      "dumbbell",
      "kettlebell",
      "block"
    ]
  },
  {
    "pk": "e4ada608-1354-43e6-99cb-c7af0c76edde",
    "name": "V-Up",
    "workoutGroups": [
      "Core"
    ],
    "primaryMuscles": [
      "rectus abdominis"
    ],
    "secondaryMuscles": [],
    "movementVariations": [
      "single-leg",
      "bent-knee",
      "hollow body",
      "tuck",
      "full"
    ],
    "equipment": [
      "weighted",
      "band-resisted"
    ]
  },
  {
    "pk": "288eae8d-af58-42db-9f10-16b599e11876",
    "name": "Hack Squat",
    "workoutGroups": [
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
    "movementVariations": [
      "reverse",
      "narrow-stance",
      "wide-stance",
      "paused",
      "heel-elevated"
    ],
    "equipment": [
      "barbell",
      "dumbbell",
      "machine",
      "smith machine",
      "banded",
      "safety bar"
    ]
  },
  {
    "pk": "a189b026-3641-426f-b9a2-d32678ccb99f",
    "name": "Lat Pulldown",
    "workoutGroups": [
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
    "movementVariations": [
      "straight arm",
      "single-arm",
      "seated",
      "standing",
      "kneeling",
      "bent-arm",
      "wide-grip",
      "close-grip",
      "neutral-grip",
      "overhand-grip",
      "underhand-grip",
      "bar"
    ],
    "equipment": [
      "cable",
      "dumbbell",
      "band",
      "rope"
    ]
  },
  {
    "pk": "c46c643f-d109-4720-8ce9-3b5d24b9cdec",
    "name": "Lateral Walk",
    "workoutGroups": [
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
    "movementVariations": [
      "wide-stance",
      "squat position",
      "hip-level"
    ],
    "equipment": [
      "band",
      "dumbbell",
      "kettlebell",
      "barbell",
      "weighted vest",
      "ankle weights"
    ]
  },
  {
    "pk": "13ce59d9-4fd0-4aea-857a-3afc186c3074",
    "name": "Sit-Up",
    "workoutGroups": [
      "Core"
    ],
    "primaryMuscles": [
      "rectus abdominis"
    ],
    "secondaryMuscles": [
      "external obliques"
    ],
    "movementVariations": [
      "standard",
      "decline",
      "incline",
      "anchor",
      "crossed-arms",
      "hands-behind-head",
      "twisting",
      "janda",
      "GHD"
    ],
    "equipment": [
      "weighted",
      "band-resisted",
      "feet-in-rings"
    ]
  },
  {
    "pk": "0c5940e6-419e-476b-a1eb-39302e0aebe5",
    "name": "Chest Fly",
    "workoutGroups": [
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
    "movementVariations": [
      "incline",
      "decline",
      "flat",
      "overhand-grip",
      "underhand-grip",
      "pec-dec"
    ],
    "equipment": [
      "dumbbell",
      "cable crossover",
      "machine",
      "band"
    ]
  },
  {
    "pk": "e13cf8a4-6b48-4d9e-9a24-a30d5f98d713",
    "name": "Mountain Climbers",
    "workoutGroups": [
      "Core"
    ],
    "primaryMuscles": [
      "rectus abdominis"
    ],
    "secondaryMuscles": [
      "external obliques"
    ],
    "movementVariations": [
      "slow",
      "cross-body",
      "elevated"
    ],
    "equipment": [
      "resistance band",
      "slider",
      "bosu",
      "weighted vest"
    ]
  },
  {
    "pk": "edb21df1-0a7a-49f8-94e3-fa47138af935",
    "name": "Tricep Pushdown",
    "workoutGroups": [
      "Triceps"
    ],
    "primaryMuscles": [
      "triceps brachii"
    ],
    "secondaryMuscles": [],
    "movementVariations": [
      "single-arm",
      "standing",
      "kneeling",
      "wide-grip",
      "close-grip",
      "neutral-grip",
      "overhand-grip",
      "underhand-grip",
      "bar"
    ],
    "equipment": [
      "cable",
      "rope",
      "band"
    ]
  },
  {
    "pk": "03ded3cd-bba0-4f04-9afd-f7e321aec282",
    "name": "Lat Pulldown",
    "workoutGroups": [
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
    "movementVariations": [
      "single-arm",
      "kneeling",
      "wide-grip",
      "close-grip",
      "neutral-grip",
      "overhand-grip",
      "underhand-grip",
      "bar"
    ],
    "equipment": [
      "cable",
      "rope"
    ]
  },
  {
    "pk": "f1c844bd-28c8-4191-9b2a-d0233e6941e1",
    "name": "Wrist Curl",
    "workoutGroups": [
      "Arms"
    ],
    "primaryMuscles": [
      "wrist flexors"
    ],
    "secondaryMuscles": [],
    "movementVariations": [
      "single-arm",
      "behind-the-back",
      "seated",
      "standing",
      "EZ-bar",
      "reverse",
      "pronated"
    ],
    "equipment": [
      "barbell",
      "dumbbell",
      "cable",
      "band"
    ]
  },
  {
    "pk": "a3f7c812-1d45-4b89-93c0-7e2d4f6a1b85",
    "name": "Overhead Press",
    "workoutGroups": [
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
    "movementVariations": [
      "push press",
      "strict",
      "seated",
      "standing",
      "single-arm",
      "behind-the-neck",
      "paused",
      "Bradford",
      "alternating",
      "push jerk",
      "split jerk",
      "Z-press"
    ],
    "equipment": [
      "barbell",
      "dumbbell",
      "kettlebell",
      "landmine",
      "pin"
    ]
  },
  {
    "pk": "b9e2a547-3c68-4f10-a1d7-5c8b0e3d2f94",
    "name": "Hip Thrust",
    "workoutGroups": [
      "Glutes"
    ],
    "primaryMuscles": [
      "gluteus maximus"
    ],
    "secondaryMuscles": [
      "hamstrings",
      "hip adductors"
    ],
    "movementVariations": [
      "single-leg",
      "paused",
      "feet-elevated",
      "narrow-stance",
      "wide-stance",
      "american",
      "B-stance"
    ],
    "equipment": [
      "barbell",
      "dumbbell",
      "banded",
      "machine",
      "smith machine",
      "plate"
    ]
  },
  {
    "pk": "c1d83b6a-7f29-4e5c-b2a8-9d0e5f7c3b21",
    "name": "Romanian Deadlift",
    "workoutGroups": [
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
    "movementVariations": [
      "single-leg",
      "paused",
      "stiff-leg",
      "wide-grip",
      "snatch-grip",
      "B-stance",
      "deficit"
    ],
    "equipment": [
      "barbell",
      "dumbbell",
      "kettlebell",
      "cable",
      "trap bar",
      "banded"
    ]
  },
  {
    "pk": "d4c96e3f-8a1b-4d72-c3e9-2f5a7b0d4c68",
    "name": "Nordic Curl",
    "workoutGroups": [
      "Legs"
    ],
    "primaryMuscles": [
      "hamstrings"
    ],
    "secondaryMuscles": [
      "gluteus maximus",
      "gastrocnemius"
    ],
    "movementVariations": [
      "bodyweight",
      "eccentric",
      "GHD",
      "feet-anchored"
    ],
    "equipment": [
      "weighted",
      "partner-assisted",
      "machine",
      "band-assisted"
    ]
  },
  {
    "pk": "e7f04a19-2b3c-4e85-d6f1-3a8c9e2d5b07",
    "name": "Good Morning",
    "workoutGroups": [
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
    "movementVariations": [
      "seated",
      "single-leg",
      "good morning squat",
      "suspended",
      "wide-grip",
      "paused"
    ],
    "equipment": [
      "barbell",
      "banded",
      "dumbbell",
      "cable",
      "smith machine",
      "safety bar"
    ]
  },
  {
    "pk": "f2a15b28-3c4d-4f96-e7a2-4b9d0f3e6c18",
    "name": "Step-Up",
    "workoutGroups": [
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
    "movementVariations": [
      "bodyweight",
      "lateral",
      "single-leg",
      "crossover",
      "explosive",
      "deficit",
      "Bulgarian",
      "paused"
    ],
    "equipment": [
      "dumbbell",
      "barbell",
      "weighted vest",
      "kettlebell",
      "goblet"
    ]
  },
  {
    "pk": "a3b26c39-4d5e-4a07-f8b3-5c0e1a4f7d29",
    "name": "Leg Curl",
    "workoutGroups": [
      "Legs"
    ],
    "primaryMuscles": [
      "hamstrings"
    ],
    "secondaryMuscles": [
      "gastrocnemius",
      "gluteus maximus"
    ],
    "movementVariations": [
      "single-leg",
      "nordic",
      "prone",
      "standing",
      "paused",
      "tempo"
    ],
    "equipment": [
      "lying machine",
      "seated machine",
      "cable",
      "dumbbell",
      "band",
      "slider",
      "stability ball"
    ]
  },
  {
    "pk": "b4c37d4a-5e6f-4b18-a9c4-6d1f2b5a8e30",
    "name": "Calf Raise",
    "workoutGroups": [
      "Legs"
    ],
    "primaryMuscles": [
      "gastrocnemius"
    ],
    "secondaryMuscles": [],
    "movementVariations": [
      "standing",
      "seated",
      "single-leg",
      "donkey",
      "leg press",
      "toe press",
      "offset",
      "paused",
      "tempo",
      "heel-elevated",
      "eccentric"
    ],
    "equipment": [
      "machine",
      "barbell",
      "dumbbell",
      "band-resisted"
    ]
  },
  {
    "pk": "c5d48e5b-6f7a-4c29-b0d5-7e2a3c6b9f41",
    "name": "Chin-Up",
    "workoutGroups": [
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
    "movementVariations": [
      "bodyweight",
      "close-grip",
      "neutral-grip",
      "wide-grip",
      "L-sit",
      "typewriter"
    ],
    "equipment": [
      "weighted",
      "assisted",
      "ring",
      "band-resisted",
      "kipping",
      "supinated"
    ]
  },
  {
    "pk": "d6e59f6c-7a8b-4d30-c1e6-8f3b4d7c0a52",
    "name": "Inverted Row",
    "workoutGroups": [
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
    "movementVariations": [
      "bodyweight",
      "wide-grip",
      "close-grip",
      "underhand",
      "feet-elevated",
      "overhand",
      "neutral",
      "pronated",
      "single-arm"
    ],
    "equipment": [
      "weighted",
      "suspension trainer",
      "barbell",
      "rings"
    ]
  },
  {
    "pk": "e7f60a7d-8b9c-4e41-d2f7-9a4c5e8d1b63",
    "name": "Seal Row",
    "workoutGroups": [
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
    "movementVariations": [
      "wide-grip",
      "close-grip",
      "neutral-grip",
      "single-arm"
    ],
    "equipment": [
      "barbell",
      "dumbbell",
      "machine",
      "cable"
    ]
  },
  {
    "pk": "f8a71b8e-9c0d-4f52-e3a8-0b5d6f9e2c74",
    "name": "Chest-Supported Row",
    "workoutGroups": [
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
    "movementVariations": [
      "single-arm",
      "wide-grip",
      "close-grip",
      "neutral-grip",
      "prone",
      "incline"
    ],
    "equipment": [
      "dumbbell",
      "barbell",
      "machine",
      "cable"
    ]
  },
  {
    "pk": "a9b82c9f-0d1e-4a63-f4b9-1c6e7a0f3d85",
    "name": "Cable Row",
    "workoutGroups": [
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
    "movementVariations": [
      "seated",
      "standing",
      "single-arm",
      "wide-grip",
      "close-grip",
      "neutral-grip",
      "kneeling",
      "half-kneeling",
      "split-stance",
      "overhand",
      "underhand",
      "face-away"
    ],
    "equipment": [
      "rope"
    ]
  },
  {
    "pk": "b0c93d0a-1e2f-4b74-a5c0-2d7f8b1a4e96",
    "name": "Hammer Curl",
    "workoutGroups": [
      "Biceps",
      "Arms"
    ],
    "primaryMuscles": [
      "biceps brachii"
    ],
    "secondaryMuscles": [
      "wrist extensors",
      "wrist flexors"
    ],
    "movementVariations": [
      "single-arm",
      "cross-body",
      "incline",
      "seated",
      "standing",
      "alternating",
      "preacher",
      "drag"
    ],
    "equipment": [
      "dumbbell",
      "cable",
      "rope",
      "machine",
      "band"
    ]
  },
  {
    "pk": "c1d04e1b-2f3a-4c85-b6d1-3e8a9c2b5f07",
    "name": "Tricep Extension",
    "workoutGroups": [
      "Triceps"
    ],
    "primaryMuscles": [
      "triceps brachii"
    ],
    "secondaryMuscles": [],
    "movementVariations": [
      "EZ-bar",
      "single-arm",
      "overhead",
      "lying",
      "seated",
      "standing",
      "kickback",
      "behind-the-head"
    ],
    "equipment": [
      "cable",
      "dumbbell",
      "barbell",
      "rope",
      "band"
    ]
  },
  {
    "pk": "d2e15f2c-3a4b-4d96-c7e2-4f9b0d3c6a18",
    "name": "Skull Crusher",
    "workoutGroups": [
      "Triceps"
    ],
    "primaryMuscles": [
      "triceps brachii"
    ],
    "secondaryMuscles": [],
    "movementVariations": [
      "EZ-bar",
      "single-arm",
      "floor",
      "neutral-grip"
    ],
    "equipment": [
      "barbell",
      "dumbbell",
      "cable",
      "band",
      "flat bench",
      "incline bench",
      "decline bench"
    ]
  },
  {
    "pk": "c7d60e7b-8f9a-4c41-b2d7-9e4a5c8b1f63",
    "name": "Wrist Extension",
    "workoutGroups": [
      "Arms"
    ],
    "primaryMuscles": [
      "wrist extensors"
    ],
    "secondaryMuscles": [],
    "movementVariations": [
      "single-arm",
      "seated",
      "standing",
      "EZ-bar",
      "reverse wrist curl",
      "pronated"
    ],
    "equipment": [
      "barbell",
      "dumbbell",
      "cable",
      "band"
    ]
  },
  {
    "pk": "d8e71f8c-9a0b-4d52-c3e8-0f5b6d9c2a74",
    "name": "Farmer's Carry",
    "workoutGroups": [
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
    "movementVariations": [
      "single-arm",
      "overhead",
      "waiter's carry",
      "suitcase carry",
      "mixed-grip"
    ],
    "equipment": [
      "dumbbell",
      "barbell",
      "kettlebell",
      "trap bar",
      "yoke",
      "axle bar",
      "double kettlebell"
    ]
  },
  {
    "pk": "e9f82a9d-0b1c-4e63-d4f9-1a6c7e0d3b85",
    "name": "Snatch",
    "workoutGroups": [
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
    "movementVariations": [
      "hang",
      "power",
      "squat",
      "muscle snatch",
      "overhead squat",
      "snatch balance",
      "drop snatch",
      "paused",
      "wide-grip"
    ],
    "equipment": [
      "barbell",
      "dumbbell",
      "kettlebell",
      "block"
    ]
  },
  {
    "pk": "f0a93b0e-1c2d-4f74-e5a0-2b7d8f1e4c96",
    "name": "Clean",
    "workoutGroups": [
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
    "movementVariations": [
      "hang",
      "power",
      "squat",
      "single-arm",
      "clean pull",
      "tall clean",
      "clean shrug",
      "low-hang",
      "paused",
      "deficit"
    ],
    "equipment": [
      "dumbbell",
      "kettlebell",
      "block"
    ]
  },
  {
    "pk": "a1b04c1f-2d3e-4a85-f6b1-3c8e9a2d5f07",
    "name": "Kettlebell Swing",
    "workoutGroups": [
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
    "movementVariations": [
      "two-hand",
      "single-arm",
      "American",
      "sumo",
      "high pull",
      "dead swing",
      "ballistic",
      "snatch-grip"
    ],
    "equipment": [
      "banded"
    ]
  },
  {
    "pk": "b2c15d2a-3e4f-4b96-a7c2-4d9f0b3e6a18",
    "name": "Landmine Press",
    "workoutGroups": [
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
    "movementVariations": [
      "single-arm",
      "kneeling",
      "standing",
      "half-kneeling",
      "push press",
      "bilateral",
      "alternating",
      "rotational",
      "squat-to-press",
      "split-stance"
    ],
    "equipment": []
  },
  {
    "pk": "f6a59b6e-7c8d-4f30-e1a6-8b3d4f7c0e52",
    "name": "Pullover",
    "workoutGroups": [
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
    "movementVariations": [
      "decline",
      "single-arm",
      "EZ-bar",
      "straight-arm",
      "bent-arm"
    ],
    "equipment": [
      "dumbbell",
      "flat bench",
      "cable",
      "barbell",
      "machine"
    ]
  },
  {
    "pk": "b8c71d8a-9e0f-4b52-a3c8-0d5f6b9e2c74",
    "name": "Meadows Row",
    "workoutGroups": [
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
    "movementVariations": [
      "overhand",
      "underhand",
      "neutral-grip",
      "kneeling",
      "chest-supported",
      "staggered-stance",
      "heavy",
      "single-arm"
    ],
    "equipment": []
  },
  {
    "pk": "d0e93f0c-1a2b-4d74-c5e0-2f7a8d1e4f96",
    "name": "Band Pull-Apart",
    "workoutGroups": [
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
    "movementVariations": [
      "overhand",
      "underhand",
      "wide-grip",
      "narrow-grip",
      "chest-level",
      "overhead",
      "single-arm"
    ],
    "equipment": []
  },
  {
    "pk": "e1f04a1d-2b3c-4e85-d6f1-3a8d9e2f5a07",
    "name": "Cable External Rotation",
    "workoutGroups": [
      "Shoulders"
    ],
    "primaryMuscles": [
      "infraspinatus"
    ],
    "secondaryMuscles": [
      "posterior deltoid"
    ],
    "movementVariations": [
      "standing",
      "seated",
      "single-arm",
      "lying",
      "90-degree abduction",
      "side-lying",
      "prone",
      "doorway"
    ],
    "equipment": [
      "band"
    ]
  },
  {
    "pk": "f2a15b2e-3c4d-4f96-e7a2-4b9e0f3a6b18",
    "name": "Internal Rotation",
    "workoutGroups": [
      "Shoulders"
    ],
    "primaryMuscles": [
      "subscapularis"
    ],
    "secondaryMuscles": [
      "anterior deltoid"
    ],
    "movementVariations": [
      "standing",
      "seated",
      "single-arm",
      "lying",
      "90-degree abduction",
      "side-lying",
      "prone"
    ],
    "equipment": [
      "cable",
      "band"
    ]
  },
  {
    "pk": "d6e59f6d-7a8b-4d30-c1e6-8f3b4d7e0a52",
    "name": "Rack Pull",
    "workoutGroups": [
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
    "movementVariations": [
      "below-knee",
      "above-knee",
      "sumo",
      "wide-grip",
      "snatch-grip",
      "mixed-grip",
      "overhand",
      "deficit",
      "paused"
    ],
    "equipment": [
      "barbell",
      "straps"
    ]
  },
  {
    "pk": "e7f60a7e-8b9c-4e41-d2f7-9a4c5e8f1b63",
    "name": "Hip Adduction",
    "workoutGroups": [
      "Legs"
    ],
    "primaryMuscles": [
      "hip adductors"
    ],
    "secondaryMuscles": [
      "gluteus maximus"
    ],
    "movementVariations": [
      "seated",
      "standing",
      "lying",
      "Copenhagen plank",
      "side-lying",
      "single-leg"
    ],
    "equipment": [
      "machine",
      "cable",
      "banded"
    ]
  },
  {
    "pk": "f8a71b8f-9c0d-4f52-e3a8-0b5d6f9f2c74",
    "name": "Box Jump",
    "workoutGroups": [
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
    "movementVariations": [
      "standard",
      "depth jump",
      "single-leg",
      "lateral",
      "rotational",
      "broad jump",
      "step-down"
    ],
    "equipment": [
      "weighted",
      "banded",
      "hurdle"
    ]
  },
  {
    "pk": "a9b82c9a-0d1e-4a63-f4b9-1c6e7a0a3d85",
    "name": "Wall Sit",
    "workoutGroups": [
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
    "movementVariations": [
      "bodyweight",
      "single-leg",
      "heels-elevated",
      "with press",
      "overhead hold"
    ],
    "equipment": [
      "weighted",
      "banded",
      "stability ball"
    ]
  },
  {
    "pk": "b0c93d0b-1e2f-4b74-a5c0-2d7f8b1b4e96",
    "name": "Dead Bug",
    "workoutGroups": [
      "Core"
    ],
    "primaryMuscles": [
      "rectus abdominis"
    ],
    "secondaryMuscles": [
      "external obliques",
      "erector spinae"
    ],
    "movementVariations": [
      "bodyweight",
      "single-arm",
      "single-leg",
      "contralateral"
    ],
    "equipment": [
      "weighted",
      "band",
      "stability ball",
      "dumbbell"
    ]
  },
  {
    "pk": "c1d04e1c-2f3a-4c85-b6d1-3e8a9c2c5f07",
    "name": "Pallof Press",
    "workoutGroups": [
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
    "movementVariations": [
      "kneeling",
      "standing",
      "half-kneeling",
      "single-arm",
      "push",
      "overhead",
      "rotation",
      "isometric",
      "split-stance"
    ],
    "equipment": [
      "cable",
      "band"
    ]
  },
  {
    "pk": "d2e15f2d-3a4b-4d96-c7e2-4f9b0d3d6a18",
    "name": "Ab Wheel Rollout",
    "workoutGroups": [
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
    "movementVariations": [
      "kneeling",
      "standing",
      "single-arm",
      "pike",
      "feet-elevated"
    ],
    "equipment": [
      "barbell",
      "band-assisted",
      "weighted"
    ]
  },
  {
    "pk": "e3f26a3e-4b5c-4e07-d8f3-5a0c1e4e7b29",
    "name": "Russian Twist",
    "workoutGroups": [
      "Core"
    ],
    "primaryMuscles": [
      "external obliques"
    ],
    "secondaryMuscles": [
      "rectus abdominis"
    ],
    "movementVariations": [
      "bodyweight",
      "feet-elevated",
      "decline"
    ],
    "equipment": [
      "weighted",
      "medicine ball",
      "cable",
      "plate",
      "kettlebell",
      "band-resisted"
    ]
  },
  {
    "pk": "f4a37b4f-5c6d-4f18-e9a4-6b1d2f5f8c30",
    "name": "Knee Raise",
    "workoutGroups": [
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
    "movementVariations": [
      "hanging",
      "bodyweight",
      "straight-leg",
      "toes-to-bar",
      "lying",
      "incline"
    ],
    "equipment": [
      "weighted",
      "captain's chair",
      "parallel bars",
      "cable",
      "band"
    ]
  },
  {
    "pk": "a5b48c50-6d7e-4a29-f0b5-7c2e3a6a9d41",
    "name": "Landmine Rotation",
    "workoutGroups": [
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
    "movementVariations": [
      "standing",
      "kneeling",
      "half-kneeling",
      "single-arm",
      "bilateral",
      "chop",
      "lift",
      "rotational push-press"
    ],
    "equipment": []
  },
  {
    "pk": "b6c59d51-7e8f-4b30-a1c6-8d3f4b7b0e52",
    "name": "Cable Crunch",
    "workoutGroups": [
      "Core"
    ],
    "primaryMuscles": [
      "rectus abdominis"
    ],
    "secondaryMuscles": [
      "external obliques"
    ],
    "movementVariations": [
      "kneeling",
      "standing",
      "single-arm",
      "oblique",
      "reverse",
      "side-lying",
      "seated"
    ],
    "equipment": [
      "rope",
      "band"
    ]
  },
  {
    "pk": "c7d60e52-8f9a-4c41-b2d7-9e4a5c8c1f63",
    "name": "Reverse Hyperextension",
    "workoutGroups": [
      "Glutes",
      "Back"
    ],
    "primaryMuscles": [
      "gluteus maximus",
      "hamstrings",
      "erector spinae"
    ],
    "secondaryMuscles": [],
    "movementVariations": [
      "GHD",
      "single-leg",
      "hip extension"
    ],
    "equipment": [
      "machine",
      "flat bench",
      "weighted",
      "banded",
      "swiss ball",
      "parallel bars"
    ]
  },
  {
    "pk": "d8e71f53-9a0b-4d52-c3e8-0f5b6d9d2a74",
    "name": "Sled Push",
    "workoutGroups": [
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
    "movementVariations": [
      "loaded",
      "sprint",
      "low-handles",
      "high-handles",
      "single-arm",
      "backward",
      "heavy",
      "lateral"
    ],
    "equipment": [
      "prowler",
      "banded"
    ]
  },
  {
    "pk": "e9f82a54-0b1c-4e63-d4f9-1a6c7e0e3b85",
    "name": "Sled Pull",
    "workoutGroups": [
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
    "movementVariations": [
      "strap",
      "walking",
      "sprinting",
      "face-down",
      "backward drag",
      "hip harness",
      "ankle strap",
      "single-arm",
      "seated"
    ],
    "equipment": [
      "rope"
    ]
  }
]''';
