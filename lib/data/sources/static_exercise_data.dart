const String staticExerciseJson = r'''[
  {
    "pk": "1232d6bd-1b97-4c14-b8e6-de4a40cae8db",
    "name": "Pull-Up",
    "variations": ["bodyweight", "weighted", "assisted", "neutral-grip", "wide-grip", "close-grip"],
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
    "variations": ["landmine", "belt", "pause", "bodyweight", "barbell", "dumbbell", "goblet", "front", "back", "split", "Bulgarian split", "pistol"],
    "primaryMuscles": ["glute", "lower back", "quad", "thigh - inner"],
    "secondaryMuscles": ["calf"]
  },
  {
    "pk": "7a971512-0265-490a-8ac0-871c0e1013de",
    "name": "Push-Up",
    "slug": "push-up",
    "variations": ["standard", "decline", "feet-in-rings", "incline", "wide-grip", "close-grip", "diamond", "plyometric", "weighted", "assisted"],
    "primaryMuscles": ["chest", "shoulder - front", "tricep"],
    "secondaryMuscles": ["abdominal"]
  },
  {
    "pk": "6bc882f1-29e7-44c0-99b4-a36a4c91fc08",
    "name": "Face Pull",
    "slug": "face-pull",
    "variations": ["cable", "band", "rope", "single-arm"],
    "primaryMuscles": ["rotator cuff - back", "trap", "shoulder - back"],
    "secondaryMuscles": ["shoulder - side", "forearm - outer"]
  },
  {
    "pk": "23cf1e36-69e0-424b-8403-fc4e30de15da",
    "name": "Bench Press",
    "variations": ["barbell", "dumbbell", "incline", "decline", "close-grip", "wide-grip", "neutral-grip", "feet-up", "smith machine"],
    "primaryMuscles": ["chest", "shoulder - front"],
    "secondaryMuscles": ["tricep"]
  },
  {
    "pk": "ba2387cd-2192-42d5-8895-4c8ad78b3607",
    "name": "Deadlift",
    "variations": ["barbell", "dumbbell", "kettlebell", "trap bar", "sumo", "single-leg", "romainian", "stiff-leg", "rack-pull", "hex-bar", "deficit", "banded", "paused", "snatch-grip", "block-pull", "straps"],
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
    "pk": "60576989-d045-492b-82b0-743bb4a3ce62",
    "name": "Plank",
    "slug": "plank",
    "variations": ["side", "weighted"],
    "primaryMuscles": ["abdominal", "lower back"],
    "secondaryMuscles": ["oblique", "shoulder - front"]
  },
  {
    "pk": "859b2211-9bb0-462b-987c-620a3e37d688",
    "name": "Leg Press",
    "variations": ["machine", "hack squat", "single-leg", "banded", "paused", "heel-elevated", "toe-elevated", "wide-stance", "narrow-stance", "high-foot", "low-foot"],
    "primaryMuscles": ["glute", "quad", "thigh - inner"],
    "secondaryMuscles": ["hamstring"]
  },
  {
    "pk": "2b9085c4-ad46-466b-acc9-f863a93dbaa9",
    "name": "Curl",
    "variations": ["body-weight", "preacher", "cross-body", "single-arm", "barbell", "dumbbell", "incline", "decline", "close-grip", "wide-grip", "rope"],
    "primaryMuscles": ["bicep"],
    "secondaryMuscles": ["forearm - inner"]
  },
  {
    "pk": "8a96a73c-0c69-4102-a2c9-f103c8497e7e",
    "name": "Frog Pumps",
    "variations": ["banded", "weighted", "single-leg"],
    "primaryMuscles": ["glute"],
    "secondaryMuscles": ["hamstring", "thigh - inner"]
  },
  {
    "pk": "37115036-6477-4046-96dc-5c48d077a201",
    "name": "Lying Windshield Wiper",
    "variations": ["weighted", "single-leg"],
    "primaryMuscles": ["oblique"],
    "secondaryMuscles": ["abdominal"]
  },
  {
    "pk": "102850fa-8459-4cd0-81b5-88cc982d5de4",
    "name": "Dip \u2013 Bar",
    "variations": ["weighted", "single-leg", "assisted"],
    "primaryMuscles": ["chest", "tricep"],
    "secondaryMuscles": ["rotator cuff - front", "shoulder - front"]
  },
  {
    "pk": "3bc232a6-36f1-4322-948c-61c0df58cb15",
    "name": "Arnold Press",
    "variations": ["seated", "standing"],
    "primaryMuscles": ["shoulder - back", "shoulder - side"],
    "secondaryMuscles": []
  },
  {
    "pk": "328b8330-4a04-4f43-a255-f17cba659635",
    "name": "Back Extension",
    "variations": ["weighted", "machine", "floor"],
    "primaryMuscles": ["glute", "hamstring", "lower back"],
    "secondaryMuscles": ["abdominal"]
  },
  {
    "pk": "ab0da03b-dd54-4a7f-bb06-40c866dfa88c",
    "name": "Glute Bridge",
    "variations": ["weighted", "single-leg", "banded"],
    "primaryMuscles": ["glute", "hamstring"],
    "secondaryMuscles": ["thigh - inner"]
  },
  {
    "pk": "cbbdaae8-7600-456f-b025-12d2050b3765",
    "name": "Leg Raise",
    "variations": ["hanging", "lying", "weighted", "single-leg", "knee-raise"],
    "primaryMuscles": ["abdominal", "forearm - inner", "forearm - outer"],
    "secondaryMuscles": ["oblique"]
  },
  {
    "pk": "7e703b05-364f-4847-af0f-a1a22aab19f6",
    "name": "Burpee",
    "variations": ["bosu", "weighted", "single-leg"],
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
    "pk": "f954e30f-cb89-488b-99da-4358244fd815",
    "name": "Shoulder Press",
    "variations": ["machine", "dumbbell", "barbell", "seated", "standing", "single-arm"],
    "primaryMuscles": ["shoulder - front"],
    "secondaryMuscles": ["shoulder - side", "tricep"]
  },
  {
    "pk": "47d61f40-0743-47af-95a5-545a6a9a4824",
    "name": "Leg Extension",
    "variations": ["machine", "single-leg"],
    "primaryMuscles": ["quad"],
    "secondaryMuscles": []
  },
  {
    "pk": "a02747d9-7ee8-41d5-aade-d3c7c8556c3a",
    "name": "Rear Delt Row \u2013 Barbell",
    "slug": "rear-delt-row-barbell",
    "primaryMuscles": ["shoulder - back", "trap"],
    "secondaryMuscles": [
      "forearm - inner",
      "rotator cuff - back",
      "shoulder - side",
      "lat"
    ]
  },
  {
    "pk": "7e95b8b5-a6eb-41b6-a3c9-ae06a9ba7ac4",
    "name": "Hip Abduction",
    "variations": ["machine", "cable", "banded", "single-leg"],
    "primaryMuscles": ["thigh - outer"],
    "secondaryMuscles": ["glute"]
  },
  {
    "pk": "a06410b6-c871-45c0-aee5-db6df750f494",
    "name": "Plank",
    "variations": ["bosu", "weighted", "single-leg", "side"],
    "primaryMuscles": ["abdominal", "lower back"],
    "secondaryMuscles": ["oblique", "shoulder - front"]
  },
  {
    "pk": "dee8ca71-a01b-4ffd-b85e-426080e92f1e",
    "name": "Glute Kickback",
    "variations": ["machine", "cable", "banded", "single-leg"],
    "primaryMuscles": ["glute"],
    "secondaryMuscles": ["hamstring", "thigh - inner"]
  },
  {
    "pk": "dce6d67f-877e-4595-9277-3a3f0f19dc46",
    "name": "Lunge",
    "variations": ["walking", "reverse", "side", "curtsy", "dumbbell", "barbell", "goblet", "front", "back", "split", "bulgarian", "pistol", "walking"],
    "primaryMuscles": ["glute", "quad", "thigh - inner"],
    "secondaryMuscles": ["calf"]
  },
  {
    "pk": "ed36669e-3f5c-411d-8eab-8fb757a21e93",
    "name": "Medicine Ball Throw",
    "variations": ["rotational", "overhead", "chest pass", "slam"],
    "primaryMuscles": ["oblique"],
    "secondaryMuscles": ["abdominal", "shoulder - front"]
  },
  {
    "pk": "a40205d6-396c-4c0b-a4b9-8ffbef49ed32",
    "name": "Row",
    "variations": ["t-bar", "dumbbell", "barbell", "cable", "machine"],
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
    "variations": ["dumbbell", "barbell", "smith-machine", "machine", "single-arm", "seated", "standing"],
    "primaryMuscles": ["shoulder - front"],
    "secondaryMuscles": ["shoulder - side", "tricep"]
  },
  {
    "pk": "91ee79b7-397d-4b90-8988-9a41bff9d639",
    "name": "Upright Row",
    "variations": ["barbell", "dumbbell", "cable"],
    "primaryMuscles": ["shoulder - side"],
    "secondaryMuscles": ["bicep", "shoulder - front", "trap"]
  },
  {
    "pk": "e8dc87a4-79e1-4114-90a4-418a4b67359f",
    "name": "Rear Delt Row",
    "variations": ["dumbbell", "barbell", "cable", "machine", "single-arm"],
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
    "variations": ["dumbbell", "barbell", "single-arm"],
    "primaryMuscles": ["chest", "shoulder - front"],
    "secondaryMuscles": ["tricep"]
  },
  {
    "pk": "8431323c-ca05-4424-9e2f-995e85f4f9e3",
    "name": "Power Clean",
    "variations": ["hang", "wide-grip", "dumbbell", "kettlebell", "clean and press", "clean and jerk", "close-grip", "sumo", "clean and push press", "clean and push jerk"],
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
    "variations": ["weighted", "single-leg", "bent-knee"],
    "primaryMuscles": ["abdominal"],
    "secondaryMuscles": []
  },
  {
    "pk": "288eae8d-af58-42db-9f10-16b599e11876",
    "name": "Hack Squat",
    "variations": ["barbell", "dumbbell", "machine", "smith machine"],
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
    "name": "Straight Arm Lat Pulldown",
    "variations": ["cable", "dumbbell", "band", "rope", "single-arm", "seated", "standing", "kneeling", "bent-arm", "wide-grip", "close-grip", "neutral-grip", "overhand-grip", "underhand-grip", "bar"],
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
    "variations": ["band", "dumbbell", "kettlebell", "barbell"],
    "primaryMuscles": ["glute", "thigh - outer"],
    "secondaryMuscles": ["calf", "hamstring", "quad", "thigh - inner"]
  },
  {
    "pk": "13ce59d9-4fd0-4aea-857a-3afc186c3074",
    "name": "Sit-Up",
    "variations": ["standard", "decline", "incline", "weighted"],
    "primaryMuscles": ["abdominal"],
    "secondaryMuscles": ["oblique"]
  },
  {
    "pk": "0c5940e6-419e-476b-a1eb-39302e0aebe5",
    "name": "Chest Fly",
    "variations": ["dumbbell", "cable", "machine", "band", "incline", "decline", "flat", "neutral-grip", "overhand-grip", "underhand-grip", "barbell"],
    "primaryMuscles": ["chest"],
    "secondaryMuscles": ["bicep", "forearm - inner", "shoulder - front"]
  },
  {
    "pk": "e13cf8a4-6b48-4d9e-9a24-a30d5f98d713",
    "name": "Mountain Climbers",
    "variations": [],
    "primaryMuscles": ["abdominal"],
    "secondaryMuscles": ["oblique"]
  },
  {
    "pk": "edb21df1-0a7a-49f8-94e3-fa47138af935",
    "name": "Tricep Pushdown",
    "variations": ["cable", "rope", "band", "single-arm", "standing", "kneeling", "wide-grip", "close-grip", "neutral-grip", "overhand-grip", "underhand-grip", "bar"],
    "primaryMuscles": ["tricep"],
    "secondaryMuscles": []
  },
  {
    "pk": "03ded3cd-bba0-4f04-9afd-f7e321aec282",
    "name": "Lat Pulldown",
    "variations": ["cable", "rope", "single-arm", "kneeling", "wide-grip", "close-grip", "neutral-grip", "overhand-grip", "underhand-grip", "bar"],
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
    "variations": ["barbell", "dumbbell", "cable", "band", "single-arm", "behind-the-back"],
    "primaryMuscles": ["forearm - inner"],
    "secondaryMuscles": []
  }
]''';
