// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'client.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ClientConnectionMessage _$ClientConnectionMessageFromJson(
    Map<String, dynamic> json) {
  switch (json['type']) {
    case 'playersUpdated':
      return FetchedPlayersClientConnectionMessage.fromJson(json);
    case 'chatMessage':
      return ChatMessageClientConnectionMessage.fromJson(json);
    case 'stateChanged':
      return GameStateChangedClientConnectionMessage.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'type', 'ClientConnectionMessage',
          'Invalid union type "${json['type']}"!');
  }
}

/// @nodoc
mixin _$ClientConnectionMessage {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<GamePlayer> players, int playerId)
        playersUpdated,
    required TResult Function(String message, String from) chatMessage,
    required TResult Function(GameState state) stateChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<GamePlayer> players, int playerId)? playersUpdated,
    TResult? Function(String message, String from)? chatMessage,
    TResult? Function(GameState state)? stateChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<GamePlayer> players, int playerId)? playersUpdated,
    TResult Function(String message, String from)? chatMessage,
    TResult Function(GameState state)? stateChanged,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchedPlayersClientConnectionMessage value)
        playersUpdated,
    required TResult Function(ChatMessageClientConnectionMessage value)
        chatMessage,
    required TResult Function(GameStateChangedClientConnectionMessage value)
        stateChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FetchedPlayersClientConnectionMessage value)?
        playersUpdated,
    TResult? Function(ChatMessageClientConnectionMessage value)? chatMessage,
    TResult? Function(GameStateChangedClientConnectionMessage value)?
        stateChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchedPlayersClientConnectionMessage value)?
        playersUpdated,
    TResult Function(ChatMessageClientConnectionMessage value)? chatMessage,
    TResult Function(GameStateChangedClientConnectionMessage value)?
        stateChanged,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ClientConnectionMessageCopyWith<$Res> {
  factory $ClientConnectionMessageCopyWith(ClientConnectionMessage value,
          $Res Function(ClientConnectionMessage) then) =
      _$ClientConnectionMessageCopyWithImpl<$Res, ClientConnectionMessage>;
}

