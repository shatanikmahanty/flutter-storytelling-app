import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'splash_cubit.freezed.dart';
part 'splash_cubit.g.dart';

@freezed
class SplashState with _$SplashState {
  const factory SplashState({
    bool? isLoading,
  }) = _SplashState;

  factory SplashState.fromJson(Map<String, dynamic> json) => _$SplashStateFromJson(json);
}

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(const SplashState());

  void setLoading(bool isLoading) => emit(state.copyWith(isLoading: isLoading));

  Future<void> startLoading() async {
    await Future.delayed(const Duration(seconds: 2));
    emit(state.copyWith(isLoading: false));
  }
}
