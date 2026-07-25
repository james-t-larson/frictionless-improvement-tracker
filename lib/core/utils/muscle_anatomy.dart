/// Maps an anatomical muscle name (as stored in a movement's primaryMuscles)
/// to the muscle group it actually belongs to. This is independent of a
/// movement's own muscleGroups tag: a movement like Bench Press is tagged
/// "Chest" overall, but its anterior deltoid contribution still belongs
/// under "Shoulders", not "Chest".
const Map<String, String> _muscleGroupByMuscle = {
  'anterior deltoid': 'Shoulders',
  'lateral deltoid': 'Shoulders',
  'posterior deltoid': 'Shoulders',
  'infraspinatus': 'Shoulders',
  'subscapularis': 'Shoulders',
  'trapezius': 'Back',
  'latissimus dorsi': 'Back',
  'erector spinae': 'Back',
  'pectoralis major': 'Chest',
  'biceps brachii': 'Arms',
  'triceps brachii': 'Arms',
  'wrist flexors': 'Arms',
  'wrist extensors': 'Arms',
  'rectus abdominis': 'Core',
  'external obliques': 'Core',
  'iliopsoas': 'Core',
  'gluteus maximus': 'Legs',
  'hamstrings': 'Legs',
  'quadriceps femoris': 'Legs',
  'gastrocnemius': 'Legs',
  'hip abductors': 'Legs',
  'hip adductors': 'Legs',
};

/// Returns the muscle group [anatomicalName] belongs to, or null if
/// unmapped (callers should fall back to the movement's own tag in that
/// case, so newly added muscles don't silently vanish from counts).
String? muscleGroupFor(String anatomicalName) => _muscleGroupByMuscle[anatomicalName];