/// @nodoc
class _$ClientConnectionMessageCopyWithImpl<$Res,
        $Val extends ClientConnectionMessage>
    implements $ClientConnectionMessageCopyWith<$Res> {
  _$ClientConnectionMessageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$FetchedPlayersClientConnectionMessageCopyWith<$Res> {
  factory _$$FetchedPlayersClientConnectionMessageCopyWith(
          _$FetchedPlayersClientConnectionMessage value,
          $Res Function(_$FetchedPlayersClientConnectionMessage) then) =
      __$$FetchedPlayersClientConnectionMessageCopyWithImpl<$Res>;
  @useResult
  $Res call({List<GamePlayer> players, int playerId});
}

/// @nodoc
class __$$FetchedPlayersClientConnectionMessageCopyWithImpl<$Res>
    extends _$ClientConnectionMessageCopyWithImpl<$Res,
        _$FetchedPlayersClientConnectionMessage>
    implements _$$FetchedPlayersClientConnectionMessageCopyWith<$Res> {
  __$$FetchedPlayersClientConnectionMessageCopyWithImpl(
      _$FetchedPlayersClientConnectionMessage _value,
      $Res Function(_$FetchedPlayersClientConnectionMessage) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? players = null,
    Object? playerId = null,
  }) {
    return _then(_$FetchedPlayersClientConnectionMessage(
      null == players
          ? _value._players
          : players // ignore: cast_nullable_to_non_nullable
              as List<GamePlayer>,
      null == playerId
          ? _value.playerId
          : playerId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FetchedPlayersClientConnectionMessage
    implements FetchedPlayersClientConnectionMessage {
  const _$FetchedPlayersClientConnectionMessage(
      final List<GamePlayer> players, this.playerId,
      {final String? $type})
      : _players = players,
        $type = $type ?? 'playersUpdated';

  factory _$FetchedPlayersClientConnectionMessage.fromJson(
          Map<String, dynamic> json) =>
      _$$FetchedPlayersClientConnectionMessageFromJson(json);

  final List<GamePlayer> _players;
  @override
  List<GamePlayer> get players {
    if (_players is EqualUnmodifiableListView) return _players;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_players);
  }

  @override
  final int playerId;

  @JsonKey(name: 'type')
  final String $type;

  @override
  String toString() {
    return 'ClientConnectionMessage.playersUpdated(players: $players, playerId: $playerId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FetchedPlayersClientConnectionMessage &&
            const DeepCollectionEquality().equals(other._players, _players) &&
            (identical(other.playerId, playerId) ||
                other.playerId == playerId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_players), playerId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FetchedPlayersClientConnectionMessageCopyWith<
          _$FetchedPlayersClientConnectionMessage>
      get copyWith => __$$FetchedPlayersClientConnectionMessageCopyWithImpl<
          _$FetchedPlayersClientConnectionMessage>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<GamePlayer> players, int playerId)
        playersUpdated,
    required TResult Function(String message, String from) chatMessage,
    required TResult Function(GameState state) stateChanged,
  }) {
    return playersUpdated(players, playerId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<GamePlayer> players, int playerId)? playersUpdated,
    TResult? Function(String message, String from)? chatMessage,
    TResult? Function(GameState state)? stateChanged,
  }) {
    return playersUpdated?.call(players, playerId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<GamePlayer> players, int playerId)? playersUpdated,
    TResult Function(String message, String from)? chatMessage,
    TResult Function(GameState state)? stateChanged,
    required TResult orElse(),
  }) {
    if (playersUpdated != null) {
      return playersUpdated(players, playerId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchedPlayersClientConnectionMessage value)
        playersUpdated,
    required TResult Function(ChatMessageClientConnectionMessage value)
        chatMessage,
    required TResult Function(GameStateChangedClientConnectionMessage value)
        stateChanged,
  }) {
    return playersUpdated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FetchedPlayersClientConnectionMessage value)?
        playersUpdated,
    TResult? Function(ChatMessageClientConnectionMessage value)? chatMessage,
    TResult? Function(GameStateChangedClientConnectionMessage value)?
        stateChanged,
  }) {
    return playersUpdated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchedPlayersClientConnectionMessage value)?
        playersUpdated,
    TResult Function(ChatMessageClientConnectionMessage value)? chatMessage,
    TResult Function(GameStateChangedClientConnectionMessage value)?
        stateChanged,
    required TResult orElse(),
  }) {
    if (playersUpdated != null) {
      return playersUpdated(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$FetchedPlayersClientConnectionMessageToJson(
      this,
    );
  }
}

abstract class FetchedPlayersClientConnectionMessage
    implements ClientConnectionMessage {
  const factory FetchedPlayersClientConnectionMessage(
          final List<GamePlayer> players, final int playerId) =
      _$FetchedPlayersClientConnectionMessage;

  factory FetchedPlayersClientConnectionMessage.fromJson(
          Map<String, dynamic> json) =
      _$FetchedPlayersClientConnectionMessage.fromJson;

  List<GamePlayer> get players;
  int get playerId;
  @JsonKey(ignore: true)
  _$$FetchedPlayersClientConnectionMessageCopyWith<
          _$FetchedPlayersClientConnectionMessage>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ChatMessageClientConnectionMessageCopyWith<$Res> {
  factory _$$ChatMessageClientConnectionMessageCopyWith(
          _$ChatMessageClientConnectionMessage value,
          $Res Function(_$ChatMessageClientConnectionMessage) then) =
      __$$ChatMessageClientConnectionMessageCopyWithImpl<$Res>;
  @useResult
  $Res call({String message, String from});
}

/// @nodoc
class __$$ChatMessageClientConnectionMessageCopyWithImpl<$Res>
    extends _$ClientConnectionMessageCopyWithImpl<$Res,
        _$ChatMessageClientConnectionMessage>
    implements _$$ChatMessageClientConnectionMessageCopyWith<$Res> {
  __$$ChatMessageClientConnectionMessageCopyWithImpl(
      _$ChatMessageClientConnectionMessage _value,
      $Res Function(_$ChatMessageClientConnectionMessage) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? from = null,
  }) {
    return _then(_$ChatMessageClientConnectionMessage(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      null == from
          ? _value.from
          : from // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ChatMessageClientConnectionMessage
    implements ChatMessageClientConnectionMessage {
  const _$ChatMessageClientConnectionMessage(this.message, this.from,
      {final String? $type})
      : $type = $type ?? 'chatMessage';

  factory _$ChatMessageClientConnectionMessage.fromJson(
          Map<String, dynamic> json) =>
      _$$ChatMessageClientConnectionMessageFromJson(json);

  @override
  final String message;
  @override
  final String from;

  @JsonKey(name: 'type')
  final String $type;

  @override
  String toString() {
    return 'ClientConnectionMessage.chatMessage(message: $message, from: $from)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatMessageClientConnectionMessage &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.from, from) || other.from == from));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, message, from);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChatMessageClientConnectionMessageCopyWith<
          _$ChatMessageClientConnectionMessage>
      get copyWith => __$$ChatMessageClientConnectionMessageCopyWithImpl<
          _$ChatMessageClientConnectionMessage>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<GamePlayer> players, int playerId)
        playersUpdated,
    required TResult Function(String message, String from) chatMessage,
    required TResult Function(GameState state) stateChanged,
  }) {
    return chatMessage(message, from);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<GamePlayer> players, int playerId)? playersUpdated,
    TResult? Function(String message, String from)? chatMessage,
    TResult? Function(GameState state)? stateChanged,
  }) {
    return chatMessage?.call(message, from);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<GamePlayer> players, int playerId)? playersUpdated,
    TResult Function(String message, String from)? chatMessage,
    TResult Function(GameState state)? stateChanged,
    required TResult orElse(),
  }) {
    if (chatMessage != null) {
      return chatMessage(message, from);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchedPlayersClientConnectionMessage value)
        playersUpdated,
    required TResult Function(ChatMessageClientConnectionMessage value)
        chatMessage,
    required TResult Function(GameStateChangedClientConnectionMessage value)
        stateChanged,
  }) {
    return chatMessage(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FetchedPlayersClientConnectionMessage value)?
        playersUpdated,
    TResult? Function(ChatMessageClientConnectionMessage value)? chatMessage,
    TResult? Function(GameStateChangedClientConnectionMessage value)?
        stateChanged,
  }) {
    return chatMessage?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchedPlayersClientConnectionMessage value)?
        playersUpdated,
    TResult Function(ChatMessageClientConnectionMessage value)? chatMessage,
    TResult Function(GameStateChangedClientConnectionMessage value)?
        stateChanged,
    required TResult orElse(),
  }) {
    if (chatMessage != null) {
      return chatMessage(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$ChatMessageClientConnectionMessageToJson(
      this,
    );
  }
}

abstract class ChatMessageClientConnectionMessage
    implements ClientConnectionMessage {
  const factory ChatMessageClientConnectionMessage(
          final String message, final String from) =
      _$ChatMessageClientConnectionMessage;

  factory ChatMessageClientConnectionMessage.fromJson(
          Map<String, dynamic> json) =
      _$ChatMessageClientConnectionMessage.fromJson;

  String get message;
  String get from;
  @JsonKey(ignore: true)
  _$$ChatMessageClientConnectionMessageCopyWith<
          _$ChatMessageClientConnectionMessage>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GameStateChangedClientConnectionMessageCopyWith<$Res> {
  factory _$$GameStateChangedClientConnectionMessageCopyWith(
          _$GameStateChangedClientConnectionMessage value,
          $Res Function(_$GameStateChangedClientConnectionMessage) then) =
      __$$GameStateChangedClientConnectionMessageCopyWithImpl<$Res>;
  @useResult
  $Res call({GameState state});

  $GameStateCopyWith<$Res> get state;
}

/// @nodoc
class __$$GameStateChangedClientConnectionMessageCopyWithImpl<$Res>
    extends _$ClientConnectionMessageCopyWithImpl<$Res,
        _$GameStateChangedClientConnectionMessage>
    implements _$$GameStateChangedClientConnectionMessageCopyWith<$Res> {
  __$$GameStateChangedClientConnectionMessageCopyWithImpl(
      _$GameStateChangedClientConnectionMessage _value,
      $Res Function(_$GameStateChangedClientConnectionMessage) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? state = null,
  }) {
    return _then(_$GameStateChangedClientConnectionMessage(
      null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as GameState,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $GameStateCopyWith<$Res> get state {
    return $GameStateCopyWith<$Res>(_value.state, (value) {
      return _then(_value.copyWith(state: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _$GameStateChangedClientConnectionMessage
    implements GameStateChangedClientConnectionMessage {
  const _$GameStateChangedClientConnectionMessage(this.state,
      {final String? $type})
      : $type = $type ?? 'stateChanged';

  factory _$GameStateChangedClientConnectionMessage.fromJson(
          Map<String, dynamic> json) =>
      _$$GameStateChangedClientConnectionMessageFromJson(json);

  @override
  final GameState state;

  @JsonKey(name: 'type')
  final String $type;

  @override
  String toString() {
    return 'ClientConnectionMessage.stateChanged(state: $state)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GameStateChangedClientConnectionMessage &&
            (identical(other.state, state) || other.state == state));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, state);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GameStateChangedClientConnectionMessageCopyWith<
          _$GameStateChangedClientConnectionMessage>
      get copyWith => __$$GameStateChangedClientConnectionMessageCopyWithImpl<
          _$GameStateChangedClientConnectionMessage>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<GamePlayer> players, int playerId)
        playersUpdated,
    required TResult Function(String message, String from) chatMessage,
    required TResult Function(GameState state) stateChanged,
  }) {
    return stateChanged(state);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<GamePlayer> players, int playerId)? playersUpdated,
    TResult? Function(String message, String from)? chatMessage,
    TResult? Function(GameState state)? stateChanged,
  }) {
    return stateChanged?.call(state);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<GamePlayer> players, int playerId)? playersUpdated,
    TResult Function(String message, String from)? chatMessage,
    TResult Function(GameState state)? stateChanged,
    required TResult orElse(),
  }) {
    if (stateChanged != null) {
      return stateChanged(state);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchedPlayersClientConnectionMessage value)
        playersUpdated,
    required TResult Function(ChatMessageClientConnectionMessage value)
        chatMessage,
    required TResult Function(GameStateChangedClientConnectionMessage value)
        stateChanged,
  }) {
    return stateChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FetchedPlayersClientConnectionMessage value)?
        playersUpdated,
    TResult? Function(ChatMessageClientConnectionMessage value)? chatMessage,
    TResult? Function(GameStateChangedClientConnectionMessage value)?
        stateChanged,
  }) {
    return stateChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchedPlayersClientConnectionMessage value)?
        playersUpdated,
    TResult Function(ChatMessageClientConnectionMessage value)? chatMessage,
    TResult Function(GameStateChangedClientConnectionMessage value)?
        stateChanged,
    required TResult orElse(),
  }) {
    if (stateChanged != null) {
      return stateChanged(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$GameStateChangedClientConnectionMessageToJson(
      this,
    );
  }
}

abstract class GameStateChangedClientConnectionMessage
    implements ClientConnectionMessage {
  const factory GameStateChangedClientConnectionMessage(final GameState state) =
      _$GameStateChangedClientConnectionMessage;

  factory GameStateChangedClientConnectionMessage.fromJson(
          Map<String, dynamic> json) =
      _$GameStateChangedClientConnectionMessage.fromJson;

  GameState get state;
  @JsonKey(ignore: true)
  _$$GameStateChangedClientConnectionMessageCopyWith<
          _$GameStateChangedClientConnectionMessage>
      get copyWith => throw _privateConstructorUsedError;
}
