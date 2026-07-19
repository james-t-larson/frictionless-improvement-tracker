class NamedVariation {
  final String name;
  final List<String> variationKeys;
  final List<String> aliases;

  NamedVariation({
    required this.name,
    required this.variationKeys,
    this.aliases = const [],
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'variations': variationKeys,
      if (aliases.isNotEmpty) 'aliases': aliases,
    };
  }

  factory NamedVariation.fromJson(Map<String, dynamic> json) {
    return NamedVariation(
      name: json['name'] as String,
      variationKeys: List<String>.from(json['variations'] ?? []),
      aliases: List<String>.from(json['aliases'] ?? []),
    );
  }

  /// Whether this named variation's keys are all present in [selectedVariations].
  bool matches(List<String> selectedVariations) {
    return variationKeys.every(selectedVariations.contains);
  }
}
