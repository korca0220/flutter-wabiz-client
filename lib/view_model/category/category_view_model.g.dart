// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$fetchTypeTabsHash() => r'cc335bc11180fc4d6c7d5d265db1c01c1428b74b';

/// See also [fetchTypeTabs].
@ProviderFor(fetchTypeTabs)
final fetchTypeTabsProvider =
    AutoDisposeFutureProvider<List<ProjectType>>.internal(
  fetchTypeTabs,
  name: r'fetchTypeTabsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$fetchTypeTabsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef FetchTypeTabsRef = AutoDisposeFutureProviderRef<List<ProjectType>>;
String _$fetchCategoryProjectHash() =>
    r'43f19d18645451f5594f8c51fc9c5d74d04d5b18';

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

/// See also [fetchCategoryProject].
@ProviderFor(fetchCategoryProject)
const fetchCategoryProjectProvider = FetchCategoryProjectFamily();

/// See also [fetchCategoryProject].
class FetchCategoryProjectFamily extends Family<AsyncValue<CategoryModel>> {
  /// See also [fetchCategoryProject].
  const FetchCategoryProjectFamily();

  /// See also [fetchCategoryProject].
  FetchCategoryProjectProvider call(
    String categoryId,
  ) {
    return FetchCategoryProjectProvider(
      categoryId,
    );
  }

  @override
  FetchCategoryProjectProvider getProviderOverride(
    covariant FetchCategoryProjectProvider provider,
  ) {
    return call(
      provider.categoryId,
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
  String? get name => r'fetchCategoryProjectProvider';
}

/// See also [fetchCategoryProject].
class FetchCategoryProjectProvider
    extends AutoDisposeFutureProvider<CategoryModel> {
  /// See also [fetchCategoryProject].
  FetchCategoryProjectProvider(
    String categoryId,
  ) : this._internal(
          (ref) => fetchCategoryProject(
            ref as FetchCategoryProjectRef,
            categoryId,
          ),
          from: fetchCategoryProjectProvider,
          name: r'fetchCategoryProjectProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$fetchCategoryProjectHash,
          dependencies: FetchCategoryProjectFamily._dependencies,
          allTransitiveDependencies:
              FetchCategoryProjectFamily._allTransitiveDependencies,
          categoryId: categoryId,
        );

  FetchCategoryProjectProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.categoryId,
  }) : super.internal();

  final String categoryId;

  @override
  Override overrideWith(
    FutureOr<CategoryModel> Function(FetchCategoryProjectRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FetchCategoryProjectProvider._internal(
        (ref) => create(ref as FetchCategoryProjectRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        categoryId: categoryId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<CategoryModel> createElement() {
    return _FetchCategoryProjectProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FetchCategoryProjectProvider &&
        other.categoryId == categoryId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, categoryId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin FetchCategoryProjectRef on AutoDisposeFutureProviderRef<CategoryModel> {
  /// The parameter `categoryId` of this provider.
  String get categoryId;
}

class _FetchCategoryProjectProviderElement
    extends AutoDisposeFutureProviderElement<CategoryModel>
    with FetchCategoryProjectRef {
  _FetchCategoryProjectProviderElement(super.provider);

  @override
  String get categoryId => (origin as FetchCategoryProjectProvider).categoryId;
}

String _$fetchCategoryProjectsByTypeHash() =>
    r'163e3602fdb97d897545d53a9eb5ad32e1da8666';

/// See also [fetchCategoryProjectsByType].
@ProviderFor(fetchCategoryProjectsByType)
const fetchCategoryProjectsByTypeProvider = FetchCategoryProjectsByTypeFamily();

/// See also [fetchCategoryProjectsByType].
class FetchCategoryProjectsByTypeFamily
    extends Family<AsyncValue<CategoryModel>> {
  /// See also [fetchCategoryProjectsByType].
  const FetchCategoryProjectsByTypeFamily();

  /// See also [fetchCategoryProjectsByType].
  FetchCategoryProjectsByTypeProvider call(
    String categoryId,
  ) {
    return FetchCategoryProjectsByTypeProvider(
      categoryId,
    );
  }

  @override
  FetchCategoryProjectsByTypeProvider getProviderOverride(
    covariant FetchCategoryProjectsByTypeProvider provider,
  ) {
    return call(
      provider.categoryId,
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
  String? get name => r'fetchCategoryProjectsByTypeProvider';
}

/// See also [fetchCategoryProjectsByType].
class FetchCategoryProjectsByTypeProvider
    extends AutoDisposeFutureProvider<CategoryModel> {
  /// See also [fetchCategoryProjectsByType].
  FetchCategoryProjectsByTypeProvider(
    String categoryId,
  ) : this._internal(
          (ref) => fetchCategoryProjectsByType(
            ref as FetchCategoryProjectsByTypeRef,
            categoryId,
          ),
          from: fetchCategoryProjectsByTypeProvider,
          name: r'fetchCategoryProjectsByTypeProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$fetchCategoryProjectsByTypeHash,
          dependencies: FetchCategoryProjectsByTypeFamily._dependencies,
          allTransitiveDependencies:
              FetchCategoryProjectsByTypeFamily._allTransitiveDependencies,
          categoryId: categoryId,
        );

  FetchCategoryProjectsByTypeProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.categoryId,
  }) : super.internal();

  final String categoryId;

  @override
  Override overrideWith(
    FutureOr<CategoryModel> Function(FetchCategoryProjectsByTypeRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FetchCategoryProjectsByTypeProvider._internal(
        (ref) => create(ref as FetchCategoryProjectsByTypeRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        categoryId: categoryId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<CategoryModel> createElement() {
    return _FetchCategoryProjectsByTypeProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FetchCategoryProjectsByTypeProvider &&
        other.categoryId == categoryId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, categoryId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin FetchCategoryProjectsByTypeRef
    on AutoDisposeFutureProviderRef<CategoryModel> {
  /// The parameter `categoryId` of this provider.
  String get categoryId;
}

class _FetchCategoryProjectsByTypeProviderElement
    extends AutoDisposeFutureProviderElement<CategoryModel>
    with FetchCategoryProjectsByTypeRef {
  _FetchCategoryProjectsByTypeProviderElement(super.provider);

  @override
  String get categoryId =>
      (origin as FetchCategoryProjectsByTypeProvider).categoryId;
}

String _$categoryViewModelHash() => r'e2c5c5a90a2b2f720b530dfb2b873308549c1917';

/// See also [CategoryViewModel].
@ProviderFor(CategoryViewModel)
final categoryViewModelProvider =
    AutoDisposeNotifierProvider<CategoryViewModel, CategoryState>.internal(
  CategoryViewModel.new,
  name: r'categoryViewModelProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$categoryViewModelHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$CategoryViewModel = AutoDisposeNotifier<CategoryState>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
