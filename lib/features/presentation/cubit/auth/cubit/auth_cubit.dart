import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:host_group_chat/features/domin/usecases/get_current_user_id.dart';
import 'package:host_group_chat/features/domin/usecases/is_sign_in_usecase.dart';
import 'package:host_group_chat/features/domin/usecases/sign_out_usecase.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final IsSignInUseCase isSignInUseCase;
  final GetCurrentUserIdUseCase getCurrentUserIdUseCase;
  final SignOutUseCase signOutUseCase;

  AuthCubit(
      {required this.isSignInUseCase,
      required this.getCurrentUserIdUseCase,
      required this.signOutUseCase})
      : super(AuthInitial());

  Future<void> appStarted() async {
    try {
      // isSignInUseCase(); //or // then we use call() instead of isSignIn
      final isSignIn = await isSignInUseCase.call();

      if (isSignIn) {
        final uid = await getCurrentUserIdUseCase.call();
        emit(AuthenticatedState(uid: uid));
      } else {
        emit(UnAuthenticatedState());
      }
    } on SocketException catch (_) {
      emit(UnAuthenticatedState());
    }
  }

  Future<void> loggedIn() async {
    try {
      final uid = await getCurrentUserIdUseCase.call();
      emit(AuthenticatedState(uid: uid));
    } catch (_) {
      emit(UnAuthenticatedState());
    }
  }

  Future<void> loggedOut() async {
    try {
      await signOutUseCase.signOutUseCase();
      emit(UnAuthenticatedState());
    } catch (_) {
      emit(UnAuthenticatedState());
    }
  }
}
