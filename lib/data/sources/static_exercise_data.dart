const String staticExerciseJson = r'''[
  {
    "pk": "1232d6bd-1b97-4c14-b8e6-de4a40cae8db",
    "name": "Pull-Up",
    "slug": "pull-up",
    "primaryMuscles": ["lat"],
    "secondaryMuscles": [
      "bicep",
      "forearm - inner",
      "rotator cuff - back",
      "shoulder - back"
    ],
    "steps": [
      "Begin by finding a sturdy horizontal bar high enough off the ground that you can hang from it with your feet off the floor.",
      "Stand underneath the bar and jump up, grabbing onto the bar with an overhand grip (palms facing away from you) and your hands slightly wider than shoulder-width apart. Your arms should be fully extended.",
      "Engage your core and retract your shoulder blades as you pull your body up towards the bar. Keep your elbows pointed downwards and your head in a neutral position.",
      "Continue pulling your body up until your chin is above the bar. Keep your core tight and your shoulders engaged throughout the movement.",
      "Pause briefly at the top of the movement, then slowly lower yourself back down to the starting position with control. Make sure to maintain a controlled descent and avoid letting your body swing or drop.",
      "Repeat the movement for your desired number of repetitions."
    ],
    "notes": "Try assisted variations using resistance bands or an assisted pull-up machine until you build the necessary strength."
  },
  {
    "pk": "dc033c10-988c-4558-bf74-3ab5be6c59fc",
    "name": "Squat \u2013 Barbell",
    "slug": "squat-barbell",
    "primaryMuscles": ["glute", "lower back", "quad", "thigh - inner"],
    "secondaryMuscles": ["calf"],
    "steps": [
      "Begin by standing with your feet shoulder-width apart and your toes pointing forward. Hold a barbell behind your neck, resting it on your shoulders with your elbows pointing down and your palms facing forward.",
      "Engage your core and keep your chest lifted as you bend your knees and lower your hips back and down as if sitting in a chair. Make sure to keep your weight on your heels and your knees tracking in line with your toes.",
      "As you descend into the squat, inhale and maintain proper form. Lean forward so that your chest is over your thighs. Keep your back straight and your core engaged. Lower your body until your thighs parallel the ground, and your hips should align with your knees.",
      "Pause briefly at the bottom of the movement, then exhale and push through your heels to stand back up to the starting position. Keep your core engaged and your chest lifted until you're fully standing.",
      "Repeat the movement for your desired number of repetitions.",
      "Place the barbell on the rack after you've finished your set."
    ],
    "notes": ""
  },
  {
    "pk": "7a971512-0265-490a-8ac0-871c0e1013de",
    "name": "Push-Up",
    "slug": "push-up",
    "primaryMuscles": ["chest", "shoulder - front", "tricep"],
    "secondaryMuscles": ["abdominal"],
    "steps": [
      "Start in a plank position, with your hands shoulder-width apart and your fingers pointing forward.",
      "Keep your core engaged, your back straight, and your hips in line with your shoulders.",
      "Lower your body towards the ground by bending your elbows, keeping your upper arms close to your sides.",
      "Keep your elbows at a 45-degree angle to your body, and continue lowering until your chest touches the ground.",
      "Push back up to the starting position by straightening your arms, keeping your core engaged and your body in a straight line throughout the movement.",
      "Repeat"
    ],
    "notes": ""
  },
  {
    "pk": "335f9629-c7c2-4cc2-a7e2-d3e2866790f0",
    "name": "Romanian Deadlift \u2013 Barbell",
    "slug": "romanian-deadlift-barbell",
    "primaryMuscles": ["glute", "hamstring", "lower back"],
    "secondaryMuscles": ["calf", "trap", "quad"],
    "steps": [
      "Preferably, start with a loaded barbell at hip height on a squat rack. Alternatively, you can lift the barbell from the floor to the starting position.",
      "Stand with your feet hip-width apart, and grip the barbell with hands just outside your thighs using an overhand grip.",
      "Begin the movement with a slight bend in your knees, and keep your back straight and chest up throughout the exercise.",
      "Push your hips back, hinging at the hips to lower the barbell, while keeping it close to your body as the bar descends.",
      "Lower the weight to just below your knees or to mid-shin level \u2014 the exact point depends on your hamstring flexibility, without rounding your back.",
      "Pause briefly at the bottom of the movement, maintaining a braced core and tension in your hamstrings and glutes.",
      "Reverse the motion by driving your hips forward to return to a fully upright position, squeezing your glutes at the top of the movement.",
      "Repeat for the desired number of repetitions, ensuring that the tension is maintained in the target muscles without resting the bar on the floor between reps."
    ],
    "notes": "Differences between a RDL and a standard deadlift:<ul><li>Keep your legs relatively straight with only a slight bend in your knees.</li><li>Focus on the eccentric phase while hinging at the hips and lowering the weight.</li><li>Lower the bar just below the knees or to mid-shin level without touching the ground to maintain tension on the hamstrings and glutes throughout the exercise.</li></ul>"
  },
  {
    "pk": "6556cc6a-40c4-4474-8424-f48794f57438",
    "name": "Romanian Deadlift \u2013 Dumbbell",
    "slug": "romanian-deadlift-dumbbell",
    "primaryMuscles": ["glute", "hamstring", "lower back"],
    "secondaryMuscles": ["calf", "trap", "quad"],
    "steps": [
      "Stand with your feet hip-width apart, holding a dumbbell in each hand with palms facing your body.",
      "Begin with a slight bend in your knees, keep your back straight, chest up, and shoulders back throughout the exercise.",
      "Push your hips back and hinge at the hips to lower the dumbbells along the front of your legs, maintaining a neutral spine.",
      "Lower the dumbbells to just below your knees or to mid-shin level, depending on your flexibility, while keeping the weights close to your legs.",
      "Pause briefly at the bottom of the movement, ensuring your core is braced and your hamstrings and glutes are engaged.",
      "Thrust your hips forward to lift your torso back to the starting position, simultaneously contracting your glutes at the top of the movement.",
      "Repeat the movement for the desired number of repetitions without letting the dumbbells touch the floor between reps to keep tension on the muscles."
    ],
    "notes": "Differences between a RDL and a standard deadlift:<ul><li>Keep your legs relatively straight with only a slight bend in your knees.</li><li>Focus on the eccentric phase while hinging at the hips and lowering the weight.</li><li>Lower the bar just below the knees or to mid-shin level without touching the ground to maintain tension on the hamstrings and glutes throughout the exercise.</li></ul>"
  },
  {
    "pk": "703d017a-492a-417d-9ff5-5f78f7d29d7a",
    "name": "Single-Leg Romanian Deadlift \u2013 Dumbbell",
    "slug": "single-leg-romanian-deadlift-dumbbell",
    "primaryMuscles": ["calf", "glute", "hamstring", "lower back"],
    "secondaryMuscles": ["trap", "quad"],
    "steps": [
      "Begin by standing on one leg, with a slight bend in the knee. Keep your other leg off the ground and behind you.",
      "Hold a dumbbell or kettlebell in the opposite hand of the leg you are standing on.",
      "Brace your core, keep your chest up, and slowly hinge forward at the hips, keeping your back straight and your shoulders down. As you hinge, lift your non-standing leg behind you, keeping it in line with your torso.",
      "Continue lowering the weight until you feel a stretch in your hamstring. Your standing knee should be slightly bent but not locked.",
      "Pause briefly at the bottom of the movement, then slowly reverse the motion by driving your hips forward and standing up tall while bringing your lifted leg back down to the ground.",
      "Repeat for the desired number of repetitions on one leg before switching to the other."
    ],
    "notes": ""
  },
  {
    "pk": "d74842c0-577f-4dca-ac4d-6bb52aa6976b",
    "name": "Squat \u2013 Bodyweight",
    "slug": "squat-bodyweight",
    "primaryMuscles": ["glute", "quad", "thigh - inner"],
    "secondaryMuscles": ["calf"],
    "steps": [
      "Stand with your feet shoulder-width apart and point your toes slightly outward.",
      "Keep your chest up, shoulders back, and core engaged.",
      "Lower your body by bending your knees and pushing your hips back as if you were sitting in a chair.",
      "Keep your weight on your heels and your knees behind your toes.",
      "Lower yourself until your thighs are parallel to the ground or as low as you can comfortably go while maintaining good form.",
      "Pause briefly at the bottom of the squat.",
      "Push through your heels to stand back up, driving your hips forward as you do.",
      "Stand up straight and repeat."
    ],
    "notes": ""
  },
  {
    "pk": "6bc882f1-29e7-44c0-99b4-a36a4c91fc08",
    "name": "Face Pull",
    "slug": "face-pull",
    "primaryMuscles": ["rotator cuff - back", "trap", "shoulder - back"],
    "secondaryMuscles": ["shoulder - side", "forearm - outer"],
    "steps": [
      "Start by attaching a single long rope or two shorter ropes to a eye-level pulley on a cable machine.",
      "Grasp the rope or cable with both hands using an overhand grip, with your palms facing each other. You want your thumbs to be able to point backwards, guiding the movement.",
      "Step back a few feet from the cable machine, so there is tension in the rope or cable.",
      "Stand with your feet shoulder-width apart, and engage your core muscles to maintain good posture throughout the exercise. This is your starting position.",
      "Pull the handles towards your face, separating your hands and arms as they go back.",
      "Keep your elbows high and out to the sides as you pull the rope backwards. End the pull with each arm at a 90-degree angle at the elbow.",
      "Hold the position for a second, then slowly lower the rope back to the starting position.",
      "Repeat for the desired number of repetitions."
    ],
    "notes": "Focus on using your back muscles to perform the movement rather than relying on your arms or shoulders."
  },
  {
    "pk": "23cf1e36-69e0-424b-8403-fc4e30de15da",
    "name": "Bench Press \u2013 Barbell",
    "slug": "bench-press-barbell",
    "primaryMuscles": ["chest", "shoulder - front"],
    "secondaryMuscles": ["tricep"],
    "steps": [
      "Lie on a flat bench with your feet firmly planted on the ground.",
      "Grip the barbell with your hands slightly wider than shoulder-width apart, with your palms facing away from your body.",
      "Lift the bar off the rack and hold it directly above your chest with extended arms.",
      "Slowly lower the bar down to your chest, keeping your elbows close to your body.",
      "Pause briefly when the bar touches your chest.",
      "Push the bar back up to the starting position by extending your arms.",
      "Repeat."
    ],
    "notes": "Ensure your back is flat against the bench, and your feet are firmly planted on the ground.  Keep your core tight, and your elbows close to your body throughout the movement. Exhale as you push the bar away from your chest, and inhale as you lower it down."
  },
  {
    "pk": "6849d9f8-8f62-4873-aed0-e85a4b0fa8ca",
    "name": "Squat \u2013 Dumbbell",
    "slug": "squat-dumbbell",
    "primaryMuscles": ["glute", "lower back", "quad", "thigh - inner"],
    "secondaryMuscles": ["calf"],
    "steps": [
      "Stand with your feet shoulder-width apart, with your toes pointing slightly outward.",
      "Hold a dumbbell in each hand by your sides, with your palms facing inward.",
      "Engage your core and keep your chest lifted throughout the movement.",
      "Lower your body by bending at the hips and knees as if sitting on a chair.",
      "Keep your weight in your heels, and make sure your knees are tracking over your toes.",
      "Lower your body until your thighs are parallel to the ground or until you reach your desired depth.",
      "Push through your heels to stand back up to the starting position.",
      "Repeat."
    ],
    "notes": "Keep your knees in line with your toes throughout the movement."
  },
  {
    "pk": "ba2387cd-2192-42d5-8895-4c8ad78b3607",
    "name": "Deadlift \u2013 Barbell",
    "slug": "deadlift-barbell",
    "primaryMuscles": ["glute", "hamstring", "lower back"],
    "secondaryMuscles": [
      "calf",
      "forearm - inner",
      "forearm - outer",
      "trap",
      "quad"
    ],
    "steps": [
      "Stand with your feet roughly hip-width apart, with the barbell positioned over the middle of your feet.",
      "Bend at your hips and knees to reach down and grasp the barbell with both hands, slightly wider than shoulder-width apart, palms facing towards your body.",
      "With a flat back, engage your core, flatten your shoulder blades and look ahead to keep your neck in a neutral position.",
      "Stand up with the weight by pushing through your heels, keeping the bar close to your body, and driving your hips forward.",
      "Straighten your legs and hips to come to a full standing position, with the barbell hanging in front of your thighs. Do not lean back at the top.",
      "Pause briefly at the top of the lift while maintaining a tight core, and take a breath if needed.",
      "Lower the barbell back to the ground by hinging at the hips and bending the knees, keeping the bar close to your body and your back straight.",
      "Place the barbell back on the ground and return to the starting position, ready to perform the next repetition."
    ],
    "notes": ""
  },
  {
    "pk": "60576989-d045-492b-82b0-743bb4a3ce62",
    "name": "Plank",
    "slug": "plank",
    "primaryMuscles": ["abdominal", "lower back"],
    "secondaryMuscles": ["oblique", "shoulder - front"],
    "steps": [],
    "notes": ""
  },
  {
    "pk": "859b2211-9bb0-462b-987c-620a3e37d688",
    "name": "Leg Press \u2013 Machine",
    "slug": "leg-press-machine",
    "primaryMuscles": ["glute", "quad", "thigh - inner"],
    "secondaryMuscles": ["hamstring"],
    "steps": [
      "Adjust the seat of the leg press machine so that your knees are at a ~90-degree angle when your feet are on the footplate.",
      "Sit on the machine and place your feet shoulder-width apart on the footplate.",
      "Push the footplate away from your body by extending your legs.",
      "Lower the footplate back towards your body by bending your legs and keeping your feet flat on the plate.",
      "Repeat."
    ],
    "notes": "Keep your back flat against the seat throughout the movement. Keep your feet flat on the footplate, and make sure your knees are tracking in line with your toes. Exhale as you push the footplate away from your body, and inhale as you lower it back down. Avoid locking out your knees at the top of the movement, as this can put unnecessary stress on the joint."
  },
  {
    "pk": "2b9085c4-ad46-466b-acc9-f863a93dbaa9",
    "name": "One-Handed Cross-Body Curl",
    "slug": "one-handed-cross-body-curl",
    "primaryMuscles": ["bicep"],
    "secondaryMuscles": ["forearm - inner"],
    "steps": [
      "Stand up, leaning slightly forward from a straight position, feet shoulder-width apart, and your knees slightly bent.",
      "Hold a dumbbell in each hand, with your palms facing your body and arms fully extended at your sides. This is your starting position.",
      "Keeping your elbows close to your body, slowly curl one dumbbell up toward your opposite shoulder, across your body.",
      "Continue curling until the weight comes close to the activating bicep's shoulder. Squeeze your bicep before slowly lowering the weight to the starting position.",
      "Repeat the curl on the opposite side.",
      "Continue alternating curls on each side for the desired number of repetitions."
    ],
    "notes": ""
  },
  {
    "pk": "8a96a73c-0c69-4102-a2c9-f103c8497e7e",
    "name": "Frog Pumps",
    "slug": "frog-pumps",
    "primaryMuscles": ["glute"],
    "secondaryMuscles": ["hamstring", "thigh - inner"],
    "steps": [
      "Lie on your back with your knees bent and your feet flat on the ground. Keep your feet close together and your heels touching.",
      "Bring your feet up towards your hips along the ground until they're about 6 inches apart, and then let your knees fall out to the sides so that your feet are touching each other. This is the starting position.",
      "Engage your glutes and lift your hips up towards the ceiling as high as you can, making sure to keep your feet and knees in the same position.",
      "Hold the top position for 1-2 seconds, then slowly lower your hips to the starting position.",
      "Repeat."
    ],
    "notes": "Place a dumbbell or plate on your lower abdomen for extra difficulty."
  },
  {
    "pk": "37115036-6477-4046-96dc-5c48d077a201",
    "name": "Lying Windshield Wiper",
    "slug": "lying-windshield-wiper",
    "primaryMuscles": ["oblique"],
    "secondaryMuscles": ["abdominal"],
    "steps": [
      "Lie flat on your back with your arms extended out to the sides, palms down, and your legs extended straight up towards the ceiling.",
      "Keep your feet together and engage your core muscles by drawing your navel towards your spine.",
      "Lower your legs to one side, keeping them straight and close to the floor without touching it.",
      "Pause briefly and then lift your legs up to the starting position.",
      "Repeat the movement, this time lowering your legs to the opposite side.",
      "Continue alternating sides for the desired number of reps or time."
    ],
    "notes": "Avoid swinging or using momentum to perform the movement; instead, control the action with your core muscles."
  },
  {
    "pk": "102850fa-8459-4cd0-81b5-88cc982d5de4",
    "name": "Dip \u2013 Bar",
    "slug": "dip-bar",
    "primaryMuscles": ["chest", "tricep"],
    "secondaryMuscles": ["rotator cuff - front", "shoulder - front"],
    "steps": [
      "Start by approaching a set of parallel bars or dip bars approximately shoulder-width apart. Grab each bar with an overhand grip and hoist yourself up so your arms are fully extended, and your feet are off the ground.",
      "Slightly lean forward and keep your elbows slightly bent to engage your chest, shoulders, and triceps muscles.",
      "Lower your body by bending your elbows and leaning forward while keeping your back straight and your legs behind you. Keep your elbows close to your body throughout the entire exercise.",
      "Continue lowering yourself until your arms are parallel to the ground, or slightly below parallel, while inhaling.",
      "Push back up by straightening your arms while exhaling. Be sure to push with your triceps, chest, and shoulder muscles to return to your starting position.",
      "Repeat."
    ],
    "notes": "You can also add variations to the dip, such as weighted dips or assisted dips, to increase or decrease the intensity of the exercise."
  },
  {
    "pk": "3bc232a6-36f1-4322-948c-61c0df58cb15",
    "name": "Arnold Press",
    "slug": "arnold-press",
    "primaryMuscles": ["shoulder - back", "shoulder - side"],
    "secondaryMuscles": [],
    "steps": [
      "Hold a dumbbell in each hand and sit or stand with your feet shoulder-width apart.",
      "Start with your arms bent so that your palms face your body and the dumbbells are at shoulder height.",
      "As you press the dumbbells overhead, rotate your palms to face forward.",
      "Continue to press the dumbbells overhead until your arms are fully extended.",
      "Lower the dumbbells back down to the starting position, rotating your palms back to face your body as you do so.",
      "Repeat."
    ],
    "notes": ""
  },
  {
    "pk": "328b8330-4a04-4f43-a255-f17cba659635",
    "name": "Back Extension",
    "slug": "back-extension",
    "primaryMuscles": ["glute", "hamstring", "lower back"],
    "secondaryMuscles": ["abdominal"],
    "steps": [
      "Adjust the back extension bench so that the pads at the thigh are snug against your thighs and your feet are securely held in place by the footpads.",
      "Cross your arms over your chest or hold them behind your head.",
      "Keep your back straight and your neck in a neutral position. Hang your body forward over the thigh pads. This is the starting position.",
      "Engage your lower back muscles and slowly lift your upper body off the bench until it aligns with your legs.",
      "Hold this position for up to a few seconds, squeezing your glutes and lower back muscles at the top of the movement.",
      "Slowly lower your upper body back down to the starting position.",
      "Repeat."
    ],
    "notes": "Hold weights such as plates to your chest to increase the exercise difficulty."
  },
  {
    "pk": "ab0da03b-dd54-4a7f-bb06-40c866dfa88c",
    "name": "One-Legged Glute Bridge",
    "slug": "one-legged-glute-bridge",
    "primaryMuscles": ["glute", "hamstring"],
    "secondaryMuscles": ["thigh - inner"],
    "steps": [
      "Start by lying on your back with your knees bent and feet flat on the ground.",
      "Lift your right leg off the ground and extend it straight up towards the ceiling.",
      "Press your left foot into the ground and lift your hips up towards the ceiling.",
      "Pause at the top of the movement and squeeze your glutes.",
      "Lower your hips back down to the ground and repeat for the desired number of reps.",
      "Switch legs and repeat the exercise on the other side."
    ],
    "notes": "For increased difficult, hold your leg parallel with your torso instead of extending your leg to the ceiling."
  },
  {
    "pk": "23a7be0e-9a15-4c72-a635-697d0bc3d261",
    "name": "Curl \u2013 Bodyweight",
    "slug": "curl-bodyweight",
    "primaryMuscles": ["bicep", "lat"],
    "secondaryMuscles": ["forearm - inner"],
    "steps": [
      "Adjust the height of the rings or TRX to waist height and stand facing them.",
      "Hold the rings or TRX handles with an underhand grip and lean back, extending your arms straight in front of you.",
      "Keep your feet shoulder-width apart and your body in a straight line from head to heels.",
      "Engage your biceps and bend your elbows, pulling your body up towards the rings or TRX handles.",
      "As you pull your body up, keep your elbows close to your body and your wrists straight.",
      "When your hands reach your chest, pause for a moment and then slowly lower your body back down to the starting position.",
      "Repeat the exercise for the desired number of reps."
    ],
    "notes": ""
  },
  {
    "pk": "cbbdaae8-7600-456f-b025-12d2050b3765",
    "name": "Hanging Leg Raise",
    "slug": "hanging-leg-raise",
    "primaryMuscles": ["abdominal", "forearm - inner", "forearm - outer"],
    "secondaryMuscles": ["oblique"],
    "steps": [
      "Start by securing your grip on a pull-up bar, ensuring your hands are spaced shoulder-width apart.",
      "Allow your body to hang straight down from the bar with your feet together. This is your starting position.",
      "Engage your core and slowly raise your legs in front of you while keeping them straight.",
      "Raise your legs until they are parallel to the ground, or higher if your flexibility and strength allows.",
      "Pause briefly at the top of the movement, keeping your core tight to stabilize your body.",
      "Slowly lower your legs back to the starting position in a controlled manner.",
      "Repeat the movement for the desired number of repetitions."
    ],
    "notes": "There are hanging leg raise machines that allow you to balance on your forearms rather than hang from a bar. Also, you could perform this exercise by holding yourself up on dip bars. Consider using either machine if you want to remove most of the forearm activation and focus on the abdominal work."
  },
  {
    "pk": "7e703b05-364f-4847-af0f-a1a22aab19f6",
    "name": "Burpee \u2013 BOSU",
    "slug": "burpee-bosu",
    "primaryMuscles": [
      "chest",
      "glute",
      "quad",
      "shoulder - front",
      "shoulder - side"
    ],
    "secondaryMuscles": ["abdominal", "trap"],
    "steps": [
      "Start in a standing position with the BOSU ball on the ground (inflated-side down) in front of you.",
      "Grip the edges of the BOSU ball and jump your feet back into a plank position.",
      "Perform a push-up while gripping the BOSU ball.",
      "Jump your feet back towards the BOSU ball into a low squat position.",
      "Complete the squat by standing up. As you rise, lift the BOSU ball overhead, extending your arms towards the ceiling.",
      "Repeat the exercise for desired number of reps."
    ],
    "notes": ""
  },
  {
    "pk": "f954e30f-cb89-488b-99da-4358244fd815",
    "name": "Shoulder Press \u2013 Machine",
    "slug": "shoulder-press-machine",
    "primaryMuscles": ["shoulder - front"],
    "secondaryMuscles": ["shoulder - side", "tricep"],
    "steps": [
      "Adjust the seat height so that the handles are at shoulder level.",
      "Sit on the machine with your back against the pad and your feet flat on the floor.",
      "Grasp the handles with an overhand grip and push them upward until your arms are fully extended.",
      "Slowly lower the handles back down to shoulder level, keeping your elbows slightly bent.",
      "Repeat for desired number of repetitions."
    ],
    "notes": ""
  },
  {
    "pk": "47d61f40-0743-47af-95a5-545a6a9a4824",
    "name": "Leg Extension",
    "slug": "leg-extension",
    "primaryMuscles": ["quad"],
    "secondaryMuscles": [],
    "steps": [
      "Adjust the machine to fit your body and select the appropriate weight.",
      "Sit on the machine with your back against the backrest and your feet or ankle flat against the supporting pad.",
      "Grasp the handles on the side of the machine for stability.",
      "Extend your legs out in front of you until they are parallel to the floor, keeping your feet flexed and your knees slightly bent.",
      "Hold for a moment, then slowly lower the weight back down to the starting position.",
      "Repeat."
    ],
    "notes": ""
  },
  {
    "pk": "e6e1ebd0-65dc-45cf-86e9-a79a28721fe3",
    "name": "Close-Grip Feet-Up Bench Press \u2013 Barbell",
    "slug": "close-grip-feet-up-bench-press-barbell",
    "primaryMuscles": ["tricep"],
    "secondaryMuscles": ["chest", "shoulder - front"],
    "steps": [
      "Lie flat on a bench with your feet up and your back pressed against the bench.",
      "Grasp the barbell with your hands shoulder-width apart or just slightly narrower.",
      "Unrack the barbell and hold it above your chest with your arms extended.",
      "Lower the barbell to your chest, keeping your elbows close to your body.",
      "Pause briefly at the bottom of the movement, then press the barbell back up to the starting position.",
      "Repeat."
    ],
    "notes": ""
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
    ],
    "steps": [
      "Stand with your feet shoulder-width apart and your knees slightly bent.",
      "Hold a barbell with an overhand grip, hands shoulder-width apart.",
      "Lean forward at the hips, keeping your back straight and your abs engaged.",
      "Bring the barbell up towards your upper chest, keeping your elbows wide and out to the sides.",
      "Squeeze your shoulder blades together at the top of the movement.",
      "Lower the barbell back down to the starting position.",
      "Repeat."
    ],
    "notes": ""
  },
  {
    "pk": "7e95b8b5-a6eb-41b6-a3c9-ae06a9ba7ac4",
    "name": "Hip Abduction \u2013 Machine",
    "slug": "hip-abduction-machine",
    "primaryMuscles": ["thigh - outer"],
    "secondaryMuscles": ["glute"],
    "steps": [
      "Adjust the machine to fit your height and leg length.",
      "Sit on the machine with your back against the backrest and your feet on the footrests.",
      "Press your legs outward against the resistance of the machine.",
      "With your knees at their farthest point, hold the weight for a moment before slowly releasing the resistance and returning to the starting position.",
      "Repeat."
    ],
    "notes": ""
  },
  {
    "pk": "80582f01-1e34-4f03-ba2f-1964d8e33de3",
    "name": "Cable Curl \u2013 Rope",
    "slug": "cable-curl-rope",
    "primaryMuscles": ["bicep"],
    "secondaryMuscles": ["forearm - inner"],
    "steps": [
      "Attach a rope to a low pulley cable machine.",
      "Stand facing the machine with feet shoulder-width apart and knees slightly bent.",
      "Grasp the rope with an underhand grip, palms facing each other.",
      "Keep elbows close to your sides and curl the rope towards your shoulders.",
      "Pause briefly at the top of the movement, then slowly lower the rope back to the starting position.",
      "Repeat."
    ],
    "notes": ""
  },
  {
    "pk": "a06410b6-c871-45c0-aee5-db6df750f494",
    "name": "Plank - BOSU",
    "slug": "plank-bosu",
    "primaryMuscles": ["abdominal", "lower back"],
    "secondaryMuscles": ["oblique", "shoulder - front"],
    "steps": [
      "Place a BOSU ball on the ground with the flat side facing up.",
      "Assume a plank position with your forearms on the BOSU ball and your toes on the ground.",
      "Engage your core and keep your body in a straight line from head to heels.",
      "Hold the position for the desired amount of time.",
      "Release the position by lowering your knees to the ground."
    ],
    "notes": "Instead of placing your forearms on the flat side of the BOSU, you can grab the edges with both hands and plank from a straight-armed position."
  },
  {
    "pk": "dee8ca71-a01b-4ffd-b85e-426080e92f1e",
    "name": "Glute Kickback \u2013 Machine",
    "slug": "glute-kickback-machine",
    "primaryMuscles": ["glute"],
    "secondaryMuscles": ["hamstring", "thigh - inner"],
    "steps": [
      "Adjust the machine to fit your body height",
      "Position yourself in the machine with your hands on the handles and one ankle on the padding.",
      "Keeping your core engaged, exhale and extend your leg back as far as possible while squeezing your glutes.",
      "Inhale and slowly return your leg to the starting position.",
      "Repeat."
    ],
    "notes": ""
  },
  {
    "pk": "55639d34-075c-4183-9976-b08f8bfc3f0c",
    "name": "Pause Squat \u2013 Barbell",
    "slug": "pause-squat-barbell",
    "primaryMuscles": ["glute", "lower back", "quad", "thigh - inner"],
    "secondaryMuscles": ["calf"],
    "steps": [
      "Start with your feet shoulder-width apart, your toes pointing slightly outward, and the barbell on your shoulders.",
      "Lower your body into a squat position, keeping your back straight and your knees tracking with your toes.",
      "Pause at the bottom of the squat for 2-3 seconds.",
      "Slowly rise back up to the starting position.",
      "Repeat."
    ],
    "notes": ""
  },
  {
    "pk": "dce6d67f-877e-4595-9277-3a3f0f19dc46",
    "name": "Walking Lunge \u2013 Barbell",
    "slug": "walking-lunge-barbell",
    "primaryMuscles": ["glute", "quad", "thigh - inner"],
    "secondaryMuscles": ["calf"],
    "steps": [
      "Start with your feet hip-width apart and the barbell on your shoulders.",
      "Take a large step forward with your right foot, lowering your body until your right thigh is parallel to the ground and your left knee is hovering just above the floor.",
      "Push through your right heel to stand back up, bringing your left foot forward to meet your right foot.",
      "Repeat the lunge on the other side by stepping forward with your left foot.",
      "Continue alternating lunges for the desired number of reps or distance."
    ],
    "notes": ""
  },
  {
    "pk": "ed36669e-3f5c-411d-8eab-8fb757a21e93",
    "name": "Rotational Throw \u2013 Medicine Ball",
    "slug": "rotational-throw-medicine-ball",
    "primaryMuscles": ["oblique"],
    "secondaryMuscles": ["abdominal", "shoulder - front"],
    "steps": [
      "Start by standing about arms-length away from the wall with your feet shoulder-width apart.",
      "Hold a medicine ball with both hands at chest height.",
      "Rotating your core and upper body towards the wall, explosively throw the ball against the wall.",
      "Catch the ball as it rebounds off the wall and rotate your body away from the wall.",
      "Repeat for the desired number of reps and then switch sides."
    ],
    "notes": ""
  },
  {
    "pk": "a40205d6-396c-4c0b-a4b9-8ffbef49ed32",
    "name": "Row \u2013 T-Bar",
    "slug": "row-t-bar",
    "primaryMuscles": ["lat", "shoulder - back", "trap"],
    "secondaryMuscles": [
      "bicep",
      "forearm - inner",
      "lower back",
      "rotator cuff - back",
      "rotator cuff - front"
    ],
    "steps": [
      "Load the desired weight onto the T-Bar machine.",
      "Lie down on the T-Bar machine with your feet securely planted.",
      "Grasp the handles of the T-Bar with an overhand grip.",
      "Pull the T-Bar towards your chest, keeping your elbows close to your body.",
      "Pause briefly at the top of the movement, squeezing your shoulder blades together.",
      "Slowly lower the T-Bar back to the starting position.",
      "Repeat."
    ],
    "notes": ""
  },
  {
    "pk": "64c75731-36c2-45ae-b8c1-c8b481f34144",
    "name": "Shoulder Press \u2013 Dumbbell",
    "slug": "standing-shoulder-press-dumbbell",
    "primaryMuscles": ["shoulder - front"],
    "secondaryMuscles": ["shoulder - side", "tricep"],
    "steps": [
      "Start by standing with your feet shoulder-width apart, holding a dumbbell in each hand by your thighs.",
      "Raise the dumbbells to shoulder height, palms facing forward, and elbows bent.",
      "Press the dumbbells upward until your arms are fully extended above your head.",
      "Pause for a moment at the top of the movement, then slowly lower the dumbbells back down to shoulder height.",
      "Repeat."
    ],
    "notes": ""
  },
  {
    "pk": "91ee79b7-397d-4b90-8988-9a41bff9d639",
    "name": "Upright Row \u2013 Barbell",
    "slug": "upright-row-barbell",
    "primaryMuscles": ["shoulder - side"],
    "secondaryMuscles": ["bicep", "shoulder - front", "trap"],
    "steps": [
      "Stand with your feet shoulder-width apart and your knees slightly bent.",
      "Grasp the barbell with an overhand grip, hands narrower than shoulder-width apart.",
      "Hold the barbell in front of your thighs with your arms extended.",
      "Exhale and lift the barbell straight up towards your chin, keeping it close to your body.",
      "Pause for a moment at the top of the movement, then inhale and slowly lower the barbell back down to the starting position.",
      "Repeat."
    ],
    "notes": ""
  },
  {
    "pk": "e8dc87a4-79e1-4114-90a4-418a4b67359f",
    "name": "Rear Delt Row \u2013 Dumbbell",
    "slug": "rear-delt-row-dumbbell",
    "primaryMuscles": ["shoulder - back", "trap"],
    "secondaryMuscles": [
      "forearm - inner",
      "rotator cuff - back",
      "shoulder - side",
      "lat"
    ],
    "steps": [
      "Stand up straight holding a dumbbell in each hand with an overhand grip, palms facing your thighs.",
      "Hinge forward at the hips with a slight bend in the knees, keeping your back straight and nearly parallel to the floor.",
      "Let the dumbbells hang directly in front of you with your arms fully extended. This is the starting position.",
      "Keep your eyes looking slightly ahead to maintain neck alignment with your spine.",
      "Exhale as you pull the dumbbells towards your upper chest, keeping your elbows flared out. Imagine you are squeezing your shoulder blades together.",
      "Hold the contraction for a second when the dumbbells reach the peak position when your upper arm is just beyond horizontal.",
      "Inhale as you slowly lower the dumbbells back to the starting position in a controlled manner.",
      "Repeat the movement for the desired number of repetitions."
    ],
    "notes": ""
  },
  {
    "pk": "c5116ba3-8a9d-4318-80e5-678a927cf916",
    "name": "Floor Press \u2013 Dumbbell",
    "slug": "floor-press-dumbbell",
    "primaryMuscles": ["chest", "shoulder - front"],
    "secondaryMuscles": ["tricep"],
    "steps": [
      "Lie flat on your back on the floor with your knees bent and feet flat on the ground.",
      "Hold a dumbbell in each hand with your palms facing towards your feet.",
      "Extend your arms straight up towards the ceiling, with your elbows slightly bent.",
      "Slowly lower the dumbbells down towards your chest, keeping your elbows close to your body.",
      "Pause when your upper arms touch the ground.",
      "Repeat."
    ],
    "notes": ""
  },
  {
    "pk": "90d7e253-d5c6-4683-bb18-6c12a4fccef9",
    "name": "Incline Curl \u2013 Dumbbell",
    "slug": "incline-curl-dumbbell",
    "primaryMuscles": ["bicep"],
    "secondaryMuscles": ["forearm - inner"],
    "steps": [
      "Adjust the bench to a 45-degree angle.",
      "Grab a pair of dumbbells and sit on the bench with your back straight.",
      "Let your arms hang down by your sides with your palms facing forward.",
      "Slowly curl the dumbbells up towards your shoulders while keeping your elbows close to your body.",
      "Pause for a moment at the top of the movement, then slowly lower the dumbbells back down to the starting position.",
      "Repeat."
    ],
    "notes": ""
  },
  {
    "pk": "ea48a790-a04d-49a0-b149-a327908d2420",
    "name": "Eccentric Heel Drop",
    "slug": "eccentric-heel-drop",
    "primaryMuscles": ["calf"],
    "secondaryMuscles": [],
    "steps": [
      "Stand on a raised platform or step with the balls of your feet on the edge and your heels hanging off.",
      "Raise your heels up as high as possible with both feet.",
      "Shift your weight onto one leg and slowly lower your heel down below the platform, only using the single leg.",
      "Use both feet to push yourself back up to the raised position.",
      "Switch your weight to the other foot and lower yourself down single-legged.",
      "Continue alternating sides for the desired number of repetitions."
    ],
    "notes": ""
  },
  {
    "pk": "224efa9a-0e81-47e5-af0b-8ba0100f0a8e",
    "name": "Squat \u2013 Belt",
    "slug": "squat-belt",
    "primaryMuscles": ["glute", "quad", "thigh - inner"],
    "secondaryMuscles": ["calf"],
    "steps": [
      "Add your desired weight to the machine.",
      "Attach a belt or harness around your waist.",
      "Attach a cable or chain to the belt or harness.",
      "Stand on a platform or box with feet shoulder-width apart.",
      "Hold onto a stable object for balance.",
      "Squat by bending the knees and hips while keeping the back straight.",
      "Pause at the bottom of the squat and then push up through the legs to return to the starting position.",
      "Repeat."
    ],
    "notes": ""
  },
  {
    "pk": "8431323c-ca05-4424-9e2f-995e85f4f9e3",
    "name": "Hang Power Clean",
    "slug": "hang-power-clean",
    "primaryMuscles": ["glute", "lower back"],
    "secondaryMuscles": [
      "forearm - outer",
      "hamstring",
      "thigh - inner",
      "trap"
    ],
    "steps": [
      "Stand with feet shoulder-width apart, gripping a barbell at thigh level with palms facing you. This is your starting position.",
      "Bend your knees slightly and hinge at the waist to bring the barbell just above knee level.",
      "Keep your back straight and core tight.",
      "Explosively extend your hips and knees. At the same time, shrug your shoulders and pull the barbell up along your body.",
      "As the barbell reaches chest height, rotate your wrists under the bar and push your body slightly under it.",
      "Catch the bar on the front part of your shoulders with a slight bend in your knees (higher than a full squat).",
      "Stand up fully with the barbell in the front rack position.",
      "Lower the bar back to the starting position.",
      "Repeat for the desired number of repetitions."
    ],
    "notes": ""
  },
  {
    "pk": "e4ada608-1354-43e6-99cb-c7af0c76edde",
    "name": "V-Up",
    "slug": "v-up",
    "primaryMuscles": ["abdominal"],
    "secondaryMuscles": [],
    "steps": [
      "Start by lying on your back with your arms extended above your head and your legs straight out in front of you.",
      "Engage your core muscles and lift your legs up to a 45-degree angle while simultaneously lifting your upper body off the ground.",
      "Reach your arms forward and try to touch your toes with your fingertips.",
      "Hold the position long enough to flex your abdominal muscles, then slowly lower your body back down to the starting position.",
      "Repeat."
    ],
    "notes": ""
  },
  {
    "pk": "288eae8d-af58-42db-9f10-16b599e11876",
    "name": "Hack Squat \u2013 Barbell",
    "slug": "hack-squat-barbell",
    "primaryMuscles": ["quad"],
    "secondaryMuscles": [
      "calf",
      "forearm - inner",
      "glute",
      "lower back",
      "thigh - inner",
      "trap"
    ],
    "steps": [
      "Stand in front of the barbell with your feet shoulder-width apart. The barbell will be by the back of your calves.",
      "Bend down and grip the barbell with an overhand grip, with your palms facing behind you.",
      "Stand up straight, lifting the barbell off the ground and holding it behind your legs.",
      "Keeping your back straight, lower your body by bending your knees and hips, as if you were sitting down on a chair, until your thighs are parallel to the ground.",
      "Push through your heels to stand back up to the starting position.",
      "Repeat."
    ],
    "notes": ""
  },
  {
    "pk": "a189b026-3641-426f-b9a2-d32678ccb99f",
    "name": "Straight Arm Lat Pulldown",
    "slug": "straight-arm-lat-pulldown",
    "primaryMuscles": ["lat"],
    "secondaryMuscles": [
      "rotator cuff - back",
      "rotator cuff - front",
      "shoulder - back"
    ],
    "steps": [
      "Adjust the cable machine to a high position and attach a straight bar to the cable.",
      "Stand facing the machine with your feet shoulder-width apart and your knees slightly bent.",
      "Grasp the bar with both hands using an overhand grip, with your hands slightly wider than shoulder-width apart.",
      "Engage your core and keep your arms straight as you pull the bar down towards your thighs, using your lats to initiate the movement.",
      "Pause for a moment at the bottom of the movement, then slowly release the bar back up to the starting position.",
      "Repeat."
    ],
    "notes": ""
  },
  {
    "pk": "8f9fe1df-e342-4884-927e-070598eaed0b",
    "name": "Lying Internal Shoulder Rotation \u2013 Dumbbell",
    "slug": "lying-internal-shoulder-rotation-dumbbell",
    "primaryMuscles": ["rotator cuff - front"],
    "secondaryMuscles": [],
    "steps": [
      "Lie on your side on a flat bench with your legs stacked, and your body straight as possible from head to toes.",
      "Bend your lower arm (the one closest to the bench) at a 90-degree angle at your elbow, and grasp a dumbbell with a your palm facing the ceiling.",
      "Rotate your shoulder while keeping your elbow at a 90-degree angle, moving your forearm towards the ceiling and inwards towards your body.",
      "Rotate your arm upward as far as comfortably possible without lifting your elbow off the bench or your body moving off its position.",
      "Pause at the top of the movement for a brief moment.",
      "Slowly return the dumbbell to the starting position by rotating the forearm back to the bench while keeping the elbow angle constant.",
      "Complete all the desired repetitions on one arm before switching to the other arm and repeating the steps."
    ],
    "notes": "Keep your elbow tucked into your side and pinned to the bench throughout the exercise."
  },
  {
    "pk": "8e620f2a-f028-47c4-b86e-37d0dc0021cb",
    "name": "Squat \u2013 Landmine",
    "slug": "squat-landmine",
    "primaryMuscles": ["glute", "quad", "thigh - inner"],
    "secondaryMuscles": ["calf"],
    "steps": [
      "Start by placing a barbell into a landmine attachment or securely anchor it into a corner.",
      "Stand facing the barbell with your feet shoulder-width apart and your toes pointing slightly outward.",
      "Grab the end of the barbell with both hands and lift it up to your chest.",
      "Lower your hips down and back, keeping your chest up and your back straight.",
      "Bend your knees and lower your body until your thighs are parallel to the ground.",
      "Push through your heels and stand back up to the starting position.",
      "Repeat."
    ],
    "notes": ""
  },
  {
    "pk": "456cefbe-0d73-4b6e-a8e3-b4530ca8df37",
    "name": "Push-Up \u2013 Feet in Rings",
    "slug": "push-up-feet-in-rings",
    "primaryMuscles": ["chest", "shoulder - front", "tricep"],
    "secondaryMuscles": ["abdominal"],
    "steps": [
      "Start in a plank position with your feet in the rings and your hands shoulder-width apart on the ground.",
      "Lower your body towards the ground by bending your elbows and keeping your body straight.",
      "Push yourself back up to the starting position by straightening your arms.",
      "Repeat."
    ],
    "notes": ""
  },
  {
    "pk": "c46c643f-d109-4720-8ce9-3b5d24b9cdec",
    "name": "Lateral Walk \u2013 Band",
    "slug": "lateral-walk-band",
    "primaryMuscles": ["glute", "thigh - outer"],
    "secondaryMuscles": ["calf", "hamstring", "quad", "thigh - inner"],
    "steps": [
      "Place a resistance band around your ankles and stand with your feet hip-width apart.",
      "Take a step to the right with your right foot, keeping tension on the band.",
      "Bring your left foot to meet your right foot, maintaining tension on the band.",
      "Take another step to the right with your right foot, again keeping tension on the band.",
      "Repeat this lateral movement for a desired number of steps to the right.",
      "Then, reverse the movement and take the same number of steps to the left."
    ],
    "notes": ""
  },
  {
    "pk": "13ce59d9-4fd0-4aea-857a-3afc186c3074",
    "name": "Sit-Up",
    "slug": "sit-up",
    "primaryMuscles": ["abdominal"],
    "secondaryMuscles": ["oblique"],
    "steps": [
      "Start by lying on your back with your legs close together, knees bent, and feet flat on the ground.",
      "Place your hands lightly on the back of your head without interlocking your fingers. Elbows should be out to the sides.",
      "Engage your core muscles, exhale, and lift your upper body off the ground towards your knees. Lift until you're essentially sitting upright.",
      "Inhale as you reverse the movement and lower back down to the ground.",
      "Repeat."
    ],
    "notes": "Do not rest at the top or bottom of the movement. Avoid using momentum or pulling on your neck to lift your upper body. This goes for most exercises, but it's better to do fewer, controlled reps with proper form than to do more reps with poor form."
  },
  {
    "pk": "286bb89e-4b1c-4e9e-ba26-0e6d81baeaed",
    "name": "Incline Bench Press \u2013 Smith Machine",
    "slug": "incline-bench-press-smith-machine",
    "primaryMuscles": ["chest", "shoulder - front"],
    "secondaryMuscles": ["tricep"],
    "steps": [
      "Adjust the height of the Smith machine bar to a comfortable level for the incline bench press.",
      "Select the desired weight and load it onto the bar.",
      "Lie down on the incline bench and position yourself under the bar.",
      "Grip the bar with a slightly wider than shoulder-width grip and lift it off the rack.",
      "Lower the bar down to your chest while keeping your elbows tucked in.",
      "Push the bar back up to the starting position, keeping your core engaged and your back flat on the bench.",
      "Repeat.",
      "When finished, carefully rack the bar back onto the Smith machine."
    ],
    "notes": ""
  },
  {
    "pk": "0c5940e6-419e-476b-a1eb-39302e0aebe5",
    "name": "Chest Fly \u2013 Dumbbell",
    "slug": "chest-fly-dumbbell",
    "primaryMuscles": ["chest"],
    "secondaryMuscles": ["bicep", "forearm - inner", "shoulder - front"],
    "steps": [
      "Start by lying flat on a bench with your feet firmly on the ground and your head, shoulders, and buttocks touching the bench.",
      "Hold a dumbbell in each hand with your palms facing each other and your arms extended above your chest.",
      "Slowly lower the dumbbells out to the sides of your body, keeping your elbows slightly bent and your palms facing up.",
      "Lower the dumbbells until your arms are parallel to the ground or until you feel a stretch in your chest muscles.",
      "Pause for a moment, then slowly bring the dumbbells back up to the starting position, keeping your elbows slightly bent and your palms facing each other.",
      "Repeat."
    ],
    "notes": ""
  },
  {
    "pk": "e13cf8a4-6b48-4d9e-9a24-a30d5f98d713",
    "name": "Mountain Climbers",
    "slug": "mountain-climbers",
    "primaryMuscles": ["abdominal"],
    "secondaryMuscles": ["oblique"],
    "steps": [
      "Start in a high plank position with your hands shoulder-width apart and your wrists directly under your shoulders.",
      "Engage your core and bring your right knee towards your chest, keeping your foot off the ground.",
      "Quickly switch legs, bringing your left knee towards your chest while extending your right leg back.",
      "Continue alternating legs at a quick pace, as if you are running in place while in a plank position.",
      "Keep your hips low and your shoulders over your wrists throughout the exercise.",
      "Repeat."
    ],
    "notes": ""
  },
  {
    "pk": "edb21df1-0a7a-49f8-94e3-fa47138af935",
    "name": "Tricep Pushdown \u2013 Cable With Bar",
    "slug": "tricep-pushdown-cable-with-bar",
    "primaryMuscles": ["tricep"],
    "secondaryMuscles": [],
    "steps": [
      "Attach a straight bar to the high pulley of a cable machine.",
      "Stand facing the machine with your feet shoulder-width apart and your knees slightly bent.",
      "Grasp the bar with an overhand grip, with your hands shoulder-width apart.",
      "Keep your elbows close to your sides and your upper arms stationary.",
      "Exhale and push the bar down until your arms are fully extended.",
      "Pause for a moment, then inhale and slowly return the bar to the starting position.",
      "Repeat."
    ],
    "notes": ""
  },
  {
    "pk": "ae722011-8bc7-4714-8465-0f3969482e52",
    "name": "Horizontal External Shoulder Rotation \u2013 Dumbbell",
    "slug": "horizontal-external-shoulder-rotation-dumbbell",
    "primaryMuscles": ["rotator cuff - back"],
    "secondaryMuscles": [],
    "steps": [
      "Stand perpendicular to a bar set at a height just below shoulder level when standing.",
      "Grip a dumbbell with your working hand, maintaining the 90-degree angle at the elbow.",
      "Place the upper arm of your working side on the bar so that it is parallel to the ground and your elbow is bent at a 90-degree angle. Your forearm with dumbbell should be hanging vertically towards the floor.",
      "Brace your core and keep your shoulder blades down and back to prevent them from rolling forward during the exercise.",
      "Rotate your arm at the shoulder, lifting the dumbbell upwards while keeping your upper arm and elbow firmly in place on the bar.",
      "Continue the rotation until your forearm is horizontal to the floor or as far as your shoulder flexibility allows without discomfort or compromising form.",
      "Pause at the top of the movement, focusing on contracting the muscles around the shoulder.",
      "Slowly reverse the motion, lowering the dumbbell back to the starting position with control to complete one repetition.",
      "Perform the desired number of reps, then switch sides and repeat the exercise with the other arm."
    ],
    "notes": ""
  },
  {
    "pk": "03ded3cd-bba0-4f04-9afd-f7e321aec282",
    "name": "Supinated Grip Lat Pulldown",
    "slug": "supinated-grip-lat-pulldown",
    "primaryMuscles": ["lat"],
    "secondaryMuscles": [
      "bicep",
      "forearm - inner",
      "rotator cuff - back",
      "rotator cuff - front",
      "shoulder - back"
    ],
    "steps": [
      "Adjust the weight on the lat pulldown machine to a comfortable level.",
      "Stand facing the machine and grasp the bar with an underhand grip, with your hands shoulder-width apart.",
      "Sit down on the bench and adjust the knee pad so that it fits snugly against your thighs.",
      "Lean back slightly and keep your chest up and your shoulders down.",
      "Exhale and pull the bar down towards your chest, keeping your elbows close to your body.",
      "Pause for a moment and squeeze your shoulder blades together.",
      "Inhale and slowly release the bar back to the starting position, keeping your arms straight but not locked.",
      "Repeat."
    ],
    "notes": ""
  },
  {
    "pk": "f1c844bd-28c8-4191-9b2a-d0233e6941e1",
    "name": "Wrist Curl Behind the Back \u2013 Barbell",
    "slug": "wrist-curl-behind-the-back-barbell",
    "primaryMuscles": ["forearm - inner"],
    "secondaryMuscles": [],
    "steps": [
      "Stand with your feet shoulder-width apart and your knees slightly bent.",
      "Hold a barbell with an overhand grip behind your back, with your palms facing away from your body.",
      "Keep your elbows close to your body and your upper arms stationary.",
      "Curl the barbell up towards your forearms, keeping your wrists straight.",
      "Pause at the top of the movement and squeeze your forearms.",
      "Slowly lower the barbell back down to the starting position.",
      "Repeat."
    ],
    "notes": ""
  },
  {
    "pk": "a837f634-8aca-48b6-800e-2cc82f1335dd",
    "name": "Incline Push-Up",
    "slug": "incline-push-up",
    "primaryMuscles": ["chest", "shoulder - front", "tricep"],
    "secondaryMuscles": ["abdominal"],
    "steps": [
      "Start in a plank position with your hands on an elevated surface, such as a bench or step.",
      "Place your hands slightly wider than shoulder-width apart and keep your fingers pointing forward.",
      "Engage your core and glutes to maintain a straight line from your head to your heels.",
      "Lower your chest towards the bench, keeping your elbows close to your body.",
      "Pause when your chest is just above the bench.",
      "Push back up to the starting position, fully extending your arms.",
      "Repeat."
    ],
    "notes": ""
  },
  {
    "pk": "080ed4be-cc9a-4890-97cc-d6676aad6031",
    "name": "High to Low Wood Chop \u2013 Cable",
    "slug": "high-to-low-wood-chop-cable",
    "primaryMuscles": ["oblique"],
    "secondaryMuscles": ["abdominal"],
    "steps": [
      "Attach a cable to a high pulley and select the desired weight.",
      "Stand perpendicular to the cable with feet shoulder-width apart and knees slightly bent.",
      "Grasp the handle with both hands and extend arms overhead, keeping them straight.",
      "Engage core muscles and rotate torso diagonally downwards, pulling the cable down towards the opposite hip.",
      "Bend knees and pivot back foot as needed to maintain balance and stability.",
      "Pause briefly at the bottom of the movement, then reverse the motion and return to starting position.",
      "Repeat for desired number of repetitions, then switch sides and repeat."
    ],
    "notes": ""
  }
]''';
