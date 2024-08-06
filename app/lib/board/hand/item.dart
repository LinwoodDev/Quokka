import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame_bloc/flame_bloc.dart';
import 'package:flutter/painting.dart';
import 'package:quokka/bloc/board.dart';
import 'package:quokka/bloc/board_state.dart';
import 'package:quokka/board/cell.dart';
import 'package:quokka/board/game.dart';
import 'package:quokka/board/hand/view.dart';
import 'package:quokka/helpers/asset.dart';
import 'package:quokka/helpers/drag.dart';

abstract class HandItem<T> extends PositionComponent
    with
        TapCallbacks,
        HasGameRef<BoardGame>,
        DragCallbacks,
        LongDragCallbacks,
        FlameBlocReader<BoardBloc, BoardState> {
  final T item;
  late final SpriteComponent _sprite;
  Vector2 _lastPos = Vector2.zero();

  HandItem({required this.item}) : super(size: Vector2(100, 0));

  GameHand get hand => findParent<GameHand>()!;

  String get label;

  Future<Sprite?> loadIcon();

  AssetManager get assetManager => game.assetManager;

  double get labelHeight => 20;

  @override
  Future<void> onLoad() async {
    super.onLoad();
    add(TextComponent(
      text: label,
      size: Vector2(0, labelHeight),
      position: Vector2(50, 0),
      anchor: Anchor.topCenter,
      textRenderer: TextPaint(
        style: const TextStyle(fontSize: 14),
      ),
    ));
    _sprite = SpriteComponent(
      position: Vector2(0, labelHeight),
      size: Vector2(100, 0),
      sprite: await loadIcon(),
    );
    add(_sprite);
  }

  @override
  void onParentResize(Vector2 maxSize) {
    height = maxSize.y;
    _sprite.height = height - labelHeight;
  }

  @override
  void onDragUpdate(DragUpdateEvent event) {
    super.onDragUpdate(event);
    if (!isLongPressing) {
      hand.scroll(event.localDelta.x);
      return;
    }
    _lastPos = event.canvasEndPosition;
  }

  @override
  void onDragEnd(DragEndEvent event) {
    super.onDragEnd(event);
    if (!isLongPressing) return;
    final pos = game.camera.globalToLocal(_lastPos);
    final cell =
        game.grid.componentsAtPoint(pos).whereType<GameCell>().firstOrNull;
    if (cell == null) return;
    moveItem(cell);
  }

  void moveItem(GameCell cell) {}
}
