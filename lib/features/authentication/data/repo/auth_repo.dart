import 'dart:ui';

import 'package:dial_my_fable/features/authentication/authentication.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepo {
  final FirebaseAuth _auth;
  int? _resendToken;
  String? _verificationId;

  AuthRepo(this._auth);

  Future<void> sendOtp(
    String phoneNo,
    Function(int resendToken) isCodeSent,
    VoidCallback onError,
    void Function(String) register,
  ) async {
    await _auth.verifyPhoneNumber(
      phoneNumber: '+91${phoneNo.trim()}',
      timeout: const Duration(seconds: 30),
      verificationCompleted: (PhoneAuthCredential phoneAuthCredential) async {
        final userCredentials = await _auth.signInWithCredential(phoneAuthCredential);
        handlePostLogin(userCredentials, register);
      },
      verificationFailed: (FirebaseAuthException error) {
        onError();
        throw error;
      },
      codeSent: (String verificationId, int? forceResendingToken) {
        _resendToken = forceResendingToken;
        _verificationId = verificationId;
        if (_resendToken != null) {
          isCodeSent(_resendToken!);
        }
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        _verificationId = verificationId;
      },
      forceResendingToken: _resendToken,
    );
  }

  Future<void> verifyOtp(
    String otp,
    void Function(String) register,
  ) async {
    final credential = PhoneAuthProvider.credential(verificationId: _verificationId ?? '', smsCode: otp);
    final userCredential = await _auth.signInWithCredential(credential);
    handlePostLogin(userCredential, register);
  }

  Future<void> handlePostLogin(
    UserCredential userCredential,
    void Function(String) register,
  ) async {
    final user = userCredential.user;
    if (user != null) {
      final firebaseUser = user;
      final appUser = AppUser(
        id: firebaseUser.uid,
        mobileNumber: firebaseUser.phoneNumber!,
      );
      AuthCubit.instance.login(appUser);
    }
  }

  Future<void> logout() => _auth.signOut();
}
