// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'category_view_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CategoryState {
  ProjectType? get selectedType => throw _privateConstructorUsedError;
  CategoryProjectType? get projectFilter => throw _privateConstructorUsedError;
  List<CategoryItemModel> get projects => throw _privateConstructorUsedError;
  AsyncValue<List<CategoryItemModel>> get projectState =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CategoryStateCopyWith<CategoryState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoryStateCopyWith<$Res> {
  factory $CategoryStateCopyWith(
          CategoryState value, $Res Function(CategoryState) then) =
      _$CategoryStateCopyWithImpl<$Res, CategoryState>;
  @useResult
  $Res call(
      {ProjectType? selectedType,
      CategoryProjectType? projectFilter,
      List<CategoryItemModel> projects,
      AsyncValue<List<CategoryItemModel>> projectState});

  $ProjectTypeCopyWith<$Res>? get selectedType;
}

/// @nodoc
class _$CategoryStateCopyWithImpl<$Res, $Val extends CategoryState>
    implements $CategoryStateCopyWith<$Res> {
  _$CategoryStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedType = freezed,
    Object? projectFilter = freezed,
    Object? projects = null,
    Object? projectState = null,
  }) {
    return _then(_value.copyWith(
      selectedType: freezed == selectedType
          ? _value.selectedType
          : selectedType // ignore: cast_nullable_to_non_nullable
              as ProjectType?,
      projectFilter: freezed == projectFilter
          ? _value.projectFilter
          : projectFilter // ignore: cast_nullable_to_non_nullable
              as CategoryProjectType?,
      projects: null == projects
          ? _value.projects
          : projects // ignore: cast_nullable_to_non_nullable
              as List<CategoryItemModel>,
      projectState: null == projectState
          ? _value.projectState
          : projectState // ignore: cast_nullable_to_non_nullable
              as AsyncValue<List<CategoryItemModel>>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ProjectTypeCopyWith<$Res>? get selectedType {
    if (_value.selectedType == null) {
      return null;
    }

    return $ProjectTypeCopyWith<$Res>(_value.selectedType!, (value) {
      return _then(_value.copyWith(selectedType: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CategoryStateImplCopyWith<$Res>
    implements $CategoryStateCopyWith<$Res> {
  factory _$$CategoryStateImplCopyWith(
          _$CategoryStateImpl value, $Res Function(_$CategoryStateImpl) then) =
      __$$CategoryStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {ProjectType? selectedType,
      CategoryProjectType? projectFilter,
      List<CategoryItemModel> projects,
      AsyncValue<List<CategoryItemModel>> projectState});

  @override
  $ProjectTypeCopyWith<$Res>? get selectedType;
}

/// @nodoc
class __$$CategoryStateImplCopyWithImpl<$Res>
    extends _$CategoryStateCopyWithImpl<$Res, _$CategoryStateImpl>
    implements _$$CategoryStateImplCopyWith<$Res> {
  __$$CategoryStateImplCopyWithImpl(
      _$CategoryStateImpl _value, $Res Function(_$CategoryStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedType = freezed,
    Object? projectFilter = freezed,
    Object? projects = null,
    Object? projectState = null,
  }) {
    return _then(_$CategoryStateImpl(
      selectedType: freezed == selectedType
          ? _value.selectedType
          : selectedType // ignore: cast_nullable_to_non_nullable
              as ProjectType?,
      projectFilter: freezed == projectFilter
          ? _value.projectFilter
          : projectFilter // ignore: cast_nullable_to_non_nullable
              as CategoryProjectType?,
      projects: null == projects
          ? _value._projects
          : projects // ignore: cast_nullable_to_non_nullable
              as List<CategoryItemModel>,
      projectState: null == projectState
          ? _value.projectState
          : projectState // ignore: cast_nullable_to_non_nullable
              as AsyncValue<List<CategoryItemModel>>,
    ));
  }
}

/// @nodoc

class _$CategoryStateImpl implements _CategoryState {
  _$CategoryStateImpl(
      {this.selectedType,
      this.projectFilter = CategoryProjectType.recommend,
      final List<CategoryItemModel> projects = const [],
      this.projectState = const AsyncValue.loading()})
      : _projects = projects;

  @override
  final ProjectType? selectedType;
  @override
  @JsonKey()
  final CategoryProjectType? projectFilter;
  final List<CategoryItemModel> _projects;
  @override
  @JsonKey()
  List<CategoryItemModel> get projects {
    if (_projects is EqualUnmodifiableListView) return _projects;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_projects);
  }

  @override
  @JsonKey()
  final AsyncValue<List<CategoryItemModel>> projectState;

  @override
  String toString() {
    return 'CategoryState(selectedType: $selectedType, projectFilter: $projectFilter, projects: $projects, projectState: $projectState)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CategoryStateImpl &&
            (identical(other.selectedType, selectedType) ||
                other.selectedType == selectedType) &&
            (identical(other.projectFilter, projectFilter) ||
                other.projectFilter == projectFilter) &&
            const DeepCollectionEquality().equals(other._projects, _projects) &&
            (identical(other.projectState, projectState) ||
                other.projectState == projectState));
  }

  @override
  int get hashCode => Object.hash(runtimeType, selectedType, projectFilter,
      const DeepCollectionEquality().hash(_projects), projectState);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CategoryStateImplCopyWith<_$CategoryStateImpl> get copyWith =>
      __$$CategoryStateImplCopyWithImpl<_$CategoryStateImpl>(this, _$identity);
}

abstract class _CategoryState implements CategoryState {
  factory _CategoryState(
          {final ProjectType? selectedType,
          final CategoryProjectType? projectFilter,
          final List<CategoryItemModel> projects,
          final AsyncValue<List<CategoryItemModel>> projectState}) =
      _$CategoryStateImpl;

  @override
  ProjectType? get selectedType;
  @override
  CategoryProjectType? get projectFilter;
  @override
  List<CategoryItemModel> get projects;
  @override
  AsyncValue<List<CategoryItemModel>> get projectState;
  @override
  @JsonKey(ignore: true)
  _$$CategoryStateImplCopyWith<_$CategoryStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
