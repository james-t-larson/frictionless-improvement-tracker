const String staticExerciseJson = r'''[
  {
    "pk": "1232d6bd-1b97-4c14-b8e6-de4a40cae8db",
    "name": "Pull-Up",
    "variations": ["bodyweight", "weighted", "assisted", "neutral-grip", "wide-grip", "close-grip", "kipping", "butterfly", "archer", "L-sit", "typewriter", "commando", "ring", "towel", "behind-the-neck", "muscle-up"],
    "workoutGroups": ["Back"],
    "primaryMuscles": ["lat"],
    "secondaryMuscles": [
      "bicep",
      "forearm - inner",
      "rotator cuff - back",
      "shoulder - back"
    ]
  },
  {
    "pk": "dc033c10-988c-4558-bf74-3ab5be6c59fc",
    "name": "Squat",
    "variations": ["landmine", "belt", "pause", "bodyweight", "barbell", "dumbbell", "goblet", "front", "back", "split", "Bulgarian split", "pistol", "zercher", "overhead", "box", "heel-elevated", "tempo", "anderson", "safety bar", "wide-stance", "narrow-stance", "sumo", "low-bar", "high-bar"],
    "workoutGroups": ["Legs"],
    "primaryMuscles": ["glute", "lower back", "quad", "thigh - inner"],
    "secondaryMuscles": ["calf"]
  },
  {
    "pk": "7a971512-0265-490a-8ac0-871c0e1013de",
    "name": "Push-Up",
    "slug": "push-up",
    "variations": ["standard", "decline", "feet-in-rings", "incline", "wide-grip", "close-grip", "diamond", "plyometric", "weighted", "assisted", "archer", "pike", "spiderman", "ring", "T", "staggered", "hindu", "one-arm", "clap", "pseudo planche", "deficit"],
    "workoutGroups": ["Push", "Chest"],
    "primaryMuscles": ["chest", "shoulder - front", "tricep"],
    "secondaryMuscles": ["abdominal"]
  },
  {
    "pk": "6bc882f1-29e7-44c0-99b4-a36a4c91fc08",
    "name": "Face Pull",
    "slug": "face-pull",
    "variations": ["cable", "band", "rope", "single-arm", "high-pulley", "low-pulley", "kneeling", "seated", "chest-level", "pronated", "supinated"],
    "workoutGroups": ["Shoulders", "Back"],
    "primaryMuscles": ["rotator cuff - back", "trap", "shoulder - back"],
    "secondaryMuscles": ["shoulder - side", "forearm - outer"]
  },
  {
    "pk": "23cf1e36-69e0-424b-8403-fc4e30de15da",
    "name": "Bench Press",
    "variations": ["barbell", "dumbbell", "incline", "decline", "close-grip", "wide-grip", "neutral-grip", "feet-up", "smith machine", "paused", "board", "floor", "pin", "reverse-grip", "axle bar", "spoto", "touch-and-go", "larsen", "slingshot", "banded", "chains", "tempo"],
    "workoutGroups": ["Push", "Chest"],
    "primaryMuscles": ["chest", "shoulder - front"],
    "secondaryMuscles": ["tricep"]
  },
  {
    "pk": "ba2387cd-2192-42d5-8895-4c8ad78b3607",
    "name": "Deadlift",
    "variations": ["barbell", "dumbbell", "kettlebell", "trap bar", "sumo", "single-leg", "romainian", "stiff-leg", "rack-pull", "hex-bar", "deficit", "banded", "paused", "snatch-grip", "block-pull", "straps"],
    "workoutGroups": ["Hinge", "Back", "Legs"],
    "primaryMuscles": ["glute", "hamstring", "lower back"],
    "secondaryMuscles": [
      "calf",
      "forearm - inner",
      "forearm - outer",
      "trap",
      "quad"
    ]
  },
  {
    "pk": "859b2211-9bb0-462b-987c-620a3e37d688",
    "name": "Leg Press",
    "variations": ["machine", "hack squat", "single-leg", "banded", "paused", "heel-elevated", "toe-elevated", "wide-stance", "narrow-stance", "high-foot", "low-foot"],
    "workoutGroups": ["Legs"],
    "primaryMuscles": ["glute", "quad", "thigh - inner"],
    "secondaryMuscles": ["hamstring"]
  },
  {
    "pk": "2b9085c4-ad46-466b-acc9-f863a93dbaa9",
    "name": "Curl",
    "variations": ["bodyweight", "preacher", "cross-body", "single-arm", "barbell", "dumbbell", "incline", "decline", "close-grip", "wide-grip", "rope", "cable", "EZ-bar", "zottman", "21s", "spider", "machine", "seated", "standing", "reverse", "drag", "band", "kettlebell", "alternating"],
    "workoutGroups": ["Biceps", "Arms"],
    "primaryMuscles": ["bicep"],
    "secondaryMuscles": ["forearm - inner"]
  },
  {
    "pk": "8a96a73c-0c69-4102-a2c9-f103c8497e7e",
    "name": "Frog Pumps",
    "variations": ["banded", "weighted", "single-leg", "feet-elevated", "plate-weighted", "barbell", "dumbbell"],
    "workoutGroups": ["Glutes"],
    "primaryMuscles": ["glute"],
    "secondaryMuscles": ["hamstring", "thigh - inner"]
  },
  {
    "pk": "37115036-6477-4046-96dc-5c48d077a201",
    "name": "Windshield Wiper",
    "variations": ["weighted", "single-leg", "bent-knee", "feet-elevated", "decline"],
    "workoutGroups": ["Core"],
    "primaryMuscles": ["oblique"],
    "secondaryMuscles": ["abdominal"]
  },
  {
    "pk": "102850fa-8459-4cd0-81b5-88cc982d5de4",
    "name": "Dip",
    "variations": ["weighted", "assisted", "bodyweight", "rings", "bench", "machine", "parallel bars", "chest-forward", "upright", "korean", "banded", "single-arm"],
    "workoutGroups": ["Push", "Chest", "Triceps"],
    "primaryMuscles": ["chest", "tricep"],
    "secondaryMuscles": ["rotator cuff - front", "shoulder - front"]
  },
  {
    "pk": "3bc232a6-36f1-4322-948c-61c0df58cb15",
    "name": "Arnold Press",
    "variations": ["seated", "standing", "single-arm", "dumbbell", "cable", "alternating"],
    "workoutGroups": ["Shoulders"],
    "primaryMuscles": ["shoulder - back", "shoulder - side"],
    "secondaryMuscles": []
  },
  {
    "pk": "328b8330-4a04-4f43-a255-f17cba659635",
    "name": "Back Extension",
    "variations": ["weighted", "machine", "floor", "barbell", "band", "single-leg", "45-degree", "GHD", "reverse", "dumbbell", "plate"],
    "workoutGroups": ["Hinge", "Back", "Glutes"],
    "primaryMuscles": ["glute", "hamstring", "lower back"],
    "secondaryMuscles": ["abdominal"]
  },
  {
    "pk": "ab0da03b-dd54-4a7f-bb06-40c866dfa88c",
    "name": "Glute Bridge",
    "variations": ["weighted", "single-leg", "banded", "barbell", "feet-elevated", "plate", "dumbbell", "double-leg", "kettlebell"],
    "workoutGroups": ["Glutes", "Hinge"],
    "primaryMuscles": ["glute", "hamstring"],
    "secondaryMuscles": ["thigh - inner"]
  },
  {
    "pk": "cbbdaae8-7600-456f-b025-12d2050b3765",
    "name": "Leg Raise",
    "variations": ["hanging", "lying", "weighted", "single-leg", "knee-raise", "captain's chair", "bench", "incline bench", "toes-to-bar", "flutter kick", "band", "cable"],
    "workoutGroups": ["Core"],
    "primaryMuscles": ["abdominal", "forearm - inner", "forearm - outer"],
    "secondaryMuscles": ["oblique"]
  },
  {
    "pk": "7e703b05-364f-4847-af0f-a1a22aab19f6",
    "name": "Burpee",
    "variations": ["bosu", "weighted", "single-leg", "pull-up", "box jump", "dumbbell", "no-jump", "push-up", "tuck", "half"],
    "workoutGroups": ["Legs", "Core"],
    "primaryMuscles": [
      "chest",
      "glute",
      "quad",
      "shoulder - front",
      "shoulder - side"
    ],
    "secondaryMuscles": ["abdominal", "trap"]
  },
  {
    "pk": "47d61f40-0743-47af-95a5-545a6a9a4824",
    "name": "Leg Extension",
    "variations": ["machine", "single-leg", "cable", "band", "seated", "lying", "sissy squat", "tempo", "paused"],
    "workoutGroups": ["Legs"],
    "primaryMuscles": ["quad"],
    "secondaryMuscles": []
  },
  {
    "pk": "7e95b8b5-a6eb-41b6-a3c9-ae06a9ba7ac4",
    "name": "Hip Abduction",
    "variations": ["machine", "cable", "banded", "single-leg", "standing", "seated", "lying", "fire hydrant", "clamshell", "side-lying"],
    "workoutGroups": ["Legs"],
    "primaryMuscles": ["thigh - outer"],
    "secondaryMuscles": ["glute"]
  },
  {
    "pk": "a06410b6-c871-45c0-aee5-db6df750f494",
    "name": "Plank",
    "variations": ["forearm", "hands", "side", "single-leg", "weighted", "bosu", "RKC", "band", "reach", "suitcase", "reverse", "long-lever", "stir the pot"],
    "workoutGroups": ["Core"],
    "primaryMuscles": ["abdominal", "lower back"],
    "secondaryMuscles": ["oblique", "shoulder - front"]
  },
  {
    "pk": "dee8ca71-a01b-4ffd-b85e-426080e92f1e",
    "name": "Glute Kickback",
    "variations": ["machine", "cable", "banded", "single-leg", "floor", "donkey kick", "quadruped", "straight-leg", "bent-knee"],
    "workoutGroups": ["Glutes"],
    "primaryMuscles": ["glute"],
    "secondaryMuscles": ["hamstring", "thigh - inner"]
  },
  {
    "pk": "dce6d67f-877e-4595-9277-3a3f0f19dc46",
    "name": "Lunge",
    "variations": ["walking", "reverse", "side", "curtsy", "dumbbell", "barbell", "goblet", "front", "back", "split", "bulgarian", "pistol", "kettlebell", "banded", "deficit", "paused", "tempo", "overhead", "suitcase", "crossover", "explosive", "weighted vest"],
    "workoutGroups": ["Legs"],
    "primaryMuscles": ["glute", "quad", "thigh - inner"],
    "secondaryMuscles": ["calf"]
  },
  {
    "pk": "ed36669e-3f5c-411d-8eab-8fb757a21e93",
    "name": "Medicine Ball Throw",
    "variations": ["rotational", "overhead", "chest pass", "slam", "wall ball", "squat throw", "kneeling", "partner", "side throw", "scoop toss"],
    "workoutGroups": ["Core"],
    "primaryMuscles": ["oblique"],
    "secondaryMuscles": ["abdominal", "shoulder - front"]
  },
  {
    "pk": "a40205d6-396c-4c0b-a4b9-8ffbef49ed32",
    "name": "Row",
    "variations": ["t-bar", "dumbbell", "barbell", "cable", "machine", "pendlay", "chest-supported", "seated", "standing", "single-arm", "wide-grip", "close-grip", "neutral-grip", "overhand", "underhand", "kroc", "yates", "landmine", "ring", "pause"],
    "workoutGroups": ["Back"],
    "primaryMuscles": ["lat", "shoulder - back", "trap"],
    "secondaryMuscles": [
      "bicep",
      "forearm - inner",
      "lower back",
      "rotator cuff - back",
      "rotator cuff - front"
    ]
  },
  {
    "pk": "64c75731-36c2-45ae-b8c1-c8b481f34144",
    "name": "Shoulder Press",
    "variations": ["dumbbell", "barbell", "smith machine", "machine", "single-arm", "seated", "standing", "kettlebell", "push press", "behind-the-neck", "pin", "paused", "Bradford", "alternating", "cable"],
    "workoutGroups": ["Push", "Shoulders"],
    "primaryMuscles": ["shoulder - front"],
    "secondaryMuscles": ["shoulder - side", "tricep"]
  },
  {
    "pk": "91ee79b7-397d-4b90-8988-9a41bff9d639",
    "name": "Upright Row",
    "variations": ["barbell", "dumbbell", "cable", "kettlebell", "smith machine", "wide-grip", "narrow-grip", "band", "single-arm"],
    "workoutGroups": ["Shoulders", "Back"],
    "primaryMuscles": ["shoulder - side"],
    "secondaryMuscles": ["bicep", "shoulder - front", "trap"]
  },
  {
    "pk": "162433b9-39f3-4e3e-aad6-81736d44c1cf",
    "name": "Lateral Raise",
    "alternativeNames": ["Lateral Delt Fly", "Lateral Fly", "Lateral Delt Raise"],
    "variations": ["dumbbell", "cable", "machine", "single-arm", "band", "seated", "lying", "leaning", "partial", "behind-the-back cable", "kettlebell"],
    "workoutGroups": ["Shoulders"],
    "primaryMuscles": ["shoulder - back", "trap"],
    "secondaryMuscles": [
      "forearm - inner",
      "rotator cuff - back",
      "shoulder - side",
      "lat"
    ]
  },
  {
    "pk": "162433b9-39f3-4e3e-aad6-81736d44c1cf",
    "name": "Rear Delt Fly",
    "alternativeNames": ["Rear Delt Raise"],
    "variations": ["dumbbell", "cable", "machine", "single-arm", "bent-over", "seated", "incline bench", "reverse pec deck", "band", "lying"],
    "workoutGroups": ["Shoulders", "Back"],
    "primaryMuscles": ["shoulder - back", "trap"],
    "secondaryMuscles": [
      "forearm - inner",
      "rotator cuff - back",
      "shoulder - side",
      "lat"
    ]
  },
  {
    "pk": "e8dc87a4-79e1-4114-90a4-418a4b67359f",
    "name": "Shrugs",
    "variations": ["dumbbell", "barbell", "single-arm", "cable", "machine", "kettlebell", "trap bar", "smith machine", "behind-the-back", "overhead", "band"],
    "workoutGroups": ["Shoulders", "Back"],
    "primaryMuscles": ["shoulder - back", "trap"],
    "secondaryMuscles": [
      "forearm - inner",
      "rotator cuff - back",
      "shoulder - side",
      "lat"
    ]
  },
  {
    "pk": "e8dc87a4-79e1-4114-90a4-418a4b67359f",
    "name": "Front Delt Raise",
    "alternativeNames": ["Front Delt Fly"],
    "variations": ["dumbbell", "cable", "machine", "single-arm", "barbell", "plate", "band", "incline", "prone", "seated"],
    "workoutGroups": ["Shoulders"],
    "primaryMuscles": ["shoulder - back", "trap"],
    "secondaryMuscles": [
      "forearm - inner",
      "rotator cuff - back",
      "shoulder - side",
      "lat"
    ]
  },
  {
    "pk": "e8dc87a4-79e1-4114-90a4-418a4b67359f",
    "name": "Rear Delt Row",
    "variations": ["dumbbell", "barbell", "cable", "machine", "single-arm", "prone", "wide-grip", "close-grip", "band", "kettlebell"],
    "workoutGroups": ["Shoulders", "Back"],
    "primaryMuscles": ["shoulder - back", "trap"],
    "secondaryMuscles": [
      "forearm - inner",
      "rotator cuff - back",
      "shoulder - side",
      "lat"
    ]
  },
  {
    "pk": "c5116ba3-8a9d-4318-80e5-678a927cf916",
    "name": "Floor Press",
    "variations": ["dumbbell", "barbell", "single-arm", "kettlebell", "close-grip", "paused", "banded", "neutral-grip"],
    "workoutGroups": ["Push", "Chest"],
    "primaryMuscles": ["chest", "shoulder - front"],
    "secondaryMuscles": ["tricep"]
  },
  {
    "pk": "8431323c-ca05-4424-9e2f-995e85f4f9e3",
    "name": "Power Clean",
    "variations": ["hang", "wide-grip", "dumbbell", "kettlebell", "clean and press", "clean and jerk", "close-grip", "sumo", "clean and push press", "clean and push jerk", "block", "tall", "low-hang", "mid-thigh", "paused", "pause at knee"],
    "workoutGroups": ["Hinge", "Back"],
    "primaryMuscles": ["glute", "lower back"],
    "secondaryMuscles": [
      "forearm - outer",
      "hamstring",
      "thigh - inner",
      "trap"
    ]
  },
  {
    "pk": "e4ada608-1354-43e6-99cb-c7af0c76edde",
    "name": "V-Up",
    "variations": ["weighted", "single-leg", "bent-knee", "hollow body", "tuck", "full", "band-resisted"],
    "workoutGroups": ["Core"],
    "primaryMuscles": ["abdominal"],
    "secondaryMuscles": []
  },
  {
    "pk": "288eae8d-af58-42db-9f10-16b599e11876",
    "name": "Hack Squat",
    "variations": ["barbell", "dumbbell", "machine", "smith machine", "reverse", "narrow-stance", "wide-stance", "paused", "heel-elevated", "banded", "safety bar"],
    "workoutGroups": ["Legs"],
    "primaryMuscles": ["quad"],
    "secondaryMuscles": [
      "calf",
      "forearm - inner",
      "glute",
      "lower back",
      "thigh - inner",
      "trap"
    ]
  },
  {
    "pk": "a189b026-3641-426f-b9a2-d32678ccb99f",
    "name": "Lat Pulldown",
    "variations": ["straight arm", "cable", "dumbbell", "band", "rope", "single-arm", "seated", "standing", "kneeling", "bent-arm", "wide-grip", "close-grip", "neutral-grip", "overhand-grip", "underhand-grip", "bar"],
    "workoutGroups": ["Back"],
    "primaryMuscles": ["lat"],
    "secondaryMuscles": [
      "rotator cuff - back",
      "rotator cuff - front",
      "shoulder - back"
    ]
  },
  {
    "pk": "c46c643f-d109-4720-8ce9-3b5d24b9cdec",
    "name": "Lateral Walk",
    "variations": ["band", "dumbbell", "kettlebell", "barbell", "wide-stance", "squat position", "hip-level", "weighted vest", "ankle weights"],
    "workoutGroups": ["Legs"],
    "primaryMuscles": ["glute", "thigh - outer"],
    "secondaryMuscles": ["calf", "hamstring", "quad", "thigh - inner"]
  },
  {
    "pk": "13ce59d9-4fd0-4aea-857a-3afc186c3074",
    "name": "Sit-Up",
    "variations": ["standard", "decline", "incline", "weighted", "anchor", "band-resisted", "crossed-arms", "hands-behind-head", "twisting", "janda", "GHD", "feet-in-rings"],
    "workoutGroups": ["Core"],
    "primaryMuscles": ["abdominal"],
    "secondaryMuscles": ["oblique"]
  },
  {
    "pk": "0c5940e6-419e-476b-a1eb-39302e0aebe5",
    "name": "Chest Fly",
    "variations": ["dumbbell", "cable crossover", "machine", "band", "incline", "decline", "flat", "overhand-grip", "underhand-grip", "pec-dec"],
    "workoutGroups": ["Chest"],
    "primaryMuscles": ["chest"],
    "secondaryMuscles": ["bicep", "forearm - inner", "shoulder - front"]
  },
  {
    "pk": "e13cf8a4-6b48-4d9e-9a24-a30d5f98d713",
    "name": "Mountain Climbers",
    "variations": ["slow", "cross-body", "resistance band", "slider", "bosu", "elevated", "weighted vest"],
    "workoutGroups": ["Core"],
    "primaryMuscles": ["abdominal"],
    "secondaryMuscles": ["oblique"]
  },
  {
    "pk": "edb21df1-0a7a-49f8-94e3-fa47138af935",
    "name": "Tricep Pushdown",
    "variations": ["cable", "rope", "band", "single-arm", "standing", "kneeling", "wide-grip", "close-grip", "neutral-grip", "overhand-grip", "underhand-grip", "bar"],
    "workoutGroups": ["Triceps"],
    "primaryMuscles": ["tricep"],
    "secondaryMuscles": []
  },
  {
    "pk": "03ded3cd-bba0-4f04-9afd-f7e321aec282",
    "name": "Lat Pulldown",
    "variations": ["cable", "rope", "single-arm", "kneeling", "wide-grip", "close-grip", "neutral-grip", "overhand-grip", "underhand-grip", "bar"],
    "workoutGroups": ["Back"],
    "primaryMuscles": ["lat"],
    "secondaryMuscles": [
      "bicep",
      "forearm - inner",
      "rotator cuff - back",
      "rotator cuff - front",
      "shoulder - back"
    ]
  },
  {
    "pk": "f1c844bd-28c8-4191-9b2a-d0233e6941e1",
    "name": "Wrist Curl",
    "variations": ["barbell", "dumbbell", "cable", "band", "single-arm", "behind-the-back", "seated", "standing", "EZ-bar", "reverse", "pronated"],
    "workoutGroups": ["Arms"],
    "primaryMuscles": ["forearm - inner"],
    "secondaryMuscles": []
  },
  {
    "pk": "a3f7c812-1d45-4b89-93c0-7e2d4f6a1b85",
    "name": "Overhead Press",
    "variations": ["barbell", "dumbbell", "kettlebell", "landmine", "push press", "strict", "seated", "standing", "single-arm", "behind-the-neck", "pin", "paused", "Bradford", "alternating", "push jerk", "split jerk", "Z-press"],
    "workoutGroups": ["Push", "Shoulders"],
    "primaryMuscles": ["shoulder - front", "shoulder - side"],
    "secondaryMuscles": ["tricep", "trap", "rotator cuff - front"]
  },
  {
    "pk": "b9e2a547-3c68-4f10-a1d7-5c8b0e3d2f94",
    "name": "Hip Thrust",
    "variations": ["barbell", "dumbbell", "banded", "single-leg", "machine", "smith machine", "paused", "feet-elevated", "narrow-stance", "wide-stance", "plate", "american", "B-stance"],
    "workoutGroups": ["Glutes", "Hinge"],
    "primaryMuscles": ["glute"],
    "secondaryMuscles": ["hamstring", "thigh - inner"]
  },
  {
    "pk": "c1d83b6a-7f29-4e5c-b2a8-9d0e5f7c3b21",
    "name": "Romanian Deadlift",
    "variations": ["barbell", "dumbbell", "kettlebell", "single-leg", "cable", "trap bar", "banded", "paused", "stiff-leg", "wide-grip", "snatch-grip", "B-stance", "deficit"],
    "workoutGroups": ["Hinge", "Legs", "Glutes"],
    "primaryMuscles": ["hamstring", "glute"],
    "secondaryMuscles": ["lower back", "calf"]
  },
  {
    "pk": "d4c96e3f-8a1b-4d72-c3e9-2f5a7b0d4c68",
    "name": "Nordic Curl",
    "variations": ["bodyweight", "weighted", "partner-assisted", "machine", "eccentric", "GHD", "band-assisted", "feet-anchored"],
    "workoutGroups": ["Hinge", "Legs"],
    "primaryMuscles": ["hamstring"],
    "secondaryMuscles": ["glute", "calf"]
  },
  {
    "pk": "e7f04a19-2b3c-4e85-d6f1-3a8c9e2d5b07",
    "name": "Good Morning",
    "variations": ["barbell", "banded", "seated", "single-leg", "dumbbell", "cable", "smith machine", "safety bar", "good morning squat", "suspended", "wide-grip", "paused"],
    "workoutGroups": ["Hinge", "Back"],
    "primaryMuscles": ["hamstring", "lower back"],
    "secondaryMuscles": ["glute", "abdominal"]
  },
  {
    "pk": "f2a15b28-3c4d-4f96-e7a2-4b9d0f3e6c18",
    "name": "Step-Up",
    "variations": ["dumbbell", "barbell", "bodyweight", "weighted vest", "lateral", "single-leg", "kettlebell", "crossover", "explosive", "deficit", "Bulgarian", "goblet", "paused"],
    "workoutGroups": ["Legs"],
    "primaryMuscles": ["glute", "quad"],
    "secondaryMuscles": ["hamstring", "calf"]
  },
  {
    "pk": "a3b26c39-4d5e-4a07-f8b3-5c0e1a4f7d29",
    "name": "Leg Curl",
    "variations": ["lying machine", "seated machine", "cable", "dumbbell", "band", "single-leg", "nordic", "slider", "stability ball", "prone", "standing", "paused", "tempo"],
    "workoutGroups": ["Legs"],
    "primaryMuscles": ["hamstring"],
    "secondaryMuscles": ["calf", "glute"]
  },
  {
    "pk": "b4c37d4a-5e6f-4b18-a9c4-6d1f2b5a8e30",
    "name": "Calf Raise",
    "variations": ["standing", "seated", "single-leg", "machine", "barbell", "dumbbell", "donkey", "leg press", "toe press", "offset", "band-resisted", "paused", "tempo", "heel-elevated", "eccentric"],
    "workoutGroups": ["Legs"],
    "primaryMuscles": ["calf"],
    "secondaryMuscles": []
  },
  {
    "pk": "c5d48e5b-6f7a-4c29-b0d5-7e2a3c6b9f41",
    "name": "Chin-Up",
    "variations": ["bodyweight", "weighted", "assisted", "close-grip", "neutral-grip", "wide-grip", "L-sit", "ring", "band-resisted", "kipping", "typewriter", "supinated"],
    "workoutGroups": ["Back", "Biceps"],
    "primaryMuscles": ["lat", "bicep"],
    "secondaryMuscles": ["forearm - inner", "shoulder - back", "rotator cuff - back"]
  },
  {
    "pk": "d6e59f6c-7a8b-4d30-c1e6-8f3b4d7c0a52",
    "name": "Inverted Row",
    "variations": ["bodyweight", "weighted", "wide-grip", "close-grip", "underhand", "feet-elevated", "suspension trainer", "barbell", "rings", "overhand", "neutral", "pronated", "single-arm"],
    "workoutGroups": ["Back"],
    "primaryMuscles": ["lat", "shoulder - back"],
    "secondaryMuscles": ["bicep", "trap", "forearm - inner"]
  },
  {
    "pk": "e7f60a7d-8b9c-4e41-d2f7-9a4c5e8d1b63",
    "name": "Seal Row",
    "variations": ["barbell", "dumbbell", "machine", "wide-grip", "close-grip", "neutral-grip", "single-arm", "cable"],
    "workoutGroups": ["Back"],
    "primaryMuscles": ["lat", "shoulder - back"],
    "secondaryMuscles": ["bicep", "trap", "rotator cuff - back"]
  },
  {
    "pk": "f8a71b8e-9c0d-4f52-e3a8-0b5d6f9e2c74",
    "name": "Chest-Supported Row",
    "variations": ["dumbbell", "barbell", "machine", "cable", "single-arm", "wide-grip", "close-grip", "neutral-grip", "prone", "incline"],
    "workoutGroups": ["Back"],
    "primaryMuscles": ["lat", "shoulder - back"],
    "secondaryMuscles": ["bicep", "trap", "forearm - inner"]
  },
  {
    "pk": "a9b82c9f-0d1e-4a63-f4b9-1c6e7a0f3d85",
    "name": "Cable Row",
    "variations": ["seated", "standing", "single-arm", "wide-grip", "close-grip", "neutral-grip", "rope", "kneeling", "half-kneeling", "split-stance", "overhand", "underhand", "face-away"],
    "workoutGroups": ["Back"],
    "primaryMuscles": ["lat", "shoulder - back"],
    "secondaryMuscles": ["bicep", "trap", "lower back", "forearm - inner"]
  },
  {
    "pk": "b0c93d0a-1e2f-4b74-a5c0-2d7f8b1a4e96",
    "name": "Hammer Curl",
    "variations": ["dumbbell", "cable", "rope", "single-arm", "cross-body", "incline", "seated", "standing", "alternating", "preacher", "drag", "machine", "band"],
    "workoutGroups": ["Biceps", "Arms"],
    "primaryMuscles": ["bicep"],
    "secondaryMuscles": ["forearm - outer", "forearm - inner"]
  },
  {
    "pk": "c1d04e1b-2f3a-4c85-b6d1-3e8a9c2b5f07",
    "name": "Tricep Extension",
    "variations": ["cable", "dumbbell", "barbell", "rope", "EZ-bar", "band", "single-arm", "overhead", "lying", "seated", "standing", "kickback", "behind-the-head"],
    "workoutGroups": ["Triceps"],
    "primaryMuscles": ["tricep"],
    "secondaryMuscles": []
  },
  {
    "pk": "d2e15f2c-3a4b-4d96-c7e2-4f9b0d3c6a18",
    "name": "Skull Crusher",
    "variations": ["barbell", "EZ-bar", "dumbbell", "cable", "band", "single-arm", "flat bench", "incline bench", "decline bench", "floor", "neutral-grip"],
    "workoutGroups": ["Triceps"],
    "primaryMuscles": ["tricep"],
    "secondaryMuscles": []
  },
  {
    "pk": "c7d60e7b-8f9a-4c41-b2d7-9e4a5c8b1f63",
    "name": "Wrist Extension",
    "variations": ["barbell", "dumbbell", "cable", "band", "single-arm", "seated", "standing", "EZ-bar", "reverse wrist curl", "pronated"],
    "workoutGroups": ["Arms"],
    "primaryMuscles": ["forearm - outer"],
    "secondaryMuscles": []
  },
  {
    "pk": "d8e71f8c-9a0b-4d52-c3e8-0f5b6d9c2a74",
    "name": "Farmer's Carry",
    "variations": ["dumbbell", "barbell", "kettlebell", "trap bar", "single-arm", "overhead", "yoke", "waiter's carry", "suitcase carry", "mixed-grip", "axle bar", "double kettlebell"],
    "workoutGroups": ["Shoulders", "Back"],
    "primaryMuscles": ["forearm - inner", "trap"],
    "secondaryMuscles": ["lower back", "shoulder - side", "glute"]
  },
  {
    "pk": "e9f82a9d-0b1c-4e63-d4f9-1a6c7e0d3b85",
    "name": "Snatch",
    "variations": ["barbell", "dumbbell", "kettlebell", "hang", "power", "squat", "muscle snatch", "block", "overhead squat", "snatch balance", "drop snatch", "paused", "wide-grip"],
    "workoutGroups": ["Hinge", "Back"],
    "primaryMuscles": ["glute", "hamstring", "lower back"],
    "secondaryMuscles": ["trap", "shoulder - front", "quad", "forearm - outer"]
  },
  {
    "pk": "f0a93b0e-1c2d-4f74-e5a0-2b7d8f1e4c96",
    "name": "Clean",
    "variations": ["hang", "power", "squat", "single-arm", "dumbbell", "kettlebell", "clean pull", "tall clean", "block", "clean shrug", "low-hang", "paused", "deficit"],
    "workoutGroups": ["Hinge", "Back"],
    "primaryMuscles": ["glute", "hamstring", "lower back"],
    "secondaryMuscles": ["trap", "quad", "forearm - outer"]
  },
  {
    "pk": "a1b04c1f-2d3e-4a85-f6b1-3c8e9a2d5f07",
    "name": "Kettlebell Swing",
    "variations": ["two-hand", "single-arm", "American", "banded", "sumo", "high pull", "dead swing", "ballistic", "snatch-grip"],
    "workoutGroups": ["Hinge", "Glutes"],
    "primaryMuscles": ["glute", "hamstring"],
    "secondaryMuscles": ["lower back", "shoulder - front", "forearm - inner"]
  },
  {
    "pk": "b2c15d2a-3e4f-4b96-a7c2-4d9f0b3e6a18",
    "name": "Landmine Press",
    "variations": ["single-arm", "kneeling", "standing", "half-kneeling", "push press", "bilateral", "alternating", "rotational", "squat-to-press", "split-stance"],
    "workoutGroups": ["Push", "Shoulders", "Chest"],
    "primaryMuscles": ["shoulder - front", "chest"],
    "secondaryMuscles": ["tricep", "shoulder - side"]
  },
  {
    "pk": "f6a59b6e-7c8d-4f30-e1a6-8b3d4f7c0e52",
    "name": "Pullover",
    "variations": ["dumbbell - flat bench", "dumbbell - decline bench", "single-arm", "cable", "barbell", "EZ-bar", "machine", "straight-arm", "bent-arm"],
    "workoutGroups": ["Chest", "Back"],
    "primaryMuscles": ["chest", "lat"],
    "secondaryMuscles": ["tricep", "shoulder - back"]
  },
  {
    "pk": "b8c71d8a-9e0f-4b52-a3c8-0d5f6b9e2c74",
    "name": "Meadows Row",
    "variations": ["overhand", "underhand", "neutral-grip", "kneeling", "chest-supported", "staggered-stance", "heavy", "single-arm"],
    "workoutGroups": ["Back"],
    "primaryMuscles": ["lat", "shoulder - back"],
    "secondaryMuscles": ["bicep", "forearm - inner", "trap"]
  },
  {
    "pk": "d0e93f0c-1a2b-4d74-c5e0-2f7a8d1e4f96",
    "name": "Band Pull-Apart",
    "variations": ["overhand", "underhand", "wide-grip", "narrow-grip", "chest-level", "overhead", "behind-the-back", "diagonal", "single-arm", "band"],
    "workoutGroups": ["Shoulders"],
    "primaryMuscles": ["shoulder - back", "rotator cuff - back"],
    "secondaryMuscles": ["trap", "shoulder - side"]
  },
  {
    "pk": "e1f04a1d-2b3c-4e85-d6f1-3a8d9e2f5a07",
    "name": "Cable External Rotation",
    "variations": ["standing", "seated", "single-arm", "band", "lying", "90-degree abduction", "side-lying", "prone", "doorway"],
    "workoutGroups": ["Shoulders"],
    "primaryMuscles": ["rotator cuff - back"],
    "secondaryMuscles": ["shoulder - back"]
  },
  {
    "pk": "f2a15b2e-3c4d-4f96-e7a2-4b9e0f3a6b18",
    "name": "Internal Rotation",
    "variations": ["cable", "band", "standing", "seated", "single-arm", "lying", "90-degree abduction", "side-lying", "prone"],
    "workoutGroups": ["Shoulders"],
    "primaryMuscles": ["rotator cuff - front"],
    "secondaryMuscles": ["shoulder - front"]
  },
  {
    "pk": "d6e59f6d-7a8b-4d30-c1e6-8f3b4d7e0a52",
    "name": "Rack Pull",
    "variations": ["barbell", "below-knee", "above-knee", "sumo", "straps", "wide-grip", "snatch-grip", "mixed-grip", "overhand", "deficit", "paused"],
    "workoutGroups": ["Hinge", "Back"],
    "primaryMuscles": ["lower back", "glute"],
    "secondaryMuscles": ["trap", "hamstring", "forearm - inner"]
  },
  {
    "pk": "e7f60a7e-8b9c-4e41-d2f7-9a4c5e8f1b63",
    "name": "Hip Adduction",
    "variations": ["machine", "cable", "banded", "seated", "standing", "lying", "Copenhagen plank", "side-lying", "single-leg"],
    "workoutGroups": ["Legs"],
    "primaryMuscles": ["thigh - inner"],
    "secondaryMuscles": ["glute"]
  },
  {
    "pk": "f8a71b8f-9c0d-4f52-e3a8-0b5d6f9f2c74",
    "name": "Box Jump",
    "variations": ["standard", "weighted", "depth jump", "single-leg", "lateral", "rotational", "broad jump", "step-down", "banded", "hurdle"],
    "workoutGroups": ["Legs"],
    "primaryMuscles": ["glute", "quad"],
    "secondaryMuscles": ["hamstring", "calf"]
  },
  {
    "pk": "a9b82c9a-0d1e-4a63-f4b9-1c6e7a0a3d85",
    "name": "Wall Sit",
    "variations": ["bodyweight", "weighted", "single-leg", "banded", "heels-elevated", "stability ball", "with press", "overhead hold"],
    "workoutGroups": ["Legs", "Core"],
    "primaryMuscles": ["quad"],
    "secondaryMuscles": ["glute", "hamstring"]
  },
  {
    "pk": "b0c93d0b-1e2f-4b74-a5c0-2d7f8b1b4e96",
    "name": "Dead Bug",
    "variations": ["bodyweight", "weighted", "band", "single-arm", "single-leg", "contralateral", "stability ball", "dumbbell"],
    "workoutGroups": ["Core"],
    "primaryMuscles": ["abdominal"],
    "secondaryMuscles": ["oblique", "lower back"]
  },
  {
    "pk": "c1d04e1c-2f3a-4c85-b6d1-3e8a9c2c5f07",
    "name": "Pallof Press",
    "variations": ["cable", "band", "kneeling", "standing", "half-kneeling", "single-arm", "push", "overhead", "rotation", "isometric", "split-stance"],
    "workoutGroups": ["Core"],
    "primaryMuscles": ["oblique", "abdominal"],
    "secondaryMuscles": ["shoulder - front", "lower back"]
  },
  {
    "pk": "d2e15f2d-3a4b-4d96-c7e2-4f9b0d3d6a18",
    "name": "Ab Wheel Rollout",
    "variations": ["kneeling", "standing", "single-arm", "barbell", "band-assisted", "pike", "feet-elevated", "weighted"],
    "workoutGroups": ["Core"],
    "primaryMuscles": ["abdominal"],
    "secondaryMuscles": ["oblique", "lower back", "shoulder - front"]
  },
  {
    "pk": "e3f26a3e-4b5c-4e07-d8f3-5a0c1e4e7b29",
    "name": "Russian Twist",
    "variations": ["bodyweight", "weighted", "medicine ball", "cable", "feet-elevated", "decline", "plate", "kettlebell", "band-resisted"],
    "workoutGroups": ["Core"],
    "primaryMuscles": ["oblique"],
    "secondaryMuscles": ["abdominal"]
  },
  {
    "pk": "f4a37b4f-5c6d-4f18-e9a4-6b1d2f5f8c30",
    "name": "Knee Raise",
    "variations": ["hanging", "bodyweight", "weighted", "straight-leg", "toes-to-bar", "captain's chair", "parallel bars", "lying", "incline", "cable", "band"],
    "workoutGroups": ["Core"],
    "primaryMuscles": ["abdominal"],
    "secondaryMuscles": ["oblique", "forearm - inner", "hip flexor"]
  },
  {
    "pk": "a5b48c50-6d7e-4a29-f0b5-7c2e3a6a9d41",
    "name": "Landmine Rotation",
    "variations": ["standing", "kneeling", "half-kneeling", "single-arm", "bilateral", "chop", "lift", "rotational push-press"],
    "workoutGroups": ["Core", "Shoulders"],
    "primaryMuscles": ["oblique"],
    "secondaryMuscles": ["abdominal", "shoulder - front", "lower back"]
  },
  {
    "pk": "b6c59d51-7e8f-4b30-a1c6-8d3f4b7b0e52",
    "name": "Cable Crunch",
    "variations": ["kneeling", "standing", "rope", "single-arm", "oblique", "reverse", "side-lying", "band", "seated"],
    "workoutGroups": ["Core"],
    "primaryMuscles": ["abdominal"],
    "secondaryMuscles": ["oblique"]
  },
  {
    "pk": "c7d60e52-8f9a-4c41-b2d7-9e4a5c8c1f63",
    "name": "Reverse Hyperextension",
    "variations": ["machine", "flat bench", "weighted", "banded", "GHD", "single-leg", "hip extension", "swiss ball", "parallel bars"],
    "workoutGroups": ["Hinge", "Glutes", "Back"],
    "primaryMuscles": ["glute", "hamstring", "lower back"],
    "secondaryMuscles": []
  },
  {
    "pk": "d8e71f53-9a0b-4d52-c3e8-0f5b6d9d2a74",
    "name": "Sled Push",
    "variations": ["loaded", "sprint", "low-handles", "high-handles", "single-arm", "backward", "heavy", "prowler", "lateral", "banded"],
    "workoutGroups": ["Legs"],
    "primaryMuscles": ["glute", "quad"],
    "secondaryMuscles": ["hamstring", "calf", "shoulder - front"]
  },
  {
    "pk": "e9f82a54-0b1c-4e63-d4f9-1a6c7e0e3b85",
    "name": "Sled Pull",
    "variations": ["rope", "strap", "walking", "sprinting", "face-down", "backward drag", "hip harness", "ankle strap", "single-arm", "seated"],
    "workoutGroups": ["Legs", "Back"],
    "primaryMuscles": ["hamstring", "glute"],
    "secondaryMuscles": ["lower back", "forearm - inner"]
  }
]''';
