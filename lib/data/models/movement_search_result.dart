import 'package:equatable/equatable.dart';

import 'movement.dart';
import 'named_variation.dart';

/// A search hit: either a plain movement, or one of its named variations
/// (e.g. "Romanian Deadlift" for Deadlift + romanian).
class MovementSearchResult extends Equatable {
  final Movement movement;
  final NamedVariation? namedVariation;

  const MovementSearchResult(this.movement, {this.namedVariation});

  String get displayName => namedVariation?.name ?? movement.name;

  List<String> get preselectedVariations => namedVariation?.variationKeys ?? const [];

  @override
  List<Object?> get props => [movement.id, namedVariation?.name];
}
