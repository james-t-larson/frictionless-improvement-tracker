class Variation {
  final int? id;
  final String name;

  Variation({
    this.id,
    required this.name,
  });

  Map<String, dynamic> toMap() {
    return {
      if (id != null) 'id': id,
      'name': name,
    };
  }

  factory Variation.fromMap(Map<String, dynamic> map) {
    return Variation(
      id: map['id'] as int?,
      name: map['name'] as String,
    );
  }
}
