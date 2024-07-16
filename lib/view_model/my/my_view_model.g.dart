// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_view_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MyPageStateImpl _$$MyPageStateImplFromJson(Map<String, dynamic> json) =>
    _$MyPageStateImpl(
      loginState: json['loginState'] as bool?,
      loginModel: json['loginModel'] == null
          ? null
          : LoginModel.fromJson(json['loginModel'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$MyPageStateImplToJson(_$MyPageStateImpl instance) =>
    <String, dynamic>{
      'loginState': instance.loginState,
      'loginModel': instance.loginModel,
    };

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$myPageViewModelHash() => r'f06fa0e6934045012ce7022ce1ddf8d8d9e2de77';

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
