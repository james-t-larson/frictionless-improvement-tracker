const Map<String, String> _muscleDisplayNames = {
  'anterior deltoid': 'Front Delts',
  'lateral deltoid': 'Side Delts',
  'posterior deltoid': 'Rear Delts',
  'trapezius': 'Traps',
  'infraspinatus': 'Rotator Cuff',
  'subscapularis': 'Rotator Cuff',
  'pectoralis major': 'Chest',
  'latissimus dorsi': 'Lats',
  'biceps brachii': 'Biceps',
  'triceps brachii': 'Triceps',
  'rectus abdominis': 'Abs',
  'external obliques': 'Obliques',
  'erector spinae': 'Lower Back',
  'gluteus maximus': 'Glutes',
  'hamstrings': 'Hamstrings',
  'quadriceps femoris': 'Quads',
  'gastrocnemius': 'Calves',
  'hip abductors': 'Hip Abductors',
  'hip adductors': 'Hip Adductors',
  'wrist flexors': 'Forearm Flexors',
  'wrist extensors': 'Forearm Extensors',
  'iliopsoas': 'Hip Flexors',
};

/// Converts an anatomical muscle name (e.g. "anterior deltoid", as stored in
/// a movement's primaryMuscles) into a gym-friendly display label (e.g.
/// "Front Delts"). Falls back to title-casing the raw name if unmapped.
String muscleDisplayName(String anatomicalName) {
  final mapped = _muscleDisplayNames[anatomicalName];
  if (mapped != null) return mapped;
  return anatomicalName
      .split(' ')
      .map((w) => w.isEmpty ? w : '${w[0].toUpperCase()}${w.substring(1)}')
      .join(' ');
}
