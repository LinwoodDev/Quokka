import 'package:dart_mappable/dart_mappable.dart';
import 'vector.dart';
import 'visual.dart';

part 'definition.mapper.dart';

sealed class GameObjectDefinition {}

@MappableClass()
class FigureDefinition extends GameObjectDefinition
    with FigureDefinitionMappable {
  final FigureBackDefinition back;
  final bool rollable;
  final Map<String, VariationDefinition> variations;

  FigureDefinition({
    this.variations = const {},
    this.rollable = false,
    required this.back,
  });
}

@MappableClass()
class BoardDefinition with BoardDefinitionMappable, VisualDefinition {
  @override
  final VectorDefinition offset;
  @override
  final VectorDefinition? size;
  @override
  final String texture;
  final VectorDefinition tiles;

  BoardDefinition({
    this.offset = VectorDefinition.zero,
    this.size,
    required this.texture,
    this.tiles = VectorDefinition.one,
  });
}

@MappableClass()
class VariationDefinition with VariationDefinitionMappable, VisualDefinition {
  final String? category;
  @override
  final String texture;
  @override
  final VectorDefinition offset;
  @override
  final VectorDefinition? size;

  VariationDefinition({
    this.category,
    required this.texture,
    this.offset = VectorDefinition.zero,
    this.size,
  });
}

@MappableClass()
class FigureBackDefinition with FigureBackDefinitionMappable, VisualDefinition {
  @override
  final String texture;
  @override
  final VectorDefinition offset;
  @override
  final VectorDefinition? size;

  FigureBackDefinition({
    required this.texture,
    this.offset = VectorDefinition.zero,
    this.size,
  });
}
