// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$fetchHomeProjectHash() => r'3e1acc583746f5587e5125db9ed52b8e2d259cc5';

/// See also [fetchHomeProject].
@ProviderFor(fetchHomeProject)
final fetchHomeProjectProvider = AutoDisposeFutureProvider<HomeModel>.internal(
  fetchHomeProject,
  name: r'fetchHomeProjectProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$fetchHomeProjectHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef FetchHomeProjectRef = AutoDisposeFutureProviderRef<HomeModel>;
String _$fetchHomeCategoriesHash() =>
    r'0313a059bef8c248b7bb67e685225a98425f21a8';

/// See also [fetchHomeCategories].
@ProviderFor(fetchHomeCategories)
final fetchHomeCategoriesProvider =
    AutoDisposeFutureProvider<List<ProjectCategory>>.internal(
  fetchHomeCategories,
  name: r'fetchHomeCategoriesProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$fetchHomeCategoriesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef FetchHomeCategoriesRef
    = AutoDisposeFutureProviderRef<List<ProjectCategory>>;
String _$homeViewModelHash() => r'cd53de31ff3e3a0cdc321b7e5b8a16cd1349da04';

/// See also [HomeViewModel].
@ProviderFor(HomeViewModel)
final homeViewModelProvider =
    AutoDisposeNotifierProvider<HomeViewModel, HomeState?>.internal(
  HomeViewModel.new,
  name: r'homeViewModelProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$homeViewModelHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$HomeViewModel = AutoDisposeNotifier<HomeState?>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
