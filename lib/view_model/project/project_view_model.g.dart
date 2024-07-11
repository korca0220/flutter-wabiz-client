// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$fetchProjectTypesHash() => r'050f9409214cce23a11558aa8a7a04d631112086';

/// See also [fetchProjectTypes].
@ProviderFor(fetchProjectTypes)
final fetchProjectTypesProvider =
    AutoDisposeFutureProvider<List<ProjectType>>.internal(
  fetchProjectTypes,
  name: r'fetchProjectTypesProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$fetchProjectTypesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef FetchProjectTypesRef = AutoDisposeFutureProviderRef<List<ProjectType>>;
String _$fetchProjectByIdHash() => r'4e3d320f6043d2a934010861874011fb48c19c44';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [fetchProjectById].
@ProviderFor(fetchProjectById)
const fetchProjectByIdProvider = FetchProjectByIdFamily();

/// See also [fetchProjectById].
class FetchProjectByIdFamily extends Family<AsyncValue<ProjectModel>> {
  /// See also [fetchProjectById].
  const FetchProjectByIdFamily();

  /// See also [fetchProjectById].
  FetchProjectByIdProvider call(
    String id,
  ) {
    return FetchProjectByIdProvider(
      id,
    );
  }

  @override
  FetchProjectByIdProvider getProviderOverride(
    covariant FetchProjectByIdProvider provider,
  ) {
    return call(
      provider.id,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'fetchProjectByIdProvider';
}

/// See also [fetchProjectById].
class FetchProjectByIdProvider extends AutoDisposeFutureProvider<ProjectModel> {
  /// See also [fetchProjectById].
  FetchProjectByIdProvider(
    String id,
  ) : this._internal(
          (ref) => fetchProjectById(
            ref as FetchProjectByIdRef,
            id,
          ),
          from: fetchProjectByIdProvider,
          name: r'fetchProjectByIdProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$fetchProjectByIdHash,
          dependencies: FetchProjectByIdFamily._dependencies,
          allTransitiveDependencies:
              FetchProjectByIdFamily._allTransitiveDependencies,
          id: id,
        );

  FetchProjectByIdProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final String id;

  @override
  Override overrideWith(
    FutureOr<ProjectModel> Function(FetchProjectByIdRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FetchProjectByIdProvider._internal(
        (ref) => create(ref as FetchProjectByIdRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<ProjectModel> createElement() {
    return _FetchProjectByIdProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FetchProjectByIdProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin FetchProjectByIdRef on AutoDisposeFutureProviderRef<ProjectModel> {
  /// The parameter `id` of this provider.
  String get id;
}

class _FetchProjectByIdProviderElement
    extends AutoDisposeFutureProviderElement<ProjectModel>
    with FetchProjectByIdRef {
  _FetchProjectByIdProviderElement(super.provider);

  @override
  String get id => (origin as FetchProjectByIdProvider).id;
}

String _$projectViewModelHash() => r'5f03c1592db31b12f3a42f41bbfef7ab0c1e377b';

/// See also [ProjectViewModel].
@ProviderFor(ProjectViewModel)
final projectViewModelProvider =
    AutoDisposeNotifierProvider<ProjectViewModel, ProjectItemModel?>.internal(
  ProjectViewModel.new,
  name: r'projectViewModelProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$projectViewModelHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ProjectViewModel = AutoDisposeNotifier<ProjectItemModel?>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
