// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'my_view_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MyPageState _$MyPageStateFromJson(Map<String, dynamic> json) {
  return _MyPageState.fromJson(json);
}

/// @nodoc
mixin _$MyPageState {
  bool? get loginState => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MyPageStateCopyWith<MyPageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MyPageStateCopyWith<$Res> {
  factory $MyPageStateCopyWith(
          MyPageState value, $Res Function(MyPageState) then) =
      _$MyPageStateCopyWithImpl<$Res, MyPageState>;
  @useResult
  $Res call({bool? loginState});
}

/// @nodoc
class _$MyPageStateCopyWithImpl<$Res, $Val extends MyPageState>
    implements $MyPageStateCopyWith<$Res> {
  _$MyPageStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loginState = freezed,
  }) {
    return _then(_value.copyWith(
      loginState: freezed == loginState
          ? _value.loginState
          : loginState // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MyPageStateImplCopyWith<$Res>
    implements $MyPageStateCopyWith<$Res> {
  factory _$$MyPageStateImplCopyWith(
          _$MyPageStateImpl value, $Res Function(_$MyPageStateImpl) then) =
      __$$MyPageStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool? loginState});
}

/// @nodoc
class __$$MyPageStateImplCopyWithImpl<$Res>
    extends _$MyPageStateCopyWithImpl<$Res, _$MyPageStateImpl>
    implements _$$MyPageStateImplCopyWith<$Res> {
  __$$MyPageStateImplCopyWithImpl(
      _$MyPageStateImpl _value, $Res Function(_$MyPageStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loginState = freezed,
  }) {
    return _then(_$MyPageStateImpl(
      loginState: freezed == loginState
          ? _value.loginState
          : loginState // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MyPageStateImpl implements _MyPageState {
  _$MyPageStateImpl({this.loginState});

  factory _$MyPageStateImpl.fromJson(Map<String, dynamic> json) =>
      _$$MyPageStateImplFromJson(json);

  @override
  final bool? loginState;

  @override
  String toString() {
    return 'MyPageState(loginState: $loginState)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MyPageStateImpl &&
            (identical(other.loginState, loginState) ||
                other.loginState == loginState));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, loginState);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MyPageStateImplCopyWith<_$MyPageStateImpl> get copyWith =>
      __$$MyPageStateImplCopyWithImpl<_$MyPageStateImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MyPageStateImplToJson(
      this,
    );
  }
}

abstract class _MyPageState implements MyPageState {
  factory _MyPageState({final bool? loginState}) = _$MyPageStateImpl;

  factory _MyPageState.fromJson(Map<String, dynamic> json) =
      _$MyPageStateImpl.fromJson;

  @override
  bool? get loginState;
  @override
  @JsonKey(ignore: true)
  _$$MyPageStateImplCopyWith<_$MyPageStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
