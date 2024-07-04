// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_view_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MyPageStateImpl _$$MyPageStateImplFromJson(Map<String, dynamic> json) =>
    _$MyPageStateImpl(
      loginState: json['loginState'] as bool?,
    );

Map<String, dynamic> _$$MyPageStateImplToJson(_$MyPageStateImpl instance) =>
    <String, dynamic>{
      'loginState': instance.loginState,
    };

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$myPageViewModelHash() => r'62997b21de3320ade36161dca3f7c6028eaf3bd6';

/// See also [MyPageViewModel].
@ProviderFor(MyPageViewModel)
final myPageViewModelProvider =
    AutoDisposeNotifierProvider<MyPageViewModel, MyPageState>.internal(
  MyPageViewModel.new,
  name: r'myPageViewModelProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$myPageViewModelHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$MyPageViewModel = AutoDisposeNotifier<MyPageState>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
