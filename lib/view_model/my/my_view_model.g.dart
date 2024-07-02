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

String _$myPageViewModelHash() => r'ec6f079fceaf60c2a8d7b609c2a407896b6593d3';

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
