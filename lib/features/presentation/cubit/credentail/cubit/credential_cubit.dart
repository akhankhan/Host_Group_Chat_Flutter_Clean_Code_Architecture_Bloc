import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:host_group_chat/features/domin/entities/user_entity.dart';
import 'package:host_group_chat/features/domin/usecases/forgot_password_usecase.dart';
import 'package:host_group_chat/features/domin/usecases/get_create_current_user_usecase.dart';
import 'package:host_group_chat/features/domin/usecases/google_auth_usecase.dart';
import 'package:host_group_chat/features/domin/usecases/sign__up_usecase.dart';
import 'package:host_group_chat/features/domin/usecases/sign_in_usecase.dart';

part 'credential_state.dart';

class CredentialCubit extends Cubit<CredentialState> {
  final SignInUseCase signInUseCase;
  final SignUpUseCase signUpUseCase;
  final ForgotPasswordUseCase forgotPasswordUseCase;
  final GetCreateCurrentUserUseCase getCreateCurrentUserUseCase;
  final GoogleAuthUseCase googleAuthUseCase;
  CredentialCubit({
    required this.signInUseCase,
    required this.signUpUseCase,
    required this.forgotPasswordUseCase,
    required this.getCreateCurrentUserUseCase,
    required this.googleAuthUseCase,
  }) : super(CredentialInitial());

  Future<void> submitSignIn({required UserEntity user}) async {
    emit(CredentialLoading());
    try {
      await signInUseCase.signIn(user);
      emit(CredentialSuccess());
    } on SocketException catch (_) {
      emit(CredentialFailure());
    } catch (_) {
      emit(CredentialFailure());
    }
  }

  Future<void> submitSignUp({required UserEntity user}) async {
    emit(CredentialLoading());
    try {
      await signUpUseCase.signUp(user);
      await getCreateCurrentUserUseCase.getCreateCurrentUserUseCase(user);
      emit(CredentialSuccess());
    } on SocketException catch (_) {
      emit(CredentialFailure());
    } catch (_) {
      emit(CredentialFailure());
    }
  }

  Future<void> submitGoogleAuth() async {
    emit(CredentialLoading());
    try {
      googleAuthUseCase.googleAuth();
      emit(CredentialSuccess());
    } on SocketException catch (_) {
      emit(CredentialFailure());
    } catch (_) {
      emit(CredentialFailure());
    }
  }

  Future<void> forgotPassword({required UserEntity user}) async {
    try {
      forgotPasswordUseCase.forgotPassword(user.email!);
    } on SocketException catch (_) {
      emit(CredentialFailure());
    } catch (_) {
      emit(CredentialFailure());
    }
  }
}
