import 'package:dial_my_fable/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../authentication.dart';
import '../data/repo/auth_repo.dart';

part 'auth_cubit.freezed.dart';
part 'auth_cubit.g.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState(
      {AppUser? user,
      String? phoneNumber,
      int? resendToken,
      @Default(false) bool isNewUser,
      @Default(false) bool isOtpRequested}) = _AuthState;

  factory AuthState.fromJson(Map<String, dynamic> json) => _$AuthStateFromJson(json);
}

class AuthCubit extends HydratedCubit<AuthState> with CubitMaybeEmit {
  ///Singleton
  static AuthCubit get instance => _instance;
  static final AuthCubit _instance = AuthCubit._internal();
  late final AuthRepo _authRepo;

  AuthCubit._internal() : super(const AuthState());

  void init(AuthRepo authRepo) {
    _authRepo = authRepo;
  }

  bool get isSignedIn => state.user != null;

  void login(AppUser user) => emit(state.copyWith(user: user));

  Future<void> logout() async {
    await _authRepo.logout();
    emit(state.copyWith(user: null));
  }

  FormGroup formBuilder() => fb.group({
        'phone': FormControl<String>(
          validators: [
            Validators.required,
            Validators.minLength(10),
          ],
        ),
      });

  Future<void> loginWithPhone(String phone) async {
    emit(state.copyWith(isOtpRequested: true));
    await _authRepo.sendOtp(
      phone,
      (resendToken) => emit(
        state.copyWith(phoneNumber: phone, isOtpRequested: false, resendToken: resendToken),
      ),
      () => emit(
        state.copyWith(
          isOtpRequested: false,
        ),
      ),
      (uid) {},
    );
  }

  verifyOtp(String otp) async {
    debugPrint(otp);
    await _authRepo.verifyOtp(
      otp,
      (uid) {},
    );
  }

  @override
  Map<String, dynamic>? toJson(AuthState state) {
    final map = state.toJson();
    map.remove('isOtpRequested');
    map.remove('phoneNumber');
    map.remove('resendToken');
    return map;
  }

  @override
  AuthState? fromJson(Map<String, dynamic> json) => AuthState.fromJson(json);

  Future<void> resendOtp() async {
    await _authRepo.sendOtp(
      state.phoneNumber!,
      (resendToken) => emit(
        state.copyWith(phoneNumber: state.phoneNumber, isOtpRequested: false, resendToken: resendToken),
      ),
      () => emit(
        state.copyWith(
          isOtpRequested: false,
        ),
      ),
      (uid) {},
    );
  }
}
